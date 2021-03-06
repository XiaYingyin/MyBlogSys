package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Youlian;
import net.sppan.blog.service.YoulianService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * create by SPPan 2018/1/10
 *
 */
@RestController
@RequestMapping("/ajax/admin/youlian")
public class _AjaxYoulianController extends BaseController {
    @Resource
    private YoulianService youlianService;

    @RequestMapping("/list")
    public Page<Youlian> list() {
        PageRequest pageRequest = getPageRequest();
        Page<Youlian> page = youlianService.findAll(pageRequest);
        return page;
    }

    @RequestMapping("/save")
    public JsonResult save(Youlian youlian) {
        try {
            youlianService.saveOrUpdate(youlian);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @RequestMapping("/{id}/del")
    public JsonResult delete(@PathVariable Long id) {
        try {
            youlianService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @RequestMapping("/{id}/changeStatus")
    public JsonResult changeStatus(@PathVariable Long id) {
        try {
            youlianService.changeStatus(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }
}
