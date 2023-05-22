package controller;

import pojo.Article;
import service.ArticleService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "deleteArticleServlet", value = "/deleteArticleServlet")
public class deleteArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // 想要获取的文章 id
        String id = request.getParameter("id");
        ArticleService as = ArticleService.getInstance();

        boolean flag=as.deleteArticle(Integer.parseInt(id));
        if(flag){
            PrintWriter out=response.getWriter();
            out.println("<script>alert('删除成功');window.location.href='admin.jsp'</script>");

        }
        else{
            PrintWriter out=response.getWriter();
            out.println("<script>alert('删除失败');window.location.href='admin.jsp'</script>");
        }
    }
}
