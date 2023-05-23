<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/5/17
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="dao.*" import="pojo.*" import="controller.*"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <title>Title</title>
</head>
<body>
<%
  User user = (User) session.getAttribute("user");
  String articleID ="432342";
  CollectDao cd=new CollectDao();
  boolean is_collect= cd.is_collect(user.getUserName(), articleID);
  String value;
  if(is_collect){
    value="取消收藏";
%>
<a href="collect_Servlet?favorite=0&articleID=<%=articleID%>&is_collect=1" role="button" class="secondary" style="width:160px"><%=value%></a>
<%}else {
    value="添加收藏";
%>
<details role="list" style="width:160px">
    <summary aria-haspopup="listbox"><%=value%></summary>
    <ul role="listbox">
        <li><a href="collect_Servlet?favorite=1&articleID=<%=articleID%>&is_collect=0">收藏夹1</a></li>
        <li><a href="collect_Servlet?favorite=2&articleID=<%=articleID%>&is_collect=0">收藏夹2</a></li>
    </ul>
</details>
<%}%>

</body>
</html>
