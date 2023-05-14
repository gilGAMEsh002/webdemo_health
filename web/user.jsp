<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/23
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--用户未登录会被过滤,跳转到login.jsp--%>
<%--用户已登录则在此显示用户信息
        -用户名,邮箱
        -收藏夹预览
    两个按钮:
        -登出
        -注销
--%>

<%
    User user = (User) session.getAttribute("user");

%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <title>Title</title>
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
        <li><a href="user.jsp" role="button" style="padding: 10px;color: #000;">用户</a></li>
    </ul>
</nav>

<article>

    <header>
        <h1>个人资料</h1>
    </header>

    <article>
        <header>
        <h2>个人信息</h2>
        </header>
        <div>
            用户名:<%=user.getUserName()%>
        </div>
        <div>
            邮箱:<%=user.getMail()%>
        </div>
    </article>

    <article>
<%--           <iframe src="collections_presence.jsp" width="50%"></iframe>--%>
            <a href="collections_presence.jsp">收藏夹</a>

    </article>


    <footer>
        <div style="display-inside: ruby-base-container">
            <a href="${pageContext.request.contextPath}/LogoutServlet" role="button" >
                登出
            </a>
        </div>

    </footer>

</article>



</body>
</html>
