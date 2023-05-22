<%@ page import="pojo.Message" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/5/16
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

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

<%--    <c:forEach items="${messageList}" var="message">--%>
<%--        <tr>--%>
<%--            <td width="100">${message.time}</td>--%>
<%--            <td width="500">${message.name}</td>--%>
<%--            <td width="300">${message.title}</td>--%>
<%--            <td width="100">${message.contacts}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach><br>--%>
</table>



</body>
</html>
