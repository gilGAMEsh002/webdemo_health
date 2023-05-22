<%@ page import="pojo.Essay" %><%--
  Created by IntelliJ IDEA.
  User: coke
  Date: 2023/5/22
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Title</title>
    <style>
        .card {
            width:50%;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 20px;
            text-align: left;
            padding-top: 60px;
            max-width: 800px;
            height: auto;

        }
    </style>
</head>
<body>
<form action="<c:url value="/SearchServlet"/>" method="post">
    <input type="text" name="search">
    <input type="submit" value="搜索">
</form>
<%--<%
    Essay essays=(Essay) session.getAttribute("essays");
%>--%>
<c:forEach var="list" items="${EssayList}">
    <tr>
        <article>
            <div class="card-container" style="display: flex;align-content: center;justify-content: center; height: auto">
                <div class="card">
                    <h3><a href="ArticleServlet?id=${list.article_id}">${list.title}</a></h3>
                    <span class="tag">${list.tags}</span>
                   <%-- <td>${list.title}</td>
                    <td>${list.content}</td><br>--%>
                </div>
            </div>
        </article>
    </tr>
</c:forEach>
</body>
</html>
