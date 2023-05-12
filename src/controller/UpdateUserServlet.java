package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeUserServlet", value = "/ChangeUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ChangeUserServlet");
        //获取数据,设置编码方式
        String newusername = request.getParameter("newusername");
        String newpassword = request.getParameter("newpassword");
        String confirm_newpassword = request.getParameter("confirm_newpassword");
        String newmail = request.getParameter("newmail");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
    }
}
