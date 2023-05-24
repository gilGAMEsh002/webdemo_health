<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: coke
  Date: 2023/5/21
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <title>Title</title>

</head>
<style>
    .addArticle{
        display: flex;
        justify-content: center;
        align-items: center;+
    height: 100%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);

    }
    .myForm {
        background-color: #f5f5f5;
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        width: 70%;
    }

    textarea[name="content"] {
        width: 100%;
        min-height: 400px;
    }

</style>
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
<div class="addArticle">

    <form action="addArticleServlet" method="post" class="myForm" id="myForm">
        <div class="info" >
            <strong  style="display: flex;align-content: center;justify-content: center;"  >发表文章</strong>
            <span class="help">标题</span>
            <input type="text"  name="title" width="600"><br>
            <!-- tag -->
            <span class="help">标签</span><br/>
            <input type="text" id="tags"  name="tags" width="600"><br>
        </div>
        <div class="foot_line"></div>
        <!-- content -->
        <div class="editormd" id="mdView">
            <span>文章内容</span>
            <textarea name="content"></textarea>
        </div>
        <br/>
        <input   type="submit"   value="发布" onclick="checkFormCompletion()"/>
    </form>
</div>

</body>
<script>
    var isFormComplete = false;
    var form = document.getElementById("myForm");

    function checkFormCompletion() {
        var inputs = form.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value === "") {
                isFormComplete = false;
                return;
            }
        }
        isFormComplete = true;
    }

    for (var i = 0; i < form.elements.length; i++) {
        form.elements[i].addEventListener("blur", checkFormCompletion);
    }

    form.addEventListener("submit", function(event) {
        if (!isFormComplete) {
            event.preventDefault();
            alert("请填写所有必填字段");
        }
        else{
            alert("发表成功");
        }
    });
</script>

</html>
