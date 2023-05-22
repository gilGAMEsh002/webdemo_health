<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="service.DiscussService" %>
<%@ page import="pojo.Discuss" %><%--
  Created by IntelliJ IDEA.
  User: 原明蓝
  Date: 2023/5/21
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String topicidstr="2";
    int topic_id=2;
    Object discuss_current_pagestr= request.getAttribute("discuss_current_page".concat(topicidstr));
    if(discuss_current_pagestr==null||"".equals(discuss_current_pagestr)){
        int discuss_current_page=1;
        request.setAttribute("discuss_current_page".concat(topicidstr),discuss_current_page);
        DiscussService discussService=DiscussService.getInstance();

        List<Discuss> discusslist=discussService.get_discuss(discuss_current_page,topic_id);
        request.setAttribute("discusslist".concat(topicidstr),discusslist);

        int discuss_page_count= discussService.get_page_count(topic_id);
        request.setAttribute("discuss_page_count".concat(topicidstr),discuss_page_count);

        int discuss_comment_counts=discussService.get_discuss_count(topic_id);
        request.setAttribute("discuss_comment_counts".concat(topicidstr),discuss_comment_counts);
    }
%>

医疗技术。
<form action="adddiscussServlet" method="post">
    <textarea name="comment_area" rows="5" cols="50" placeholder="请在这里输入你的评论" required></textarea><br>
    <input type="hidden" value="2" name="topic_id">
    <input type="submit" value="提交">
</form>

评论区
<table>
    <tr>
        <th width="100">用户ID</th>
        <th width="500">评论内容</th>
        <th width="200">评论时间</th>
    </tr>
    <c:forEach items="${requestScope.discusslist2}" var="discuss">
        <tr>
            <th width="100">${discuss.user_id}</th>
            <th width="500">${discuss.discuss_content}</th>
            <th width="300">${discuss.discuss_publish_date}</th>
        </tr>
    </c:forEach><br>
</table>
共${requestScope.discuss_comment_counts2}条评论
第${requestScope.discuss_current_page2}页/共${requestScope.discuss_page_count2}页
<a href="getdiscussServlet?discuss_current_page2=1&topic_id=2">首页</a>
<c:if test="${requestScope.discuss_current_page2==1}">上一页</c:if>
<c:if test="${requestScope.discuss_current_page2>1}">
    <a href="getdiscussServlet?discuss_current_page2=${requestScope.discuss_current_page2-1}&topic_id=2">上一页</a>
</c:if>
<c:if test="${requestScope.discuss_current_page2==requestScope.discuss_page_count2}">下一页</c:if>
<c:if test="${requestScope.discuss_current_page2<requestScope.discuss_page_count2}">
    <a href="getdiscussServlet?discuss_current_page2=${requestScope.discuss_current_page2+1}&topic_id=2">下一页</a>
</c:if>
<a href="getdiscussServlet?discuss_current_page2=${requestScope.discuss_page_count2}&topic_id=2">尾页</a>

</body>
</html>
