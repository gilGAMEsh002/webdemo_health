<%@ page import="service.ArticleService" %>
<%@ page import="pojo.SimpleArticle" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Article" %>
<%@ page import="service.CommentService" %>
<%@ page import="pojo.Comment" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>admin</title>
</head>
<body>
<%
    ArticleService articleService=ArticleService.getInstance();
    List<Article> articleList=articleService.getArticleList();
    session.setAttribute("adminArticleList",articleList);
    CommentService commentService=CommentService.getInstance();
    List<Comment>commentList=commentService.getAllComments();
    session.setAttribute("adminCommentList",commentList);
%>
<table class="admin_article">
    <tr>
        <th width="100">文章标题</th>
        <th width="100">文章作者</th>
        <th width="100">发表时间</th>
        <th width="100">文章id</th>
        <th width="100">文章收藏数</th>
        <th width="100">标签</th>
    </tr>
    <c:forEach var="article"  items="${adminArticleList}" >
        <tr>
        <div class="card">
            <th width="100">${article.title}</th>
            <th width="100">${article.author}</th>
            <th width="100">${article.date}</th>
            <th width="100">${article.article_id}</th>
            <th width="100">${article.collections}</th>
            <th width="100">${article.tags}</th>
           <th width="100"> <a href="deleteArticleServlet?id=${article.article_id}">删除该篇文章</a></th>
            <th width="100"><a href="ArticleServlet?id=${article.article_id}">查看该篇文章</a></th>
        </div>
        </tr>
    </c:forEach>

</table>






<table class="admin_comment">
    <tr>
        <th width="100">用户名</th>
        <th width="500">评论内容</th>
        <th width="200">评论时间</th>
        <th width="100">评论ID</th>
        <th width="100">文章id</th>
    </tr>
    <c:forEach items="${adminCommentList}" var="comment">
        <tr>
            <th width="100">${comment.username}</th>
            <th width="500">${comment.comment_content}</th>
            <th width="300">${comment.comment_publish_date}</th>
            <th width="100">${comment.comment_id}</th>
            <th width="100">${comment.article_id}</th>
            <th width="100"><a href="deleteCommentServlet?id=${comment.comment_id}">删除该条评论</a></th>

        </tr>
    </c:forEach><br>
</table>

</body>
</html>
