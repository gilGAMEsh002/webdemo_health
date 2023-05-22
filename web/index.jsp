<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="pojo.*" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <title>主页</title>
    <style>
        /* 外层容器 */
        .card-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%; /* 设置容器的高度为视口的高度 */
        }

        /* 卡片样式 */
        .card {
            background-color: #f5f5f5;
            width:50%;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: left;
            height: 2000px;
            padding-top: 60px;
        }

    </style>
</head>
<body style="background-color: #c4efe7">
<%-- 导航栏实现   --%>
<nav style="position: sticky;height: 80px;top: 0;z-index: 999;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);background-color: #ffffff;">
    <ul style="margin-left: 1px;border: crimson 1px solid;width: 6%; ">
        <li style="display: flex;justify-content: center;align-content: center;"><strong><a href="index.jsp" style="font-size: 30px;">健&nbsp;康</a></strong></li>
    </ul>
    <ul style=";border: black 1px solid;">
        <li style=";border: black 1px solid;"><a href="ShowTagsServlet">标签页</a></li>
        <li style=";border: black 1px solid;"><a href="discussion.jsp">讨论组</a></li>
        <li style=";border: black 1px solid;"><a href="article.jsp">文章</a></li>
    </ul>
    <ul style="flex: 1; display: flex;margin-bottom:-20px;margin-left: -50px; justify-content: center; align-items: center;padding: 10px; border-radius: 20px; border: none;  ">
        <input type="search" id="search" name="search" placeholder="Search" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); opacity: 0.8;width: 70%;">
    </ul>
    <ul style="margin-right: 5px;">
        <li><a href="message.jsp">邮件</a></li>
        <li><a href="user.jsp" role="button" style="padding: 10px;color: #ffffff;">用户</a></li>
    </ul>
</nav>
<%--main--%>
<main>
    <header>
        <strong style="display: flex;align-content: center;justify-content: center;">最新文章</strong>
    </header>
<%--文章--%>
    <article>
        <div class="card-container" style="display: flex;align-content: center;justify-content: center; height: auto;background-color: #f5f5f5">
            <div class="card">
                <h3>文章标题1</h3>
                <span class="tag">标签1</span>
            </div>
            <div class="card">
                <h3>文章标题2</h3>
                <span class="tag">标签2</span>
            </div>
            <div class="card">
                <h3>文章标题3</h3>
                <span class="tag">标签3</span>
            </div>
            <!-- 添加更多卡片 -->
        </div>
    </article>


</main>

</body>
</html>
