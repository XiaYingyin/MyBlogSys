package net.sppan.blog.controller.front;

import net.sppan.blog.common.Constants;
import net.sppan.blog.entity.Blog;
import net.sppan.blog.entity.ResourceCategory;
import net.sppan.blog.service.BlogService;
import net.sppan.blog.service.ResourceCategoryService;
import net.sppan.blog.service.ResourceService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/resource")
public class ResourceController {
    @Resource
    private ResourceCategoryService resourceCategoryService;
    @Resource
    private ResourceService resourceService;

    @RequestMapping("/index")
    public String index(@RequestParam(required = false, defaultValue = "1") Integer p, ModelMap map) {
        PageRequest pageRequest = new PageRequest(p - 1, Constants.PAGE_SIZE);
        List<ResourceCategory> resourceCategoryList = resourceCategoryService.findAllResourceCategorys(0);
        Page<net.sppan.blog.entity.Resource> page = resourceService.findByStatus(pageRequest);
        map.put("categorys", resourceCategoryList);
        map.put("page", page);
        return "front/resource/index";
    }

    @RequestMapping("/c/{id}")
    public String showResources(@PathVariable("id") Long id, ModelMap map) {
        return null;
    }
}
