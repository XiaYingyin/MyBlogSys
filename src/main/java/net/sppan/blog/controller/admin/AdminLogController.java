package net.sppan.blog.controller.admin;

import com.sun.xml.internal.rngom.parse.host.Base;
import net.sppan.blog.common.JsonResult;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Blog;
import net.sppan.blog.entity.Logs;
import net.sppan.blog.service.LogService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@RequestMapping("/admin/log")
@Controller
public class AdminLogController extends BaseController {

    @Resource
    private LogService logService;

    @RequestMapping("/index")
    public String index() {
        return "admin/log/index";
    }

    @PostMapping("/list")
    @ResponseBody
    public Page<Logs> list() {
        PageRequest pageRequest = getPageRequest();
        Page<Logs> page = logService.findAll(pageRequest);
        return page;
    }

    @PostMapping("/{id}/del")
    @ResponseBody
    public JsonResult delete(
            @PathVariable Long id
    ){
        try {
            logService.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }
}
