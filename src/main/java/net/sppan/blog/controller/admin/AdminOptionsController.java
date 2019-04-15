package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.config.BlogProperties;
import net.sppan.blog.config.SiteConfig;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Options;
import net.sppan.blog.exception.ServiceException;
import net.sppan.blog.service.OptionsService;
import net.sppan.blog.utils.FileUtil;
import net.sppan.blog.utils.QiniuUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
@RequestMapping("/admin/system")
public class AdminOptionsController extends BaseController {

    @Resource
    private OptionsService optionsService;

    @Resource
    private SiteConfig siteConfig;

    @Resource
    private BlogProperties blogProperties;

    @GetMapping("/index")
    public String index() {
        return "admin/system/index";
    }
    @GetMapping("{id}/upload")
    public String upload(@PathVariable("id") Long id,ModelMap map) {
        map.put("id", id);
        return "admin/system/upload";
    }
    @PostMapping("/list")
    @ResponseBody
    public Page<Options> list() {
        PageRequest pageRequest = getPageRequest();
        Page<Options> page = optionsService.findAll(pageRequest);
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required=false) Long id,
                       ModelMap map
    ){
        if(id != null){
            Options options = optionsService.findById(id);
            map.put("options", options);
        }
        return "admin/system/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Options options){
        try {
            optionsService.saveOrUpdate(options);
        }catch (ServiceException e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        siteConfig.setOptions();
        return JsonResult.ok();
    }


    @PostMapping("/upload/{id}")
    @ResponseBody
    public JsonResult upload(@RequestParam("file") MultipartFile file,@PathVariable("id") Long id){
        Options options = optionsService.findByOptionKey(optionsService.findById(id).getOptionKey());
        System.err.println(id);
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
            newFileName = FileUtil.generateFileName(id, extName);
            FileUtil.uploadFile(file.getBytes(),blogProperties.getFileUploadPath(),newFileName);
            String key = options.getOptionValue().substring(options.getOptionValue().lastIndexOf("/") + 1);
            //先删除文件在上传文件
            QiniuUtils.deleteFile(key,"luoyuanxiang");
            String name = QiniuUtils.upload2qiniu(blogProperties.getFileUploadPath() + newFileName,"luoyuanxiang");
            options.setOptionValue(QiniuUtils.UPLODURL + name);
            optionsService.saveOrUpdate(options);
            siteConfig.setOptions();
            FileUtil.deleteFile(blogProperties.getFileUploadPath() + newFileName);
            return JsonResult.create("success", true).set("msg", "上传成功");
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.create("success",false).set("msg", e.getMessage());
        }
    }

}
