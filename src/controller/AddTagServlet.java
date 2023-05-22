package controller;

import service.impl.TagServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AddTagServlet", value = "/AddTagServlet")
public class AddTagServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取jsp传来的数据,并封装
        String newtag = request.getParameter("newtag");
        System.out.println("newtag:"+newtag);

        //准备响应格式,响应输出,获取session
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        //调用service
        TagServiceImpl tagService = new TagServiceImpl();

        response.setContentType("application/json");
        try {
            if(tagService.addTag(newtag)!=null){
                response.getWriter().write("新建标签成功");
            }else{
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "标签已经存在！");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
