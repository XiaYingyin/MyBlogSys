package net.sppan.blog.controller.admin;

import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Youlian;
import net.sppan.blog.service.YoulianService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

// 用于友情链接页面的controller
@Controller
@RequestMapping("/admin/youlian")
public class AdminYoulianController extends BaseController {
    @Resource
    private YoulianService youlianService;

    @GetMapping("/index")
    public String index() {
        return "admin/youlian/index";
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Long id, ModelMap map) {
        if (id != null) {
            Youlian youlian = youlianService.findById(id);
            map.put("youlian", youlian);
        }
        return "admin/youlian/form";
    }
}
