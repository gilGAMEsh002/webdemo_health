
<%@ page import="pojo.Tag" %>
<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/23
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <title>Title</title>
    <style>
        /* 全局样式 */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #F5F4F0;
        }

        /* 显示板块样式 */
        .show-block {
            width: 98%;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #E5E5E5;
            padding: 20px;
            text-align: center;
        }

        .show-block h2 {
            margin-top: 0;
        }

        .show-block p {
            margin-bottom: 0;
        }

        /* 标签样式 */
        .tag {
            display: inline-block;
            width: 22%;
            margin: 10px 1%;
            padding: 10px;
            background-color: #0eaaaa;
            color: #fff;
            text-align: center;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* 清除浮动 */
        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }

        /* 添加板块样式 */
        .add-block {
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            border: 1px solid #E5E5E5;
            padding: 20px;
            text-align: center;
        }

        .add-block input[type="text"] {
            display: inline-block;
            width: 70%;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .add-block button[type="submit"] {
            display: inline-block;
            width: 25%;
            background-color: #166e6e;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-block button[type="submit"]:hover {
            background-color: #1cadad;
        }

        /* 响应式布局 */
        @media screen and (max-width: 768px) {
            .tag {
                width: 45%;
            }
        }

        @media screen and (max-width: 480px) {
            .tag {
                width: 100%;
            }
        }
        .search-btn {
            color: #666;
            background-color: transparent;
            border: none;
            outline: none;
            position: absolute;
            right: 0;
            top: 0;
            height: 100%;
            width: 40px;
            text-align: center;
        }

        .search-btn i {
            font-size: 18px;
            line-height: 40px;
        }

    </style>


</head>
<body>
<%--&lt;%&ndash; 导航栏实现   &ndash;%&gt;--%>
<%--<nav style="position: sticky;height: 80px;top: 0;z-index: 999;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);background-color: #fff;">--%>
<%--    <ul style="margin-left: 1px;;width: 6%; ">--%>
<%--        <li style="display: flex;justify-content: center;align-content: center;"><strong><a href="index.jsp" style="font-size: 30px;">健&nbsp;康</a></strong></li>--%>
<%--    </ul>--%>
<%--    <ul>--%>
<%--        <li><a href="tags.jsp">标签页</a></li>--%>
<%--        <li><a href="discussion.jsp">讨论组</a></li>--%>
<%--    </ul>--%>
<%--    <ul style="flex: 1; display: flex;margin-bottom:-20px;margin-left: -50px; justify-content: center; align-items: center;padding: 10px; border-radius: 20px; border: none;  ">--%>
<%--        <input type="search" id="search" name="search" placeholder="Search" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); opacity: 0.8;width: 70%;">--%>
<%--    </ul>--%>
<%--    <ul style="margin-right: 5px;">--%>
<%--        <li><a href="message.jsp">邮件</a></li>--%>
<%--        <li><a href="user.jsp" role="button" style="padding: 10px;color: #ffffff;">用户</a></li>--%>
<%--    </ul>--%>
<%--</nav>--%>
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
</nav><%--main--%>
<br>
<div class="show-block">
    <h2>标签列表</h2>
    <div class="clearfix">

        <div class="tag" >#${requestScope.tags[0].name}(${requestScope.tags[0].article_number})</div>
        <div class="tag">#${requestScope.tags[1].name}(${requestScope.tags[1].article_number})</div>
        <div class="tag">#${requestScope.tags[2].name}(${requestScope.tags[2].article_number})</div>
        <div class="tag">#${requestScope.tags[3].name}(${requestScope.tags[3].article_number})</div>
    </div>
    <div class="clearfix">
        <div class="tag">#${requestScope.tags[4].name}(${requestScope.tags[4].article_number})</div>
        <div class="tag">#${requestScope.tags[5].name}(${requestScope.tags[5].article_number})</div>
        <div class="tag">#${requestScope.tags[6].name}(${requestScope.tags[6].article_number})</div>
        <div class="tag">#${requestScope.tags[7].name}(${requestScope.tags[7].article_number})</div>
    </div>
    <div class="clearfix">
        <div class="tag">#${requestScope.tags[8].name}(${requestScope.tags[8].article_number})</div>
        <div class="tag">#${requestScope.tags[9].name}(${requestScope.tags[9].article_number})</div>
        <div class="tag">#${requestScope.tags[10].name}(${requestScope.tags[10].article_number})</div>
        <div class="tag">#${requestScope.tags[11].name}(${requestScope.tags[11].article_number})</div>
    </div>
</div>

<div class="add-block">
    <form id="addtag" >
        <input type="text" name="newtag" id="newtag" placeholder="请输入新标签">
        <button type="submit">添加标签</button>
    </form>
</div>

<div class="add-block" style="display: flex;flex-direction: row;">
    <form id="article-form" style="width: 100%" >
        <label for="title">文章标题：</label>
        <input type="text" name="title" id="title">

        <label for="tags">文章标签：</label>
        <input type="text" name="tags" id="tags">
        <br>
        <button type="submit" onclick="">提交</button>
    </form>
</div>



<script>
    $(function() {
        $('#addtag').submit(function(event) {
            event.preventDefault(); // 阻止表单的默认提交行为
            var newtag = $('#newtag').val(); // 获取输入框的值
            $.ajax({
                type: 'POST',
                url: 'AddTagServlet', // 提交的 URL
                data: {newtag:newtag}, // 提交的数据
                success: function(response) {
                    // 处理成功响应的逻辑
                    console.log(response);
                    alert("新建标签成功")
                },
                error: function(xhr, status, error) {
                    // 处理出错的逻辑
                    console.log(error);
                    alert("标签创建失败,可能已存在标签")
                }
            });
        });
    });

    $(function() {
        $('#article-form').submit(function(event) {
            event.preventDefault(); // 阻止表单默认提交行为

            var title = $('#title').val();
            var tags = $('#tags').val();

            $.ajax({
                url: 'AttachTagToArticleServlet',
                method: 'POST',
                data: {
                    title: title,
                    tags: tags
                },
                success: function(response) {
                    // 处理后端返回的响应
                    console.log(response);
                    location.reload();
                    alert('标签已成功添加！');
                },
                error: function(xhr, status, error) {
                    // 处理请求失败的情况
                    console.error(error);
                    alert('重复添加文章标签！');
                }
            });
        });
    });
</script>
</body>
</html>
