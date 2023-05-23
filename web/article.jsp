<%@ page import="java.util.List" %>
<%@ page import="pojo.SimpleArticle" %>
<%@ page import="service.ArticleService" %>
<%@ page import="pojo.Article" %>
<%@ page import="service.CommentService" %>
<%@ page import="pojo.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"   isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>${sessionScope.article.title}</title>
    <style>
        .article_title{
            text-align: center;
        }
        .article_info{
            display: flex;
        }
        .article_content{
            display: flex;
        }
    </style>
  </head>
  <body>
  <nav style="position: sticky;height: 80px;top: 0;z-index: 999;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);background-color: #fff;">
      <ul style="margin-left: 5px;">
          <li><strong><a href="index.jsp" style="font-size: 24px;">健康</a></strong></li>
          <li><a href="tags.jsp">标签页</a></li>
          <li><a href="discussion.jsp">讨论组</a></li>
      </ul>
      <ul style="flex: 1; display: flex;margin-bottom:-20px;margin-left: -50px; justify-content: center; align-items: center;padding: 10px; border-radius: 20px; border: none;  ">
          <input type="search" id="search" name="search" placeholder="Search" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); opacity: 0.8;width: 70%;">
      </ul>
      <ul style="margin-right: 5px;">
          <li><a href="message.jsp">邮件</a></li>
          <li><a href="user.jsp" role="button" style="padding: 10px;color: #000;">用户</a></li>
      </ul>
  </nav>
<%
    Article article= (Article) session.getAttribute("article");
%>
  <%--<h1>${article.title}</h1>
  ${article.content}
  ${article.article_id}--%>
<%--${requestScope.article.title}
${requestScope.article.content}
${requestScope.article.article_id}--%>



  <%
      Integer current_pagestr= (Integer) request.getAttribute("current_page");
      if(current_pagestr==null||"".equals(current_pagestr)){
          int current_page=1;
          request.setAttribute("current_page",current_page);

          CommentService CS=CommentService.getInstance();
          List<Comment> commentlist=CS.get_comment(current_page,article.getArticle_id());
          request.setAttribute("commentlist",commentlist);

          int page_count= CS.get_page_count();
          request.setAttribute("page_count",page_count);

          int comment_counts=CS.get_comment_count(article.getArticle_id());
          request.setAttribute("comment_counts",comment_counts);
      }
  %>
  <article>
      <div class="article_title">
          <h2 style="">${article.title}</h2>
      </div>
      <div class="article_info">
          用户&nbsp;<a class="article_info_user" href="user.jsp" style="display: flex ">${article.author}</a>&nbsp;&nbsp;&nbsp;
          标签&nbsp;<a class="article_info_tags" href="tags.jsp" style="display: flex">${article.tags}</a>&nbsp;&nbsp;&nbsp;
          发表时间：&nbsp;<span class="article_info_time">${article.date}</span>
      </div>
      <div class="article_content">
          <p>${article.content}</p>
      </div>
  </article>
  <div class="userToComment">
      <form action="addCommentServlet?article_id=${article.article_id}" method="post">
          <textarea name="comment_area" rows="5" cols="50" placeholder="请在这里输入你的评论" required></textarea><br>
          <input type="submit" value="提交" class="add_comment_area_submit" >
      </form>
  </div>
  <div class="comment" id="infoDiv">
  <table>
      <tr>
          <th width="100">用户名</th>
          <th width="500">评论内容</th>
          <th width="200">评论时间</th>
          <th width="100">评论ID</th>
      </tr>
      <c:forEach items="${sessionScope.commentlist}" var="comment">
          <tr>
              <th width="100">${comment.username}</th>
              <th width="500">${comment.comment_content}</th>
              <th width="300">${comment.comment_publish_date}</th>
              <th width="100">${comment.comment_id}</th>
              <th width="100">${comment.article_id}</th>
          </tr>
      </c:forEach><br>
  </table>
  </div>
  共${requestScope.comment_counts}条评论
  第${requestScope.current_page}页/共${requestScope.page_count}页
  <a href="getCommentServlet?current_page=1&id=${article.article_id}">首页</a>
  <c:if test="${requestScope.current_page==1}">上一页</c:if>
  <c:if test="${requestScope.current_page>1}">
      <a href="getCommentServlet?current_page=${requestScope.current_page-1}&id=${article.article_id}">上一页</a></c:if>
  <c:if test="${requestScope.current_page==requestScope.page_count}">下一页</c:if>
  <c:if test="${requestScope.current_page<requestScope.page_count}">
      <a href="getCommentServlet?current_page=${requestScope.current_page+1}&id=${article.article_id}">下一页</a></c:if>
  <a href="getCommentServlet?current_page=${requestScope.page_count}&id=${article.article_id}">尾页</a>



  </body>
</html>
