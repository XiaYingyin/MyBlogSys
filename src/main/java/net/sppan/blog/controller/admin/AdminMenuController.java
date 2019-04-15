package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Menu;
import net.sppan.blog.exception.ServiceException;
import net.sppan.blog.service.MenuService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController extends BaseController {
    @Resource
    private MenuService menuService;

    @GetMapping("/index")
    public String index() {
        return "admin/menu/index";
    }

    @PostMapping("/list")
    @ResponseBody
    public Page<Menu> list() {
        PageRequest pageRequest = getPageRequest("sort");
        Page<Menu> page = menuService.findAll(pageRequest);
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required=false) Long id,
                       ModelMap map
    ){
        if(id != null){
            Menu menu = menuService.findById(id);
            map.put("menu", menu);
        }
        return "admin/menu/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Menu menu){
        try {
            menuService.saveOrUpdate(menu);
        }catch (ServiceException e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }
}
