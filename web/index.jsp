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
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <title>主页</title>

</head>
<body>
<%-- 导航栏实现   --%>
<nav>
    <ul>
        <li><strong><h2>健康</h2></strong></li>
    </ul>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="tags.jsp">标签</a></li>
        <li><a href="user.jsp" role="button">用户</a></li>
    </ul>
</nav>
<%--main--%>
<main>
<%--文章--%>
    <article>
        <h2>健康的定义</h2>
        健康是指一个人在身体、精神和社会等方面都处于良好的状态。<br>
        健康包括两个方面的内容：一是主要脏器无疾病，身体形态发育良好，体形均匀，人体各系统具有良好的生理功能，有较强的身体活动能力和劳动能力，这是对健康最基本的要求
        ；二是对疾病的抵抗能力较强，能够适应环境变化，各种生理刺激以及致病因素对身体的作用。<br>
        传统的健康观是“无病即健康”，现代人的健康观是整体健康，世界卫生组织提出“健康不仅是躯体没有疾病，还要具备心理健康、社会适应良好和有道德”。
        因此，现代人的健康内容包括：躯体健康、心理健康、心灵健康、社会健康、智力健康、道德健康、环境健康等。健康是人的基本权利。健康是人生的第一财富。


    </article>
    <aside> <!-- 侧边栏在主内容右侧 -->
        <h2>相关链接</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/LoginServlet">这是一个超链接</a></li>
            <!-- 侧边栏有 n 个超链接，略略略…… -->
        </ul>
    </aside>
</main>

</body>
</html>
