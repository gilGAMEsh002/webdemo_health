<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/26
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <title>LOGIN pages</title>
</head>
<body>
<%
    String rememberUserName="";
    String rememberPassword="";
    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for (Cookie cookie:cookies) {//查找cookie中记住的用户名和密码
            if("rememberUser".equals(cookie.getName())){
                rememberUserName = cookie.getValue().split("&")[0];
                rememberPassword = cookie.getValue().split("&")[1];
            }
        }
    }



%>
<!-- Main -->
<main class="container">
    <article class="grid">
        <div>
            <hgroup>
                <h1>Sign in</h1>
                <h2>A minimalist layout for Login pages</h2>
            </hgroup>
            <form action="LoginServlet" method="post" id="loginForm">
                <input
                        type="text"
                        name="username"
                        value="<%=rememberUserName%>"
                        placeholder="Username"
                        aria-label="username"
                        autocomplete="nickname"
                        required pattern="[\u4e00-\u9fa5 A-Z a-z 0-9 _]{3,20}"
                />
                <input
                        type="password"
                        name="password"
                        value="<%=rememberPassword%>"
                        placeholder="Password"
                        aria-label="Password"
                        autocomplete="current-password"
                        required pattern="\w{8,20}"
                />
                <fieldset>
                    <div style="display:-moz-inline-block;float: left; margin-inline-end: 20px">
                        <label for="remember">
                            <input type="checkbox" style="display: -moz-inline-block; float: left" value="true" role="switch" id="remember" name="remember" />
                            Remember me
                        </label>
                    </div>
                    <div style="display: inline-block ;float: left; ">
                        <input type="checkbox" style="display:-moz-inline-block; float: left" value="true" role="switch" id="autologin" name="autologin">
                          Autologin
                    </div>

                </fieldset>

                <button type="submit" class="contrast" >Login</button>
            </form>
        </div>
        <div></div>
    </article>
</main>
<!-- ./ Main -->
</body>
</html>
