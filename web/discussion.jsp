<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/23
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导航栏</title>
    <style>
        .search-btn {
            color: #666;
            background-color: transparent;
            border: none;
            outline: none;
            position: absolute;
            right: 0;
            top: 0;
            height: 100%;
            width: 40px;
            text-align: center;
        }

        .search-btn i {
            font-size: 18px;
            line-height: 40px;
        }

    </style>
<%--    <style>--%>
    <%--    nav {--%>
    <%--        position: sticky;--%>
    <%--        height: 80px;--%>
    <%--        top: 0;--%>
    <%--        z-index: 999;--%>
    <%--        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);--%>
    <%--        background-color: #fff;--%>
    <%--        display: flex;--%>
    <%--        justify-content: space-between;--%>
    <%--        align-items: center;--%>
    <%--        padding: 10px 20px;--%>
    <%--    }--%>

    <%--    nav ul:first-child {--%>
    <%--        margin-left: 1px;--%>
    <%--        width: 6%;--%>
    <%--        display: flex;--%>
    <%--        justify-content: center;--%>
    <%--        align-content: center;--%>
    <%--    }--%>

    <%--    nav ul li strong {--%>
    <%--        font-size: 30px;--%>
    <%--    }--%>

    <%--    nav ul li a {--%>
    <%--        padding: 10px;--%>
    <%--        color: #333;--%>
    <%--        text-decoration: none;--%>
    <%--        font-size: 18px;--%>
    <%--    }--%>

    <%--    nav ul li a:hover {--%>
    <%--        color: #32936F;--%>
    <%--    }--%>

    <%--    nav input[type="search"] {--%>
    <%--        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);--%>
    <%--        opacity: 0.8;--%>
    <%--        width: 70%;--%>
    <%--    }--%>

    <%--    nav ul:last-child {--%>
    <%--        margin-right: 5px;--%>
    <%--        display: flex;--%>
    <%--    }--%>

    <%--    nav ul:last-child li {--%>
    <%--        margin-left: 20px;--%>
    <%--    }--%>

    <%--    nav ul:last-child li a {--%>
    <%--        padding: 10px;--%>
    <%--        color: #333;--%>
    <%--        text-decoration: none;--%>
    <%--        font-size: 18px;--%>
    <%--    }--%>

    <%--    nav ul:last-child li a[role="button"] {--%>
    <%--        background-color: #32936F;--%>
    <%--        border-radius: 20px;--%>
    <%--        padding: 10px 20px;--%>
    <%--        color: #fff;--%>
    <%--        font-size: 18px;--%>
    <%--    }--%>

    <%--    nav ul:last-child li a[role="button"]:hover {--%>
    <%--        background-color: #2D7F5E;--%>
    <%--    }--%>
    <%--</style>--%>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
%>
<%--<nav>--%>
<%--    <ul>--%>
<%--        <li><strong><a href="index.jsp">健&nbsp;康</a></strong></li>--%>
<%--    </ul>--%>
<%--    <ul>--%>
<%--        <li><a href="tags.jsp">标签页</a></li>--%>
<%--        <li><a href="discussion.jsp">讨论组</a></li>--%>
<%--    </ul>--%>
<%--    <ul>--%>
<%--        <input type="search" id="search" name="search" placeholder="Search">--%>
<%--    </ul>--%>
<%--    <ul>--%>
<%--        <li><a href="message.jsp">邮件</a></li>--%>
<%--        <li><a href="user.jsp" role="button">用户</a></li>--%>
<%--    </ul>--%>
<%--</nav>--%>
<%-- 导航栏实现   --%>
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

<main style="display: flex; justify-content: center; flex-wrap: wrap;">
    <a href="topic1.jsp" style="margin: 10px;">年轻人不珍惜自己。</a>
    <br>
    <a href="topic2.jsp" style="margin: 10px;">医疗技术。</a>
</main>
</body>
</html>