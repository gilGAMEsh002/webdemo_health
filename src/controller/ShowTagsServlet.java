package controller;

import pojo.Tag;
import service.impl.TagServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ShowTagsServlet", value = "/ShowTagsServlet")
public class ShowTagsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        TagServiceImpl tagService = new TagServiceImpl();
        List<Tag> tags;
        try {
            tags = tagService.getTopTags();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println(tags.size());
        request.setAttribute("tags", tags);
        request.getRequestDispatcher("/tags.jsp").forward(request, response);
//        response.sendRedirect("tags.jsp");
    }
}
