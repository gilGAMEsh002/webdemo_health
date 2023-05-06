package controller;

import pojo.User;
import service.impl.UserServiceImpl;
import utils.MD5;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //封装到user中,注意封装时密码使用md5格式的
        String password_md5 = MD5.stringToMD5(password);
        User user = new User(username,password_md5);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();


        //调用service
        User flagUser = new UserServiceImpl().login(user);
//            User flagUser = user;

        //登陆成功,用户信息放入session中
        if(flagUser!=null){
            session.setAttribute("user",flagUser);

            boolean isRemember = Boolean.parseBoolean(request.getParameter("remember"));
            if(isRemember){
                Cookie rememberUserCookie = new Cookie("rememberUser",username+"&"+password);
                response.addCookie(rememberUserCookie);
            }

            response.sendRedirect("index.jsp");
        } else{
            out.println("<script>alert(\"用户名或密码错误！\");location.href = \"login.jsp\";</script>");
        }



    }
}
