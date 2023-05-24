package controller;

import dao.impl.CollectDaoImpl;
import pojo.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "collect_Servlet", value = "/collect_Servlet")
public class collect_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CollectDaoImpl cd=new CollectDaoImpl();
        String is_collect=request.getParameter("is_collect");//接收是否收藏
        //String username=request.getParameter("username");
        HttpSession session= request.getSession();
        User user=(User) session.getAttribute("user");
        String username= user.getUserName();
        /************用户名设置为session****************/
        /*HttpSession session=request.getSession();
        session.setAttribute("username",username);*/


        String favorite=request.getParameter("favorite");
        String articleID=request.getParameter("articleID");//接收文章名
        System.out.println("servlet");
        if(is_collect.equals("1")){
            cd.deleteCollection(username,articleID);
            PrintWriter out=response.getWriter();
            out.println("<script language=\"JavaScript\">\n" +
                    "    window.alert(\"取消收藏成功\");\n" +
                    "</script>");
            System.out.println("取消");
        }
        if(is_collect.equals("0")){
            try {
                cd.addCollect(username,articleID,favorite);
                PrintWriter out=response.getWriter();
                out.println("<script language=\"JavaScript\">\n" +
                        "    window.alert(\"添加收藏成功\");\n" +
                        "</script>");
                System.out.println("添加");
            }catch (Exception E){System.out.println("出错");}

        }
        response.sendRedirect("article.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
