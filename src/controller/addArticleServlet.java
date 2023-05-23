package controller;

import dao.impl.ArticleDaoImpl;
import pojo.Article;
import pojo.User;
import service.ArticleService;
import service.impl.TagServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "addArticleServlet", value = "/addArticleServlet")
public class addArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        /*   request.setAttribute("time", df.format(date));*/
        String title = request.getParameter("title");
        String tags = request.getParameter("tags");
        String content = request.getParameter("content");
        String username = user.getUserName();
        //准备将数据传入数据表
        ArticleService articleService = ArticleService.getInstance();
        Article article;
        try {
            article = articleService.addArticle(title, username, content, tags);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        TagServiceImpl tagService = new TagServiceImpl();
        try {
            tagService.attach(article.getArticle_id(), tags.split(","));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("simple_article.jsp").forward(request, response);
    }
}