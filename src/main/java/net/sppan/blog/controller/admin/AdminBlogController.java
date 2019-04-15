package net.sppan.blog.controller.admin;

import net.sppan.blog.common.JsonResult;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Blog;
import net.sppan.blog.entity.Category;
import net.sppan.blog.service.BlogService;
import net.sppan.blog.service.CategoryService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController extends BaseController{
	
	@Resource
	private BlogService blogService;
	
	@Resource
	private CategoryService categoryService;
	
	@RequestMapping("/index")
	public String index(){
		return "admin/blog/index";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Page<Blog> list() {
		PageRequest pageRequest = getPageRequest();
		Page<Blog> page = blogService.findAll(pageRequest);
		return page;
	}
	
	@RequestMapping("/form")
	public String form(@RequestParam(required=false) Long id,
			ModelMap map
			){
		List<Category> categories = categoryService.findVisible();
		map.put("categories", categories);
		
		if(id != null){
			Blog blog = blogService.findById(id);
			map.put("blog", blog);
		}
		return "admin/blog/form";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public JsonResult save(Blog blog){
		try {
			blog.setAuthor(getLoginUser());
			blogService.saveOrUpdate(blog);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
	}
	
	@RequestMapping("/{id}/change")
	@ResponseBody
	public JsonResult change(@PathVariable Long id,String type){
		try {
			blogService.change(id,type);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
	}
	
	@RequestMapping("/{id}/del")
	@ResponseBody
	public JsonResult delete(
			@PathVariable Long id
			){
		try {
			blogService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.fail(e.getMessage());
		}
		return JsonResult.ok();
	}
}
