package controller;

import pojo.Article;
import pojo.Comment;
import service.ArticleService;
import service.CommentService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ArticleServlet", value = "/ArticleServlet")
public class ArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 想要获取的文章 id
        String id = request.getParameter("id");
        ArticleService as = ArticleService.getInstance();
        // 文章
        Article a = as.getArticle("article_id", id).get(0);
       /* request.setAttribute("article", a);*/
                // 文章的所有标签
        HttpSession httpSession=request.getSession();
        httpSession.setAttribute("article",a);

        request.setAttribute("article_tags", as.getTags());

   /*     // 获取上一篇文章
        request.setAttribute("article_pre", as.getPreviousArticle(a.getDate()));
        // 获取下一篇文章
        request.setAttribute("article_next", as.getNextArticle(a.getDate()));*/

        // 加载文章评论
        CommentService cs = CommentService.getInstance();

        int current_page;
         int page_count=cs.get_page_count();
        String current_pagestr= request.getParameter("current_page");

        if(current_pagestr==null||"".equals(current_pagestr)){
            current_page=1;
        }else{
            current_page= Integer.parseInt(current_pagestr);
        }
        if(current_page<1){
            current_page=1;
        }
        if(current_page>page_count){
            current_page=page_count;
        }

        int comment_counts=cs.get_comment_count(a.getArticle_id());
        List<Comment> commentlist=cs.get_comment(current_page,a.getArticle_id());

        httpSession.setAttribute("comment_counts",comment_counts);
        httpSession.setAttribute("page_count",page_count);
        httpSession.setAttribute("commentlist",commentlist);
        httpSession.setAttribute("current_page",current_page);

        //通过sendRedirect跳转url地址会变成目的地址
        response.sendRedirect("article.jsp");
    /*    request.getRequestDispatcher("article.jsp").forward(request, response);*/
    }
}
