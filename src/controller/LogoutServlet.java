package controller;

import pojo.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = null;
        System.out.println("设置user");
//        session.setMaxInactiveInterval(0);  设置session马上过期不行
        session.setAttribute("user",user);
//        Cookie[] cookies = request.getCookies();
//        for (Cookie cookie:cookies) {
//            cookie.setMaxAge(0);
//        }
        System.out.println("跳转页面");
        response.sendRedirect("index.jsp");
        System.out.println("跳转成功");
    }
}
