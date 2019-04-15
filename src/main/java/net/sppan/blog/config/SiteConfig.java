package net.sppan.blog.config;

import net.sppan.blog.entity.Options;
import net.sppan.blog.lucene.SearcherKit;
import net.sppan.blog.service.BlogService;
import net.sppan.blog.service.OptionsService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.File;
import java.util.List;

@Component
public class SiteConfig implements InitializingBean{
	
	@Resource
	private OptionsService optionsService;

	@Resource
	private ServletContext servletContext;
	
	@Resource
	private SearcherKit searcherKit;
	
	@Resource
	private BlogService blogService;

	@Override
	public void afterPropertiesSet() throws Exception {
		setOptions();
		reloadIndex();
		
	}

	/**
	 * 设置系统基本属性到ServletContext中
	 */
	public void setOptions() {
		List<Options> list = optionsService.findAll();
		String path = servletContext.getRealPath("\\");

		for (Options options : list) {
			if(!isFile(path + list.get(6).getOptionValue())) {
				list.get(6).setOptionValue("/front/i/favicon.png");
			}
			servletContext.setAttribute(options.getOptionKey(), options.getOptionValue());
		}

	}

	private boolean isFile(String path) {
		File file = new File(path);
		if(file.exists()) {
			return false;
		}
		return true;
	}
	
	/**
	 * 重建所有文章索引
	 */
	private void reloadIndex() {
		searcherKit.reloadIndex(blogService.findAll());
	}
}
