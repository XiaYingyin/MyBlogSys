package net.sppan.blog.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sppan.blog.common.Constants;
import net.sppan.blog.entity.Blog;
import net.sppan.blog.service.BlogService;

import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapperBuilder;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
// 自定义标签“list”
// 用于显示主页的博客列表
@Component
public class BlogDirective implements TemplateDirectiveModel{
	
	@Resource
	private BlogService blogService;

	@Override
	public void execute(Environment environment, @SuppressWarnings("rawtypes") Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
		List<Blog> list = new ArrayList<Blog>();
		if(params != null && params.containsKey("type")){
			String type = params.get("type").toString();
			
			if("views".equalsIgnoreCase(type)){
				list = blogService.findHotN(Constants.PAGE_SIZE);
			}
			
			if("featured".equalsIgnoreCase(type)){
				list = blogService.findFeaturedN(Constants.PAGE_SIZE);
			}
			
			environment.setVariable("list", new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build().wrap(list));
			if (templateDirectiveBody != null) {
				templateDirectiveBody.render(environment.getOut());
			}
		}
	}

}
