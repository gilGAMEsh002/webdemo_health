<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="service.DiscussService" %>
<%@ page import="pojo.Discuss" %>
<%@ page import="pojo.User" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<html>
<head>
    <title>Topic1</title>
    <%
        User user = (User) session.getAttribute("user");
    %>
</head>
<body>
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
<%
    String topicidstr="1";
    int topic_id=1;
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
<%--<header>--%>
<%--    <h1 style="text-align: center;">年轻人不珍惜自己。</h1>--%>
<%--</header>--%>
<%--<main >--%>
<%--    <form action="adddiscussServlet" method="post">--%>
<%--        <textarea name="comment_area" rows="5" cols="50" placeholder="请在这里输入你的评论" required></textarea><br>--%>
<%--        <input type="hidden" value="1" name="topic_id">--%>
<%--        <input type="submit" value="提交">--%>
<%--    </form>--%>

<%--    评论区--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th width="100">用户ID</th>--%>
<%--            <th width="500">评论内容</th>--%>
<%--            <th width="200">评论时间</th>--%>
<%--        </tr>--%>

<%--        <c:forEach items="${requestScope.discusslist1}" var="discuss">--%>
<%--            <tr>--%>
<%--                <th width="100">${discuss.user_id}</th>--%>
<%--                <th width="500">${discuss.discuss_content}</th>--%>
<%--                <th width="300">${discuss.discuss_publish_date}</th>--%>
<%--            </tr>--%>
<%--        </c:forEach><br>--%>
<%--    </table>--%>
<%--    共${requestScope.discuss_comment_counts1}条评论--%>
<%--    第${requestScope.discuss_current_page1}页/共${requestScope.discuss_page_count1}页--%>
<%--    <a href="getdiscussServlet?discuss_current_page1=1&topic_id=1">首页</a>--%>
<%--    <c:if test="${requestScope.discuss_current_page1==1}">上一页</c:if>--%>
<%--    <c:if test="${requestScope.discuss_current_page1>1}">--%>
<%--        <a href="getdiscussServlet?discuss_current_page1=${requestScope.discuss_current_page1-1}&topic_id=1">上一页</a>--%>
<%--    </c:if>--%>
<%--    <c:if test="${requestScope.discuss_current_page1==requestScope.discuss_page_count1}">下一页</c:if>--%>
<%--    <c:if test="${requestScope.discuss_current_page1<requestScope.discuss_page_count1}">--%>
<%--        <a href="getdiscussServlet?discuss_current_page1=${requestScope.discuss_current_page1+1}&topic_id=1">下一页</a>--%>
<%--    </c:if>--%>
<%--    <a href="getdiscussServlet?discuss_current_page1=${requestScope.discuss_page_count1}&topic_id=1">尾页</a>--%>

<%--</main>--%>
<header>
    <h1 style="text-align: center;">年轻人不珍惜自己。</h1>
</header>
<main style="display: flex; flex-direction: column; align-items: center;">
    <form action="adddiscussServlet" method="post" style="text-align: center;">
        <textarea name="comment_area" rows="5" cols="50" placeholder="请在这里输入你的评论" required></textarea>
        <br>
        <input type="hidden" value="1" name="topic_id">
        <input type="submit" value="提交">
    </form>

    <div style="text-align: center;">
        评论区
        <div style="display: flex; justify-content:center; align-items: center; flex-direction: column;">
            <table>
                <tr>
                    <th width="100">用户ID</th>
                    <th width="500">评论内容</th>
                    <th width="200">评论时间</th>
                </tr>
                <c:forEach items="${requestScope.discusslist1}" var="discuss">
                    <tr>
                        <td>${discuss.user_id}</td>
                        <td>${discuss.discuss_content}</td>
                        <td>${discuss.discuss_publish_date}</td>
                    </tr>
                </c:forEach><br>
            </table>
            <div>共${requestScope.discuss_comment_counts1}条评论
                第${requestScope.discuss_current_page1}页/共${requestScope.discuss_page_count1}页
                <a href="getdiscussServlet?discuss_current_page1=1&topic_id=1">首页</a>
                <c:if test="${requestScope.discuss_current_page1==1}">上一页</c:if>
                <c:if test="${requestScope.discuss_current_page1>1}">
                    <a href="getdiscussServlet?discuss_current_page1=${requestScope.discuss_current_page1-1}&topic_id=1">上一页</a>
                </c:if>
                <c:if test="${requestScope.discuss_current_page1==requestScope.discuss_page_count1}">下一页</c:if>
                <c:if test="${requestScope.discuss_current_page1<requestScope.discuss_page_count1}">
                    <a href="getdiscussServlet?discuss_current_page1=${requestScope.discuss_current_page1+1}&topic_id=1">下一页</a>
                </c:if>
                <a href="getdiscussServlet?discuss_current_page1=${requestScope.discuss_page_count1}&topic_id=1">尾页</a>
            </div>
        </div>
    </div>
</main>
</body>
</html>
