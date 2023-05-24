<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/5/11
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="dao.*" import="java.util.ArrayList" %>
<%@ page import="pojo.User" %>
<%@ page import="dao.impl.CollectDaoImpl" %>
<%@ page import="controller.ArticleServlet" %>
<%@ page import="service.ArticleService" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String favorite="1";
    User user = (User) session.getAttribute("user");
    ArticleService articleService=ArticleService.getInstance();
    CollectDaoImpl dao=new CollectDaoImpl();
    ArrayList collections=new ArrayList();
    collections=dao.userCollections(user.getUserName(),favorite);
    for (int i=collections.size()-1;i>=0;i--)
    {
        out.println("<aside>\n" +
                "    <nav>\n" +
                "        <ul>\n" +
                "            <article><li><a href= 'ArticleServlet?id="+collections.get(i)+"'>"
                +articleService.getTitle((Integer) collections.get(i))+"</a></li></article>\n" +
                "        </ul>\n" +
                "    </nav>\n" +
                "</aside>\n" +
                "</body>\n" +
                "</html>");
    }
%>
</body>
</html>
