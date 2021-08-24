package com.lh.util.loginInfo;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author DT
 * @version 1.0
 * @description: TODOS
 * @date 2021/7/22 16:33
 */
public class SessionInterceptor implements HandlerInterceptor {
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
    }

    @Override
    public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
        //首页路径以及登录放行
        if ("/index".equals(arg0.getRequestURI()) || "/login".equals(arg0.getRequestURI())) {
            return true;
        }
        //重定向
        Object object = arg0.getSession().getAttribute("users");
        if (null == object) {
            arg1.sendRedirect("/login");
            return false;
        }
        return true;
    }
}