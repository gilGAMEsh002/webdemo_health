<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/23
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导航栏</title>
    <style>
        nav {
            position: sticky;
            height: 80px;
            top: 0;
            z-index: 999;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        nav ul:first-child {
            margin-left: 1px;
            width: 6%;
            display: flex;
            justify-content: center;
            align-content: center;
        }

        nav ul li strong {
            font-size: 30px;
        }

        nav ul li a {
            padding: 10px;
            color: #333;
            text-decoration: none;
            font-size: 18px;
        }

        nav ul li a:hover {
            color: #32936F;
        }

        nav input[type="search"] {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            opacity: 0.8;
            width: 70%;
        }

        nav ul:last-child {
            margin-right: 5px;
            display: flex;
        }

        nav ul:last-child li {
            margin-left: 20px;
        }

        nav ul:last-child li a {
            padding: 10px;
            color: #333;
            text-decoration: none;
            font-size: 18px;
        }

        nav ul:last-child li a[role="button"] {
            background-color: #32936F;
            border-radius: 20px;
            padding: 10px 20px;
            color: #fff;
            font-size: 18px;
        }

        nav ul:last-child li a[role="button"]:hover {
            background-color: #2D7F5E;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li><strong><a href="index.jsp">健&nbsp;康</a></strong></li>
    </ul>
    <ul>
        <li><a href="tags.jsp">标签页</a></li>
        <li><a href="discussion.jsp">讨论组</a></li>
    </ul>
    <ul>
        <input type="search" id="search" name="search" placeholder="Search">
    </ul>
    <ul>
        <li><a href="message.jsp">邮件</a></li>
        <li><a href="user.jsp" role="button">用户</a></li>
    </ul>
</nav>
</body>
</html>