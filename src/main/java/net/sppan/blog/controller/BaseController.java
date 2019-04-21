package net.sppan.blog.controller;

import net.sppan.blog.common.Constants;
import net.sppan.blog.entity.Menu;
import net.sppan.blog.entity.User;
import net.sppan.blog.service.MenuService;
import net.sppan.blog.utils.CacheKit;
import net.sppan.blog.utils.CookieKit;
import net.sppan.blog.utils.StrKit;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

// 定义基类controller，包含基本的功能
public class BaseController {
	@Resource
	private HttpServletRequest request;
	@Resource
	private HttpServletResponse response;
	@Resource
	private MenuService menuService;
	@Resource
	private CacheKit cacheKit;
	private User loginUser = null;

	public List<Menu> findAllByMenu() {
		Sort sort = new Sort(Sort.Direction.ASC,"sort");
		return menuService.findAllByMenu(sort);
	}

	public User getLoginUser() {
		String sessionId = CookieKit.getSessionIdFromCookie(request, response);
		if (sessionId != null) {
			Object object = cacheKit.get(Constants.CACHE_LOGINUSER, sessionId);
			if (object != null) {
				loginUser = (User) object;
			}
		}
		return loginUser;
	}
	
	public boolean isLogin() {
		return getLoginUser() != null;
	}

	public boolean notLogin() {
		return !isLogin();
	}
	
	protected PageRequest getPageRequest(String ... sort){
		Integer pageNumber = 0;
		String pageNumberStr = request.getParameter("pageNumber");
		if(!StrKit.isBlank(pageNumberStr)){
			pageNumber = Integer.parseInt(pageNumberStr) - 1;
		}
		
		Integer pageSize = 10;
		String pageSizeStr = request.getParameter("pageSize");
		if(!StrKit.isBlank(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		if(sort.length > 0) {
			Sort sort1 = new Sort(Sort.Direction.ASC, sort);
			return new PageRequest(pageNumber, pageSize,sort1);
		}
		return new PageRequest(pageNumber, pageSize);
	}
}
