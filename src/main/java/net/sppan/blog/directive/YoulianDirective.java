package net.sppan.blog.directive;

import freemarker.core.Environment;
import freemarker.template.*;
import net.sppan.blog.entity.Youlian;
import net.sppan.blog.service.YoulianService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Component
public class YoulianDirective implements TemplateDirectiveModel{

	@Resource
	private YoulianService youlianService;
	
	@Override
	public void execute(Environment environment, @SuppressWarnings("rawtypes") Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
		
		List<Youlian> list = youlianService.findAllVisiable();
		environment.setVariable("list", new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build().wrap(list));
        if (templateDirectiveBody != null) {
            templateDirectiveBody.render(environment.getOut());
        }
		
	}

}
