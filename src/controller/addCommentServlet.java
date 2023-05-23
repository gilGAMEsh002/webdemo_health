package controller;

import pojo.Comment;
import pojo.User;
import service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "addCommentServlet", value = "/addCommentServlet")
public class addCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String content=request.getParameter("comment_area");
        CommentService commentService=CommentService.getInstance();
        int article_id=Integer.valueOf(request.getParameter("article_id"));

        //得到用户ID
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        int user_id= user.getId();
        String username= user.getUserName();

//        commentService.addComment(article_id,user_id,content,username);
        /*boolean add_comment_state=commentService.addComment(article_id,user_id,content);*/
        //更新传入文章显示页面的集合
        CommentService cs = CommentService.getInstance();

      /*  int current_page;
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
        HttpSession httpSession=request.getSession();

        int comment_counts=cs.get_comment_count(article_id);
        List<Comment> commentlist=cs.get_comment(current_page,article_id);

        httpSession.setAttribute("comment_counts",comment_counts);
        httpSession.setAttribute("page_count",page_count);
        httpSession.setAttribute("commentlist",commentlist);
        httpSession.setAttribute("current_page",current_page);

        response.sendRedirect("article.jsp");*/

        boolean add_comment_state=cs.addComment(article_id,user_id,content,username);
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
        HttpSession httpSession=request.getSession();

        int comment_counts=cs.get_comment_count(article_id);
        List<Comment> commentlist=cs.get_comment(current_page,article_id);

        httpSession.setAttribute("comment_counts",comment_counts);
        httpSession.setAttribute("page_count",page_count);
        httpSession.setAttribute("commentlist",commentlist);
        httpSession.setAttribute("current_page",current_page);


        if(add_comment_state){
            PrintWriter out=response.getWriter();
            out.println("<script>alert('评论成功');window.location.href='article.jsp'</script>");
        } else{
            PrintWriter out = response.getWriter();
            out.println("<script>alert('评论失败');window.location.href='article.jsp'</script>");
        }


      /*  if(add_comment_state){
            PrintWriter out=response.getWriter();
            response.sendRedirect("article.jsp");
            *//*out.println("<script>alert('评论成功');window.location.href='article.jsp'</script>");*//*
        } else{
            PrintWriter out = response.getWriter();
            *//*out.println("<script>alert('评论失败');window.location.href='article.jsp'</script>");*//*
        }*/
    }
}
