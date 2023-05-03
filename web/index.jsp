<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .nav-bar {
        background-color: #f0f0f0;
        display: flex;
        justify-content: flex-start;
        align-items: stretch;
        height: 60px;
    }

    .nav-bar ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
    }

    .nav-bar li {
        margin: 0 20px;
        position: relative;
    }

    .nav-bar li a {
        color: #333;
        font-size: 16px;
        text-decoration: none;
        text-transform: uppercase;
    }

    .nav-bar li:hover {
        background-color: #fff;
    }

    .nav-bar .dropdown ul {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        background-color: #fff;
        padding: 10px;
        border: 1px solid #ddd;
    }

    .nav-bar .dropdown ul li {
        margin: 0;
    }

    .nav-bar .dropdown:hover ul {
        display: block;
    }


    .nav-bar input[type="search"] {
        height: 30px;
        align-items: stretch;
        justify-content: center;
        border-radius: 4px;
        border: 1px solid #ddd;
        padding: 5px 10px;
        font-size: 14px;
        outline: none;
    }

    .nav-bar input[type="submit"]:focus {
        border-color: #333;
    }


</style>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<body>
<%-- 导航栏实现   --%>
<div class="nav-bar">
    <ul>
        <li style="float: left">健康网</li>
        <li><a href=index.jsp>首页</a></li>
        <li><a href=tags.jsp>标签页</a></li>
        <li><a href="discussion.jsp">讨论组</a></li>
        <form method="post" action="${pageContext.request.contextPath}/LoginServlet">
            <input type="search" name="q" placeholder="要搜索的内容" >
            <input type="submit" value="搜索" >
        </form>
        <li style="float: right" ><a href="user.jsp">用户</a></li>
    </ul>
</div>
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
