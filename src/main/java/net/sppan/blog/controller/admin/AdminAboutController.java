package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.service.OptionsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/admin/about")
public class AdminAboutController extends BaseController{
	
	@Resource
	private OptionsService optionsService;
	
	@RequestMapping("/index")
	public String index(){
		return "admin/about/index";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public JsonResult save(
			String content
			){
		try {
			optionsService.saveAboutMe(content);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
		
	}
}
