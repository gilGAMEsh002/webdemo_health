package controller;

import service.ArticleService;
import service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "deleteCommentServlet", value = "/deleteCommentServlet")
public class deleteCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // 想要获取的文章 id
        String id = request.getParameter("id");
        CommentService cs=CommentService.getInstance();


        boolean flag=cs.deleteComment(Integer.parseInt(id));


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
