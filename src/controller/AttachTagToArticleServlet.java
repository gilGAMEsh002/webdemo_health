package controller;

import service.impl.TagServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;

@WebServlet(name = "AttachTagToArticleServlet", value = "/AttachTagToArticleServlet")
public class AttachTagToArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int article_id = Integer.parseInt(request.getParameter("title"));
        String[] tags = request.getParameter("tags").split(",");


        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //将数据发给service层处理
        TagServiceImpl tagService = new TagServiceImpl();
        try {
            if(tagService.attach(article_id,tags)){
                response.getWriter().write("添加标签成功");
            }else{
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "重复添加文章标签！");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
