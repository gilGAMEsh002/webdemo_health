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

        int article_id;
        String[] tags;
//        if(request.getParameter("title")!=null&&request.getParameter("tag")!=null){
             article_id = Integer.parseInt(request.getParameter("title"));
             tags = request.getParameter("tags").split(",");
//        }else{
//            System.out.println("来自addArticleServlet");
//            String param = request.getParameter("param");
//            String[] datas = param.split("&");
//            article_id= Integer.parseInt(datas[1]);
//            tags=datas[0].split(",");
//        }

        System.out.println("tags:"+Arrays.toString(tags));
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //将数据发给service层处理
        TagServiceImpl tagService = new TagServiceImpl();
        try {
            if(tagService.attach(article_id,tags)){
                response.getWriter().write("添加标签成功");
                response.sendRedirect("simple_article.jsp");
            }else{
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "重复添加文章标签！");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
