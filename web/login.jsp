<%@ page import="java.util.Objects" %>
<%@ page import="java.net.URLEncoder" %>
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
    <meta http-equiv="Content-Type" charset="utf-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <title>LOGIN pages</title>
    <style>
        /* Grid */
        body>main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: calc(100vh - 7rem);
            padding: 1rem 0;
        }

        article {
            padding: 0;
            overflow: hidden;
        }

        article div {
            padding: 1rem;
        }

        @media (min-width: 576px) {
            body>main {
                padding: 1.25rem 0;
            }

            article div {
                padding: 1.25rem;
            }
        }

        @media (min-width: 768px) {
            body>main {
                padding: 1.5rem 0;
            }

            article div {
                padding: 1.5rem;
            }
        }

        @media (min-width: 992px) {
            body>main {
                padding: 1.75rem 0;
            }

            article div {
                padding: 1.75rem;
            }
        }

        @media (min-width: 1200px) {
            body>main {
                padding: 2rem 0;
            }

            article div {
                padding: 2rem;
            }
        }

        /* Nav */
        summary[role="link"].secondary:is([aria-current], :hover, :active, :focus) {
            background-color: transparent;
            color: var(--secondary-hover);
        }

        /* Hero Image */
        article div:nth-of-type(2) {
            display: none;
            background-color: #374956;
            /*疑似idea出bug,将正确的路径报错了*/
            background-image: url("../image/6E8AC2F0DB0A2FA2259F1DB45FAB2205.jpg");
            background-position: center;
            background-size: cover;
        }

        @media (min-width: 992px) {
            .grid>div:nth-of-type(2) {
                display: block;
            }
        }

        /* Footer */
        body>footer {
            padding: 1rem 0;
        }
    </style>

</head>
<body>
<%
    String rememberUserName="";
    String rememberPassword="";

    System.out.println("jsp isRemember"+session.getAttribute("isRemember"));
//    if (session.getAttribute("isRemember")!=null&&session.getAttribute("isRemember").equals(true)){
        Cookie[] cookies = request.getCookies();
        Boolean autologin = false;
        if(cookies!=null){
            System.out.println("cookie不为空"+" "+cookies.length);
            for (Cookie cookie:cookies) {//查找cookie中记住的用户名和密码
                if("rememberUser".equals(cookie.getName())&&cookie.getValue()!=null&& !Objects.equals(cookie.getValue(), "")){
                    System.out.println("记住密码");
                    rememberUserName = cookie.getValue().split("&")[0];
                    rememberPassword = cookie.getValue().split("&")[1];

                }
//                System.out.println("用户名"+rememberUserName);
//                System.out.println("密码"+rememberPassword);
//                System.out.println(cookie.getValue());
                if(cookie.getValue().equals("autologin"))
                    autologin = true;
//
//                if(autologin&& !Objects.equals(rememberUserName, "") && !Objects.equals(rememberPassword, "")){
//                    System.out.println("autologin");
//                    response.sendRedirect("LoginServlet?username=" + rememberUserName + "&password=" + rememberPassword);
//                }
                System.out.println("    "+autologin+" "+rememberUserName+" "+rememberPassword);
                if(autologin&& !Objects.equals(rememberUserName, "") && !Objects.equals(rememberPassword, "")){
                    System.out.println("自动登录");
                    String encodedUserName = URLEncoder.encode(rememberUserName, "UTF-8");
                    String encodedPassword = URLEncoder.encode(rememberPassword, "UTF-8");
                    response.sendRedirect("LoginServlet?username=" + encodedUserName + "&password=" + encodedPassword);
                    return;
                }

            }
        }
//    }




%>
<!-- Main -->
<main class="container">
    <article class="grid">
        <div>
            <hgroup>
                <h1>Sign in</h1>
                <h2>Welcome to the HEALTH website</h2>
            </hgroup>
            <form action="LoginServlet" method="post" id="loginForm" >
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
                        <label for="remember">
                            <input type="checkbox" value="true" role="switch" id="remember" name="remember" />
                            Remember me
                        </label>
                        <label for="autologin">
                            <input type="checkbox" role="switch" value="true" id="autologin" name="autologin">
                            Autologin
                        </label>
                </fieldset>

                <button type="submit" class="contrast" >Login</button>
            </form>
            <a href="register.jsp" style="width: 30%" role="button" class="outline">点击注册</a>
        </div>
        <div>
        </div>
    </article>



</main>

<!-- ./ Main -->
</body>
</html>
