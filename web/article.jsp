<%@ page import="java.util.List" %>
<%@ page import="pojo.SimpleArticle" %>
<%@ page import="service.ArticleService" %>
<%@ page import="pojo.Article" %>
<%@ page import="service.CommentService" %>
<%@ page import="pojo.Comment" %>
<%@ page import="pojo.User" %>
<%@ page import="dao.CollectDao" %>
<%@ page import="dao.impl.CollectDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"   isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <title>${sessionScope.article.title}</title>
    <style>
        .article_title{
            text-align: center;
        }
        .article_info{
            display: flex;
        }
        .article_content {
            white-space: pre-line;
        }
    </style>
</head>
<body>
<nav style="position: sticky;height: 80px;top: 0;z-index: 999;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);background-color: #ffffff;">
    <ul style="margin-left: 1px;width: 25%; ">
        <li style="display: flex;justify-content: center;align-content: center;"><strong><a href="index.jsp" style="font-size: 30px;">健&nbsp;康</a></strong></li>
        <li><a href="ShowTagsServlet">标签页</a></li>
        <li ><a href="discussion.jsp">讨论组</a></li>
    </ul>
    <%--    <ul style=";border: black 1px solid;">--%>

    <%--    </ul>--%>
    <%--    <ul style="flex: 1; display: flex;margin-bottom:-20px;margin-left: -50px; justify-content: center; align-items: center;padding: 10px; border-radius: 20px; border: none;  ">--%>
    <%--        <input type="search" id="search" name="search" placeholder="Search" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); opacity: 0.8;width: 70%;">--%>
    <%--    </ul>--%>

    <ul style="flex: 1; display: flex; justify-content: center; align-items: center;padding: 10px;margin-right: 60px  ">
        <form action="SearchServlet" method="post" style="width: 100%; display: flex; justify-content: center; align-items: center;margin-bottom: -15px;">
            <input type="search" id="search" name="search" placeholder="Search" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); opacity: 0.8;width: 100%;">
            <button style="visibility: hidden;" type="submit" class="search-btn" value="搜索"></button>
        </form>
    </ul>

    <ul style="margin-right: 5px;">
        <li><a href="addArticle.jsp" >发布文章</a>
        <li><a href="message.jsp" >邮件</a>
        <li><a href="user.jsp" ><img style="width: 60px;height: 60px;border-radius: 60px" src="${pageContext.request.contextPath}<%=user.getAvatar_path()%>" alt="用户头像"></a>
    </ul>
</nav>
<%
    Article article= (Article) session.getAttribute("article");
%>


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
        <c:out value="${article.content}" escapeXml="false" /><br>
        <hr>
    </div>
    <%
        User user = (User) session.getAttribute("user");
        CollectDaoImpl   cd=new CollectDaoImpl();
        boolean is_collect= cd.is_collect(user.getUserName(), String.valueOf(article.getArticle_id()));
        String value;
        if(is_collect){
            value="取消收藏";
    %>
    <div class="collectArticle">
        <a href="collect_Servlet?favorite=0&articleID=<%=article.getArticle_id()%>&is_collect=1" role="button" class="secondary" style="width:160px"><%=value%></a>
        <%}else {
            value="添加收藏";
        %>
        <details role="list" style="width:160px">
            <summary aria-haspopup="listbox"><%=value%></summary>
            <ul role="listbox">
                <li><a href="collect_Servlet?favorite=1&articleID=<%=article.getArticle_id()%>&is_collect=0">收藏夹1</a></li>
                <li><a href="collect_Servlet?favorite=2&articleID=<%=article.getArticle_id()%>&is_collect=0">收藏夹2</a></li>
            </ul>
        </details>
        <%}%>

    </div>
</article>
<div class="userToComment">
    <form action="addCommentServlet?article_id=${article.article_id}" method="post">
        <textarea name="comment_area" rows="5" cols="50" placeholder="请在这里输入你的评论" required></textarea><br>
        <input type="submit" value="评论" class="add_comment_area_submit" >
    </form>
</div>
<div class="comment" id="infoDiv">
    <table>
        <tr>
            <th width="100">用户名</th>
            <th width="500">评论内容</th>
            <th width="200">评论时间</th>
        </tr>
        <c:forEach items="${requestScope.commentlist}" var="comment">
            <tr>
                <th width="100">${comment.username}</th>
                <th width="500">${comment.comment_content}</th>
                <th width="300">${comment.comment_publish_date}</th>
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
