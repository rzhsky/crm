package top.orz.crm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest Request, HttpServletResponse Response, Object o) throws Exception {
        System.out.println("preHandle起作用了");
        HttpSession session=Request.getSession();
        System.out.println(session.getAttribute("employee"));
        if (session.getAttribute("employee")!=null){
            return true;
        }else {
            System.out.println("拦截器起作用了");
            Request.getRequestDispatcher("/login.jsp").forward(Request,Response);
            //Response.sendRedirect(Request.getContextPath()+"/login.jsp");
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle起作用了");

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
       System.out.println("afterCompletion");

    }
}
