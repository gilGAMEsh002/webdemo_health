package controller;

import dao.CollectDao;

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
        CollectDao cd=new CollectDao();
        String is_collect=request.getParameter("is_collect");
        String username=request.getParameter("username");

        /************用户名设置为session****************/
        HttpSession session=request.getSession();
        session.setAttribute("username",username);

        String articleName=request.getParameter("articleName");
        String favorite=request.getParameter("favorite");
        System.out.println("servlet");
        if(is_collect.equals("1")){
            cd.deleteCollection(username,articleName);
            PrintWriter out=response.getWriter();
            out.println("<script type=\"text/javascript\">\n" +
                    "    window.alert(\"取消收藏成功\");\n" +
                    "</script>");
        }
        if(is_collect.equals("0")){
            try {
                cd.addCollect(username,articleName,favorite);
                PrintWriter out=response.getWriter();
                out.println("<script type=\"text/javascript\">\n" +
                        "    window.alert(\"添加收藏成功\");\n" +
                        "</script>");
            }catch (Exception E){System.out.println("出错");}

        }
        response.sendRedirect("collections_presence.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
