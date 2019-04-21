package net.sppan.blog.controller.front;

import net.sppan.blog.controller.BaseController;
import net.sppan.blog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
// 用于处理主页的controller
@Controller
public class IndexController extends BaseController{

	@RequestMapping(value = {"/","/b"})
	public String index() {
		return "redirect:/b/index";
	}

	@RequestMapping("/talk")
	public String talk() {
		return "front/talk/index";
	}

	@RequestMapping("/resource")
	public String resource() {
		return "redirect:/resource/index";
	}

	@RequestMapping("/interview")
	public String interview() {
		return "front/interview/index";
	}

	@RequestMapping("/about")
	public String about() {
		return "redirect:/about/index";
	}

	@RequestMapping("/album")
	public String album() {
		return "redirect:/album/index";
	}
}
