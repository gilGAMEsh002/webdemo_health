<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/23
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

</script>
</head>
<body>
<nav>
    <img src="../image/6019@1580486573@2.png" style="width: 100%; height: calc(1/3 * 100%); object-fit: none; object-position: bottom;">
</nav>
<nav style="position: sticky;height: 80px;top: 0;z-index: 999;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);background-color: #fff;">
    <ul style="margin-left: 5px;">
        <li><strong><a href="index.jsp" style="font-size: 24px;">健康</a></strong></li>
        <li><a href="tags.jsp">标签页</a></li>
        <li><a href="discussion.jsp">讨论组</a></li>
    </ul>
    <ul style="flex: 1; display: flex;margin-bottom:-20px;margin-left: -50px; justify-content: center; align-items: center;padding: 10px; border-radius: 20px; border: none;  ">
        <input type="search" id="search" name="search" placeholder="Search" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); opacity: 0.8;width: 70%;">
    </ul>
    <ul style="margin-right: 5px;">
        <li><a href="user.jsp" role="button" style="padding: 10px;color: #000;">用户</a></li>
    </ul>
</nav>

<article>

    <header>
        <h1>个人资料</h1>
    </header>

    <article>
        <section>
            <ul>
                <li><strong>用户名:<%=user.getUserName()%></strong></li>
                <li><strong>邮 箱:<%=user.getMail()%></strong></li>
            </ul>
        </section>
        <section>
            <h3>修改个人信息</h3>
            <%
                String choice = "0";

            %>
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
    </article>

    <article>
<%--           <iframe src="collections_presence.jsp" width="50%"></iframe>--%>
            <a href="collections_presence.jsp">收藏夹</a>

    </article>


    <footer>
        <div style="display-inside: ruby-base-container">
            <a href="${pageContext.request.contextPath}/LogoutServlet" role="button" >
                登出
            </a>
        </div>

    </footer>

</article>



</body>
</html>
