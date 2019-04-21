package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.config.BlogProperties;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Files;
import net.sppan.blog.exception.ServiceException;
import net.sppan.blog.service.FilesService;
import net.sppan.blog.utils.FileUtil;
import net.sppan.blog.utils.QiniuUtils;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
// 用于处理图片上传的controller
@Controller
@RequestMapping("/admin/files")
public class AdminFilesController extends BaseController{

    @Resource
    private FilesService filesService;

    @Resource
    private BlogProperties blogProperties;

    @RequestMapping("/index")
    public String index() {
        return "admin/files/index";
    }

    @PostMapping("/list")
    @ResponseBody
    public Page<Files> list() {
        return filesService.findAll(getPageRequest());
    }

    @GetMapping("/form")
    public String form(@RequestParam(required=false) Long id,
                       ModelMap map
    ){
        if(id != null) {
            Files one = filesService.getFiles(id);
            map.addAttribute("album",one);
        }
        return "admin/files/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Files files){
        try {
            filesService.saveOrUpdate(files);
        }catch (ServiceException e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }
    @RequestMapping("/uploadImg")
    public String upload(@RequestParam(value = "id",required = false)Long id, ModelMap map) {
        map.addAttribute("id",id);
        return "admin/files/upload";
    }

    @PostMapping("/upload")
    @ResponseBody
    public JsonResult upload1(@RequestParam("file") MultipartFile file, @RequestParam(value = "id",required = false)Long id){
        String newFileName;
        Map<String,Object> map = new HashMap<>();
        try {
            System.out.println("路径【" + blogProperties.getFileUploadPath() + "】");
            // 获取上传的文件名
            String fileName = file.getOriginalFilename();
            // 获取文件的后缀名
            String extName = fileName .substring(fileName.lastIndexOf("."));
            // 生成的文件名
            newFileName = FileUtil.generateFileName(getLoginUser().getId(), extName);
            file.transferTo(new File(blogProperties.getFileUploadPath(),newFileName));
            if(id != null) {
                Files one = filesService.getFiles(id);
                String key = one.getSrc().substring(one.getSrc().lastIndexOf("/") + 1);
                //先删除文件在上传文件
                QiniuUtils.deleteFile(key,"album");
            }
            String name = QiniuUtils.upload2qiniu(blogProperties.getFileUploadPath() + newFileName,"album");
            String path = QiniuUtils.ALBUMURL + name;
            FileUtil.deleteFile(blogProperties.getFileUploadPath() + newFileName);
            map.put("msg", "上传成功");
            map.put("path",null);
            return JsonResult.create("success", true).set(map);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", e.getMessage());
            return JsonResult.create("success",false).set(map);
        }
    }

    @RequestMapping("/{id}/change")
    @ResponseBody
    public JsonResult change(@PathVariable Long id,String type){
        try {
            filesService.change(id,type);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }
    
    @RequestMapping("/{id}/del")
	@ResponseBody
	public JsonResult delete(
			@PathVariable Long id
			){
		try {
			filesService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
	}
}
