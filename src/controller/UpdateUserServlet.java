package controller;

import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet(name = "UpdateUserServlet", value = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("updateUserServlet");
        //获取数据,设置编码方式
        String newUserName = request.getParameter("newname");
        String newPassword = request.getParameter("newpassword");
        String confirm_newPassword = request.getParameter("confirm_newpassword");
        String newMail = request.getParameter("newmail");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        User oldUser = (User) session.getAttribute("user");
        UserServiceImpl userService = new UserServiceImpl();

        User newUser = null;
        if(newUserName!=null){
            try {
                System.out.println("username");
                newUser = userService.updateUserName(oldUser,newUserName);
                if(newUser==null){
                    out.println("<script>alert(\"此用户名已被占用！\");location.href = \"user.jsp\";</script>");
                }else{
                    System.out.println("(servlet)用户名更新成功");
                    session.setAttribute("user",newUser);
                    Cookie[] cookies = request.getCookies();
                    if(cookies!=null){
                        for (Cookie cookie:cookies) {//查找cookie中记住的用户名和密码
                            if("rememberUser".equals(cookie.getName())&&cookie.getValue()!=null&& !Objects.equals(cookie.getValue(), "")){
                                System.out.println("remember更新用户名");
                                String password = cookie.getValue().split("&")[1];
                                cookie.setValue(newUser.getUserName()+"&"+password);
                                response.addCookie(cookie);
                            }
                        }
                    }
                    response.sendRedirect("user.jsp");

                }

            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(newMail!=null){
            System.out.println("mail");
            newUser = userService.updateUserMail(oldUser,newMail);
            if (newUser==null){
                System.out.println("更新邮箱失败");
            }else {
                System.out.println("(servlet)邮箱更新成功");
                session.setAttribute("user",newUser);
                response.sendRedirect("user.jsp");
            }
        }
        if(newPassword!=null&&confirm_newPassword!=null){
            System.out.println("password");
            newUser = userService.updateUserPassword(oldUser,newPassword);
            if (newUser==null){
                System.out.println("更新密码失败");
            }else {
                System.out.println("(servlet)密码更新成功");
                session.setAttribute("user",newUser);
                Cookie[] cookies = request.getCookies();
                if(cookies!=null){
                    for (Cookie cookie:cookies) {//查找cookie中记住的用户名和密码
                        if("rememberUser".equals(cookie.getName())&&cookie.getValue()!=null&& !Objects.equals(cookie.getValue(), "")){
                            System.out.println("remember更新密码");
                            String username = cookie.getValue().split("&")[0];
                            cookie.setValue(username+"&"+newPassword);
                            response.addCookie(cookie);
                        }
                    }
                }
                response.sendRedirect("user.jsp");
            }
        }
        System.out.println("nothing");
    }
}
