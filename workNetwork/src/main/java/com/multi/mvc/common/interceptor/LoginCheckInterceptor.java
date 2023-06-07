package com.multi.mvc.common.interceptor;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.multi.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

//■ Spring에서 흐름 제어가 일반적이지 않고 패턴이나 URL로 제어가 되는 방법
//1. 서블릿-필터 : 서블릿에서 사용하는 방법이고, Spring에서는 별도로 사용하지 않음, 단 전체 인코딩 정도로 활용 가능
//2. AOP : 특정 package와 메소드 패턴을 통해 흐름 제어하는 방법, log나 보안기능 등 기능을 담당할수 있다.
//3. 인터셉터 : 필터의 Spring 버전으로 특정 URL 패턴을 통해 흐름제어하는 방법. AOP와 다르게 URL 제어가 필요할때

//@Intercepts(value = )
@Slf4j
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	// preHandle : 대상 컨트롤러가 실행되기 이전에 호출되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle 호출!");
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		if(loginMember == null) {
			request.setAttribute("msg", "먼저 로그인을 해주세요.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false; // false가 되면 이후 Controller가 호출되지 않음
		}
		return super.preHandle(request, response, handler);
	}
	
	// postHandle : 컨트롤러가 실행된 이후 호출되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("postHandle 호출!");
		super.postHandle(request, response, handler, modelAndView);
	}
	
	// afterCompletion : 컨트롤러에서 JSP(View)가 왼성되고 직후에 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.debug("afterCompletion 호출!");
		super.afterCompletion(request, response, handler, ex);
	}
	
	// afterConcurrentHandlingStarted : 컨트롤러가 AJAX나 페이징을 직접 그릴때 afterCompletion 대신
	// 호출하는 메소드
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("afterConcurrentHandlingStarted 호출!");
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}
