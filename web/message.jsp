<%--
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
