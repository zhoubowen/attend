package com.attend.interceptor;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /*HttpServletRequest httpRequest = (HttpServletRequest) request;
         HttpServletResponse httpResponse = (HttpServletResponse) response;*/
        String urlString = request.getRequestURI();

        //模拟登录页
        if(urlString.endsWith("/admin/") ||  urlString.endsWith("/member/loginInput/")){
            return true;
        }
        //请求的路径
        String contextPath=request.getContextPath();

        /*httpRequest.getRequestDispatcher("/olForum/forumList").forward(httpRequest, httpResponse);*/
        /*response.sendRedirect(contextPath+"/olForum/forumList.html");*/
        response.sendRedirect(contextPath + "/admin/");
        return false;
        /*httpResponse.sendRedirect(httpRequest.getContextPath()+"/olForum/forumList.html");
        return;*/
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {

    }
}
