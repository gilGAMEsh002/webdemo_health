<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/23
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.ArrayList,dao.*" %>
<%@ page import="dao.impl.CollectDaoImpl" %>
<%@ page import="service.ArticleService" %>

<%--用户未登录会被过滤,跳转到login.jsp--%>
<%--用户已登录则在此显示用户信息
        -用户名,邮箱
        -收藏夹预览
    两个按钮:
        -登出
        -注销
--%>

<%
    User user = (User) session.getAttribute("user");

%>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <title>Title</title>

    <script>
        function confirmPassword(){
            var password1 = document.getElementById("newpassword")
            var password2 = document.getElementById("confirm_newpassword")
            var warning = document.getElementById("warning")

            if(password1.value!==password2.value){
                password2.setCustomValidity("两次密码不一致,请重新输入")
                warning.style.display = "inline";
                // document.getElementById("warning").innerHTML="<br>两次输入密码一致";
                // document.getElementById("submit").disabled = false;

            }else {
                password2.setCustomValidity('');
                warning.style.display = "none";
                // document.getElementById("warning").innerHTML="<br>两次输入密码不一致!";
                // document.getElementById("submit").disabled = true;
            }

        }
        document.getElementById("newpassword").onchange = confirmPassword;
        document.getElementById("confirm_newpassword").onkeyup = confirmPassword;

        function uploadAvatar() {
            // 获取上传的文件
            var file = document.querySelector('input[type="file"]').files[0];

            // 构造 FormData 对象
            var formData = new FormData();
            formData.append('avatar', file, '<%= user.getUserName() %>' + Date.now() + '.jpg');

            // 发送 Ajax 请求
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'UploadImageServlet', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // 上传成功，刷新页面
                    window.location.reload();
                } else {
                    // 上传失败，显示错误信息
                    alert('上传失败：' + xhr.statusText);
                }
            };
            xhr.send(formData);


            document.querySelector('#uploadForm').addEventListener('submit', function (event) {
                event.preventDefault();
                uploadAvatar();
            });
        }

    </script>
    <style>
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
<body onload="initAJAX()">
<nav>
    <img src="../image/6019@1580486573@2.png" style="width: 100%; height: calc(1/3 * 100%); object-fit: none; object-position: bottom;">
</nav>
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
<article>

    <header>
        <h1>个人资料</h1>
    </header>

    <article>
        <section>
            <ul style="list-style: none">
                <li style="display: inline-block;border-radius: 10px">
                    <img style="width: 180px;height: 180px;border-radius: 10px" src="${pageContext.request.contextPath}<%=user.getAvatar_path()%>" alt="用户头像">
                </li>
                <br>
                <br>
                <br>
                <li style="display: inline-block;"><strong>用户名:<%=user.getUserName()%></strong></li>
                <br>
                <br>
                <li style="display: inline-block;"><strong>邮 箱:<%=user.getMail()%></strong></li>
            </ul>
        </section>
        <section>
            <h3>修改个人信息</h3>
            <form action="UploadImageServlet" id="uploadForm" method="post" enctype="multipart/form-data">
                <input type="file" name="avatar">
                <input style="width: 50%" type="submit" value="上传">
            </form>

            <form action="UpdateUserServlet"  style="display: flex; flex-direction: row">
                <input type="text" name="newname" placeholder="新用户名" style="width: 50%;justify-content: flex-start"
                       required pattern="[\u4e00-\u9fa5 A-Z a-z 0-9 _]{3,16}">
                <button type="submit" style="width: 30%" >修改用户名</button>
            </form>
            <form action="UpdateUserServlet" style="display: flex; flex-direction: row">
                <input type="email" name="newmail" placeholder="新邮箱" style="width: 50%;justify-content: flex-start">
                <button type="submit" style="width: 30%">修改邮箱</button>
            </form>
            <form action="UpdateUserServlet" style="display: flex; flex-direction: row">
                <input type="text" name="newpassword" placeholder="新密码" style="width: 50%;justify-content: flex-start">
                <input type="text" name="confirm_newpassword" placeholder="确认密码" onkeyup="confirmPassword()" style="width: 50%;"
                       required pattern="\w{8,20}">
                <button type="submit" style="width: 30%">修改密码</button>
            </form>
        </section>
        <section>

        </section>
    </article>

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
        //User user = (User) session.getAttribute("user");
        CollectDaoImpl dao=new CollectDaoImpl();
        ArticleService articleService=ArticleService.getInstance();
        ArrayList collections=new ArrayList();
        collections=dao.userCollections(user.getUserName(), favorite);
    %>
    <article>
        <div>

            <nav>
                <ul>
                    <li><h2>收藏夹</h2></li>
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
        <details>
            <summary role="button" class="secondary">展开/收起</summary>
            <div id="infoDiv">
                <%for (int i=collections.size()-1;i>=0;i--)
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
                }%>
            </div>
        </details>
    </article>

    <footer>
        <form action="${pageContext.request.contextPath}/LogoutServlet">
            <fieldset>
                <label for="terms">
                    <input type="checkbox" id="terms" name="terms" value="true">取消记住密码
                </label>
            </fieldset>
            <button type="submit" class="contrast" style="width: 30% ">Logout</button>
        </form>

        <%--        <div style="display-inside: ruby-base-container">--%>
        <%--            <a href="${pageContext.request.contextPath}/LogoutServlet" role="button" >--%>
        <%--                登出--%>
        <%--            </a>--%>
        <%--        </div>--%>

    </footer>

</article>



</body>
</html>
