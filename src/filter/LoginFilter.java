package filter;

import pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.awt.*;
import java.io.IOException;
import java.util.Arrays;

@WebFilter(filterName = "LoginFilter", urlPatterns="/*", initParams = {@WebInitParam(name = "exceptUrl", value = "/LoginServlet&/RegisterServlet&/register.jsp&/login.jsp&/code.jsp")})
public class LoginFilter implements Filter {
    private String[] exceptUrls;
    public void init(FilterConfig config) throws ServletException {
        //获取不过滤的url

        String exceptUrl = config.getInitParameter("exceptUrl");
        exceptUrls = exceptUrl.split("&");
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        System.out.println("LoginFilter");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;


        System.out.print("请求发自"+httpRequest.getServletPath());
        if(Arrays.asList(exceptUrls).contains(httpRequest.getServletPath())) {//判断发出请求的是否是需要过滤的
            chain.doFilter(request,response);
            System.out.println("不需要过滤");
            return;
        }

        System.out.println("需要过滤");



        //需要过滤的url 验证用户是否已登录
        HttpSession session = httpRequest.getSession();
        User user = null;
        user = (User) session.getAttribute("user");
        if(user!=null){
            System.out.println("用户已登录");
            //已登录
            chain.doFilter(request,response);
            return;
        }else {
            System.out.println("用户未登录");
            httpResponse.sendRedirect("login.jsp");
        }

    }
    }
