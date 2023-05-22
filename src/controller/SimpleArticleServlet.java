package controller;

import service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SimpleArticleServlet", value = "/SimpleArticleServlet")
public class SimpleArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取时间轴文章类型的数据
        ArticleService as = ArticleService.getInstance();
        request.setAttribute("simple_list", as.getSimpleList());

        // 转发
        request.getRequestDispatcher("/article.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
