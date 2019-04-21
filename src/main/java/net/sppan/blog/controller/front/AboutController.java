package net.sppan.blog.controller.front;

import net.sppan.blog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
// 关于页面的controller
@Controller
@RequestMapping("/about")
public class AboutController {

    @Resource
    private UserService userService;

    @RequestMapping("/index")
    public String about(ModelMap modelMap) {
        modelMap.addAttribute("user",userService.findById(Long.parseLong("1")));
        return "front/about/index";
    }
}
