package net.sppan.blog.controller.front;

import javax.annotation.Resource;

import net.sppan.blog.entity.Blog;
import net.sppan.blog.lucene.SearcherKit;
import net.sppan.blog.service.BlogService;
import net.sppan.blog.utils.StrKit;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
// 用于主页搜索栏的controller
@Controller
public class SearchController {
	
	@Resource
	private BlogService blogService;
	
	@Resource
	private SearcherKit searcherKit;

	@RequestMapping("/s")
	public String index(
			@RequestParam String keyword,
			@RequestParam(required = false,defaultValue="1") Integer p,
			ModelMap map 
			){
		if(StrKit.isBlank(keyword)){
			return "redirect:/";
		}
		map.put("keyWord", keyword);
		Page<Blog> page = searcherKit.search(p, 10, keyword);
		map.put("page", page);
		return "front/search/index";
	}
}
