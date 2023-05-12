<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2023/5/7
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="dao.*" import="java.util.ArrayList" %>
<%@ page import="pojo.User" %>
<html>
<head>
    <title></title>
</head>
<body onload="initAJAX()">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
<SCRIPT language="JavaScript">
    var xmlHttp= false;
    var number=1;
    function initAJAX(){
        if(window. XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        }
        else if(window. ActiveXObject){
            //IE浏览器
            try{
                xmlHttp=new ActiveXObject("Msxm12.XML.HTTP");
            }catch(e){
                try{
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    window.alert("该浏览器不支持AJAX");
                }
            }
        }
    }
    function showInfo(){
        number++;
        if(number%2==0) {
            xmlHttp.open("GET", "favorite2.jsp", true);
        }else{
            xmlHttp.open("GET", "favorite1.jsp", true);
        }
        xmlHttp.onreadystatechange =function(){
            if(xmlHttp.readyState == 4) {
                infoDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }
</SCRIPT>
<%
    String favorite="1";
   User user = (User) session.getAttribute("user");
    CollectDao dao=new CollectDao();
    ArrayList collections=new ArrayList();
    collections=dao.userCollections(user.getUserName(), favorite);
%>
<div id="1" class="grid">
    <div></div>
    <div>
        <article>
            <div>

                <nav>
                    <ul>
                        <li><strong><font size="7">收藏夹</font></strong></li>
                    </ul>
                    <ul>
                        <li>
                            <a href="index.jsp" role="button" data-tooltip="个人主页" data-placement="bottom">返回</a><br>
                        </li>
                    </ul>
                </nav>
                <form action="/Favorite_Servlet">
                    <fieldset>
                        <label for="switch">
                            <p align="left">
                                &ensp;切&emsp;换&emsp;收&emsp;藏&emsp;夹：<br>
                                收藏夹1
                                <input type="checkbox" id="switch" name="switch" role="switch" onchange="showInfo()">
                                收藏夹2
                            </p>
                        </label>
                    </fieldset>
                </form>
            </div>
            <div id="infoDiv">
                <%for (int i=collections.size()-1;i>=0;i--)
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
                }%>
            </div>
        </article>
    </div>
    <div></div>
</div>
</body>
</html>