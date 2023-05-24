<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/26
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>MESSAGE</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
%>
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
<main class="container">

    <table>
        <tr>
            <th width="300">时间</th>
            <th width="200">用户名</th>
            <th width="200">标题</th>
            <th width="400">内容</th>
        </tr>
        <c:forEach items="${messageList}" var="message" varStatus="status">
        <tr>
            <td>${message.time}</td>
            <td>${message.name}</td>
            <td>${message.title}</td>
            <td>${message.contacts}</td>
        </tr>
        </c:forEach>
    </table>
    <article class="grid">
        <div>
            <hgroup>
                <h1>Message</h1>
                <h2>contacts us</h2>
            </hgroup>
            <form method="post" action="${pageContext.request.contextPath}/AddMessage" id="MessageForm">
                请输入标题<input
                    type="text"
                    name="title"
                    id="title"
            <%--                        onblur="checkUsername()"--%>
                    placeholder="3-20个字符"
            <%-- 此处的正则表达式 直接写即可不用加前后的\和^$ --%>
                    required pattern="[\u4e00-\u9fa5 A-Z a-z 0-9 _]{3,16}"
            />
                <%--                <span style="font-size:13px" id="namespan"></span>--%>
                请输入正文<textarea name="contacts" cols="60" rows="5"> </textarea>
                <button type="submit" class="contrast">提交</button>

            </form>
        </div>
        <div>
            <img src="/image/king'sInvite.png">
        </div>
    </article>
</main>

</body>
</html>
