package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.config.BlogProperties;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Options;
import net.sppan.blog.entity.User;
import net.sppan.blog.service.UserService;
import net.sppan.blog.utils.FileUtil;
import net.sppan.blog.utils.IpKit;
import net.sppan.blog.utils.MD5Kit;
import net.sppan.blog.utils.QiniuUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController extends BaseController {
	@Resource
	private UserService userService;

	@Resource
	private BlogProperties blogProperties;

	@GetMapping("/index")
	public String index() {
		return "admin/user/index";
	}

	@PostMapping("/list")
	@ResponseBody
	public Page<User> list() {
		PageRequest pageRequest = getPageRequest();
		Page<User> page = userService.findAll(pageRequest);
		return page;
	}

	@GetMapping("/form")
	public String form(@RequestParam(required=false) Long id,
			ModelMap map
			){
		if(id != null){
			User user = userService.findById(id);
			map.put("user", user);
		}
		return "admin/user/form";
	}
	
	@PostMapping("/save")
	@ResponseBody
	public JsonResult save(User user, HttpServletRequest request){
		String password  = null;
		User loginUser = getLoginUser();
		if(user.getId() != null) {
			if(!loginUser.getPassword().equals(user.getPassword())) {
				password = MD5Kit.generatePasswordMD5(user.getPassword(),user.getSalt());
			} else {
				password = loginUser.getPassword();
			}
		} else {
		      password =MD5Kit.generatePasswordMD5(user.getPassword(),user.getSalt());
		}

		try {
			String ip = IpKit.getRealIp(request);
			user.setPassword(password);
			user.setIp(ip);
			userService.saveOrUpdate(user);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
	}
	
	@PostMapping("/{id}/del")
	@ResponseBody
	public JsonResult delete(
			@PathVariable Long id
			){
		try {
			userService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
	}

	@RequestMapping("/uploadImg")
	public String uploadImg() {

		return "admin/user/upload";
	}

	@PostMapping("/upload")
	@ResponseBody
	public JsonResult upload(@RequestParam("file") MultipartFile file){
		User byId = userService.findById(getLoginUser().getId());
		System.err.println(getLoginUser().getId());
		System.err.println(file.getOriginalFilename());
		String newFileName;
		try {
			if(!isLogin()){
				return JsonResult.create("success", false).set("msg", "没有登录不能上传文件");
			}
			if (null == file) {
				return JsonResult.create("success",false).set("msg", "上传文件为 null");
			}
			System.out.println("路径【" + blogProperties.getFileUploadPath() + "】");
			// 获取上传的文件名
			String fileName = file.getOriginalFilename();
			// 获取文件的后缀名
			String extName = fileName .substring(fileName.lastIndexOf("."));
			// 生成的文件名
			newFileName = FileUtil.generateFileName(getLoginUser().getId(), extName);
			FileUtil.uploadFile(file.getBytes(),blogProperties.getFileUploadPath(),newFileName);
			String key = byId.getUrl().substring(byId.getUrl().lastIndexOf("/") + 1);
			//先删除文件在上传文件
			QiniuUtils.deleteFile(key,"luoyuanxiang");
			String name = QiniuUtils.upload2qiniu(blogProperties.getFileUploadPath() + newFileName,"luoyuanxiang");
			byId.setUrl(QiniuUtils.UPLODURL + name);
			userService.saveOrUpdate(byId);
			FileUtil.deleteFile(blogProperties.getFileUploadPath() + newFileName);
			return JsonResult.create("success", true).set("msg", "上传成功");
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.create("success",false).set("msg", e.getMessage());
		}
	}
}
