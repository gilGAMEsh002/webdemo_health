package controller;

import pojo.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String terms = request.getParameter("terms");
        HttpSession session = request.getSession();
        User user = null;
        System.out.println("设置user");
//        session.setMaxInactiveInterval(0);  设置session马上过期不行
        session.setAttribute("user",null);

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies) {
            if(Objects.equals(terms, "true")&&cookie.getName().equals("rememberUser")){
                cookie.setMaxAge(0);
                System.out.println("rememberUser的maxage:"+cookie.getMaxAge());
                response.addCookie(cookie);
            }
            if(cookie.getName().equals("autologin")){
                cookie.setMaxAge(0);
                System.out.println("autologin的maxage:"+cookie.getMaxAge());
                response.addCookie(cookie);
            }
        }
        System.out.println("跳转页面");
        response.sendRedirect("login.jsp");
        System.out.println("跳转成功");
    }
}
