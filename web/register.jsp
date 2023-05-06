<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/4/30
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <script src="js/jquery-3.3.1.js"></script>

    <script>
        /*
        * 表单自身验证:
        * 1.用户名: 3到16位（字母，数字,中文，下划线，减号）
        * 2.密码:只能输入6-20个字母、数字、下划线
        * */

        // //用户名校验
        // function checkUsername(){
        //     var username = document.getElementById("username").value;
        //     var spanNode = document.getElementById("namespan");
        //     var reg_username = /^[\u4E00-\u9FA5A-Za-z0-9_]{3,16}$/;
        //     var flag = reg_username.test(username);
        //     // if(flag){
        //     //     // spanNode.innerHTML = "".fontcolor()
        //     //     // $("#username").css("border","");
        //     //
        //     // }else{
        //     //     spanNode.innerHTML = "错误";
        //     //     // $("#username").css("border","1px solid red")
        //     // }
        //     if(!flag){
        //         spanNode.addEventListener("focus",function (event) {
        //             event.target.style.background="pink";
        //         },true)
        //     }else {
        //         spanNode.addEventListener("blur",function (event) {
        //             event.target.style.background="";
        //         },true)
        //     }
        // }
        // //校验密码
        // function checkPassword() {
        //     //1.获取密码值
        //     var password = $("#password").val();
        //     //2.定义正则
        //     var reg_password = /^\w{8,20}$/;
        //
        //     //3.判断，给出提示信息
        //     var flag = reg_password.test(password);
        //     if(flag){
        //         //密码合法
        //         $("#password").css("border","");
        //     }else{
        //         //密码非法,加一个红色边框
        //         $("#password").css("border","1px solid red");
        //     }
        //
        //     return flag;
        // }

        function confirmPassword(){
            var password1 = document.getElementById("password")
            var password2 = document.getElementById("confirm_password")
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
        document.getElementById("password").onchange = confirmPassword;
        document.getElementById("confirm_password").onkeyup = confirmPassword;
        //当某一个组件失去焦点是，调用对应的校验方法
        // $("#username").blur(checkUsername);
        // $("#password").blur(checkPassword);

    </script>

</head>
<body>
<main class="container">
    <article class="grid">
        <div>
            <hgroup>
                <h1>Register</h1>
                <h2>A minimalist layout for Register pages</h2>
            </hgroup>
            <form method="post" action="RegisterServlet"id="registerForm">
                请输入用户名:<input
                        type="text"
                        name="username"
                        id="username"
<%--                        onblur="checkUsername()"--%>
                        placeholder="3-20个字符"
                        <%-- 此处的正则表达式 直接写即可不用加前后的\和^$ --%>
                        required pattern="[\u4e00-\u9fa5 A-Z a-z 0-9 _]{3,16}"
                />
<%--                <span style="font-size:13px" id="namespan"></span>--%>
                请输入邮箱:<input
                    type="email"
                    name="email"
                    id="email"
            <%--                        onblur="checkUsername()"--%>
                    placeholder="email"
            <%-- 此处的正则表达式 直接写即可不用加前后的\和^$ --%>
                    required
            />
               请输入密码: <input
                        type="password"
                        name="password"
                        id="password"
<%--                        onblur="checkPassword()"--%>
                        placeholder="8-20个数字或字母"
<%--                        aria-label="Password"--%>
                        required pattern="\w{8,20}"
                />
<%--                <span style="font-size:13px" id="passwordspan"></span>--%>
                请确认密码:<input
                        type="password"
                        name="confirm_password"
                        id="confirm_password"
                        placeholder="ConfirmPassword"
<%--                        aria-label="ConfirmPassword"--%>
                        required pattern="\w{8,20}"
                        onkeyup="confirmPassword()"
            /><span id="warning" style="display: none"></span>
                <%--                preventDefault()可以在用户没有填写某一栏时提示???--%>
                <button type="submit" class="contrast" onclick="preventDefault()">Register</button>

            </form>
        </div>
        <div></div>
    </article>
</main>
</body>
</html>
