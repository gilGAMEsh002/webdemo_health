<%@ page import="utils.GenerateCode" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/5/12
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>

<%
    //清空浏览器缓存
    response.setHeader("pragma","no-cache");
    response.setHeader("cache-control","no-cache");
    response.setHeader("expires","0");
    //获取验证码字符，用于比对
    String result= GenerateCode.drawImageVerificate(response);
    System.out.println(" result:"+result);
    session.setAttribute("result",result);
    out.clear();
    out=pageContext.pushBody();

%>
