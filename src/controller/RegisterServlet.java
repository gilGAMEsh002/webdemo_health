package controller;

import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;
import utils.DbUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("RegisterServlet");
        //获取数据,设置编码方式
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String email = request.getParameter("email");

//        byte[] bytes = username.getBytes(StandardCharsets.ISO_8859_1);
//        username = new String(bytes, StandardCharsets.UTF_8);
        //设置响应的编码格式
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        //封装数据(或许可以做个BeanUtil专门用于封装数据)
        User user = new User(username,password,email);

        //调用service进行注册,返回布尔型看是否成功
        boolean flag = false;
        try {
            flag = new UserServiceImpl().regist(user);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        //根据返回值,提示信息
        if(!flag){
            out.println("<script>alert(\"此用户已注册！\");location.href = \"register.jsp\";</script>");
        }else {
            //注册成功,跳转到登录界面
            response.sendRedirect("login.jsp");
        }

    }
}
