<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/5/11
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="dao.*" import="java.util.ArrayList" %>
<%@ page import="pojo.User" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String favorite="1";
    User user = (User) session.getAttribute("user");
    CollectDao dao=new CollectDao();
    ArrayList collections=new ArrayList();
    collections=dao.userCollections(user.getUserName(),favorite);
    for (int i=collections.size()-1;i>=0;i--)
    {
        out.println("<aside>\n" +
                "    <nav>\n" +
                "        <ul>\n" +
                "            <article><li><a href=\"#\">"+collections.get(i)+"</a></li></article>\n" +
                "        </ul>\n" +
                "    </nav>\n" +
                "</aside>\n" +
                "</body>\n" +
                "</html>");
    }
%>
</body>
</html>
