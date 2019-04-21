package net.sppan.blog;

import net.sppan.blog.config.intercepter.CommonIntercepter;
import net.sppan.blog.config.intercepter.LoginIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;

@SpringBootApplication
public class BlogITApplication extends WebMvcConfigurerAdapter {
	
	@Autowired
    private CommonIntercepter commonInterceptor;
	@Resource
	private LoginIntercepter loginIntercepter;

	public static void main(String[] args) {
		SpringApplication.run(BlogITApplication.class, args);
	}
	
	  /**
     * add interceptors
     *
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        super.addInterceptors(registry);
        // 添加拦截器
        registry.addInterceptor(commonInterceptor)
                .addPathPatterns("/**");
        registry.addInterceptor(loginIntercepter).addPathPatterns("/admin/**")
        		.excludePathPatterns("/admin/login");
    }
}
