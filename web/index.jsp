<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="pojo.*" language="java" %>
<%@ page import="service.ArticleService" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
        ArticleService articleService=ArticleService.getInstance();
        List<SimpleArticle> list=articleService.getSimpleList();
        session.setAttribute("list",list);
        User user = (User) session.getAttribute("user");
    %>
    <meta charset="UTF-8">
    <title>主页</title>
    <style>
        /* 外层容器 */
        .card-container {
            visibility: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 50%; /* 设置容器的高度为视口的高度 */
            width: 100%;
        }

        /* 卡片样式 */
        .card {
            visibility: visible;
            background-color: #ffffff;
            width:50%;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: left;
            height: 200px;
            padding-top: 60px;
        }


    </style>
</head>
<body style="background-color: #c4efe7 ;background-repeat:no-repeat;<!--设置图片不重复显示-->
background-attachment:fixed;<!--设置图片的位置固定-->
background-size:100% 100%; " background="../image/testimage.jpg"> <!--background=".../...jpg'" 存放图片的路径-->
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
<%--main--%>
<main>

    <header>
        <strong style="color: rgba(194,52,173,0.83);display: flex;align-content: center;justify-content: center;">最新文章</strong>
    </header>
<%--文章--%>
<%--    <article>--%>
        <div class="card-container" style="display: flex;align-content: center;justify-content: center; height: auto;background-color: rgba(245,245,245,0.29)">
            <c:forEach var="simple"  items="${list}" begin="1" >
                <div class="card">
                    <h3><a href="ArticleServlet?id=${simple.id}">${simple.title}</a></h3>
                    <span class="tag">${simple.tags}</span>
                </div>
            </c:forEach>
            <!-- 添加更多卡片 -->
        </div>
<%--    </article>--%>


</main>

</body>
</html>
