package controller;

import org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag;
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

        System.out.println("LoginServlet");
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
            //将数据库中获取的user对象放进去
            session.setAttribute("user",flagUser);
            boolean isRemember = Boolean.parseBoolean(request.getParameter("remember"));
            System.out.println("isRemember1 :"+isRemember);
            boolean isAutoLogin = Boolean.parseBoolean(request.getParameter("autologin"));
            if(request.getParameter("remember")==null)
                isRemember = false;
            System.out.println("isRemember2 :"+isRemember);
            if(isRemember){
                session.setAttribute("isRemember",true);
                //将用户名和未加密的密码放进cookie
                Cookie rememberUserCookie = new Cookie("rememberUser",username+"&"+password);
                if(isAutoLogin){
                    rememberUserCookie.setMaxAge(60*60*24*30);
                    session.setMaxInactiveInterval(60*60*24*30);

                }
                response.addCookie(rememberUserCookie);
            }else {
                session.setAttribute("isRemember",false);
                System.out.println("删除rememberUser的cookie");
                Cookie newCookie=new Cookie("rememberUser","");
                response.addCookie(newCookie);
//                Cookie[] cookies = request.getCookies();
//                if(cookies!=null){
//                    for (Cookie cookie:cookies) {
//                        if("rememberUser".equals(cookie.getName())){
//                                cookie = null;
//                        }
//                    }
//                }
            }

            System.out.println("isRemember:"+session.getAttribute("isRemember"));
            response.sendRedirect("index.jsp");
        } else{
            out.println("<script>alert(\"用户名或密码错误！\");location.href = \"login.jsp\";</script>");
        }



    }
}
