<%@ page import="java.util.List" %>
<%@ page import="pojo.SimpleArticle" %>
<%@ page import="service.ArticleService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"   isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Title</title>
    <style>
        /* 外层容器 */
        .card-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 120%; /* 设置容器的高度为视口的高度 */

        }
        /* 卡片样式 */
        .card {
            width:50%;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 20px;
            text-align: left;
            height: 2000px;
            padding-top: 60px;
        }
        nav {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1; /* 设置nav元素的层级为1 */
        }
        main {
            margin-top: 60px; /* 留出nav元素的高度 */
            z-index: 2; /* 设置main元素的层级为2 */
        }
        header{
            z-index: 3;
        }
        article {
            height: 100%; /* 设置article元素的高度为100% */
        }

    </style>
</head>
<body>

<%
    ArticleService articleService=ArticleService.getInstance();
    List<SimpleArticle>list=articleService.getSimpleList();
    session.setAttribute("list",list);
%>
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
<main>
    <header>
       <strong  style="display: flex;align-content: center;justify-content: center;"  >最新文章</strong>
    </header>
    <article>
        <div class="card-container" style="display: flex;align-content: center;justify-content: center;">
            <c:forEach var="simple"  items="${list}" begin="1" >
                <div class="card">
                    <h3><a href="ArticleServlet?id=${simple.id}">${simple.title}</a></h3>
                    <span class="tag">${simple.tags}</span>
                </div>
            </c:forEach>
        </div>
    </article>
</main>

</body>
</html>
