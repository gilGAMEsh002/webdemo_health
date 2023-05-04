package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String username = request.getParameter("username");

            //封装到user中,注意封装时密码使用md5格式的

        //调用service


        //登陆成功,用户信息放入session中


        //是否勾选记住密码


        //重定向到主页

        //登录失败
    }
}
