package controller;

import pojo.Comment;
import service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "getCommentServlet", value = "/getCommentServlet")
public class getCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentService cs=CommentService.getInstance();

        int id= Integer.parseInt(request.getParameter("id"));
        int page_count= cs.get_page_count();
        int current_page;
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

        int comment_counts=cs.get_comment_count(id);
        List<Comment> commentlist=cs.get_comment(current_page,id);

        request.setAttribute("comment_counts",comment_counts);
        request.setAttribute("page_count",page_count);
        request.setAttribute("commentlist",commentlist);
        request.setAttribute("current_page",current_page);
        request.getRequestDispatcher("article.jsp").forward(request,response);
        //response.sendRedirect("success.jsp");
        //PrintWriter out=response.getWriter();
        //out.println("<script>window.location.href='success.jsp'</script>");
        //System.out.println(current_page);
    }
}
