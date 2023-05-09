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
<nav>
    <ul>
        <li><strong>健康</strong></li>
    </ul>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="tags.jsp">标签</a></li>
        <li><a href="#" role="button">Button</a></li>
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
        <header>
            <h2>收藏夹</h2>
        </header>
        <div>

            <article>
                文章1
            </article>
            <article>
                文章2
            </article>
            <article>
                文章三
            </article>

        </div>
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
