package com.david.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.david.common.Util.WebUtil;

@Component("webInterceptor")
public class WebInterceptor extends HandlerInterceptorAdapter {

	protected final Logger log = LoggerFactory.getLogger(this.getClass());

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("#");
			log.debug("# REQUEST URL: {}, METHOD : {}", WebUtil.getCurrentRequestURL(),request.getMethod());
			log.debug("#");
		}
		
		String uri = request.getRequestURI();
		
		if(WebUtils.getSessionAttribute(request, "activeUser") == null
			&& (StringUtils.contains(uri, "/admin")  // 관리자 페이지이고
					&& !StringUtils.contains(uri, "/admin/login") // 로그인 주소 제외
					&& !StringUtils.contains(uri, "/admin/logout") // 로그아웃 주소 제외
				)
		){
			
			response.sendRedirect(request.getContextPath()+"/admin/login");
			
			return false;
		}
		

		return true;
	}
}

