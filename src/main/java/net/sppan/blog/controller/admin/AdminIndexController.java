package net.sppan.blog.controller.admin;

import net.sppan.blog.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
// 用于处理博客欢迎页面的controller
@Controller
public class AdminIndexController extends BaseController {

	@GetMapping("/admin")
	public String index(ModelMap map) {
		map.addAttribute("menuList",findAllByMenu());
		map.addAttribute("user",getLoginUser());
		return "admin/index";
	}

	@GetMapping("/admin/welcome")
	public String welcome() {
		return "admin/welcome";
	}
}
