<%--
  Created by IntelliJ IDEA.
  User: wuyuanzhou
  Date: 2023/5/2
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
密码：
    <input type="password" id="password" name="password" required>
    <br>
确认密码：
    <input type="password" id="confirm-password" name="confirm-password" required>
    <span id="password-mismatch" style="color:red;display:none;">两次密码不一致，请重新输入。</span>
    <br>
    <input type="submit" value="提交">
</form>

<script>
    var password = document.getElementById("password");
    var confirm_password = document.getElementById("confirm-password");
    var password_mismatch = document.getElementById("password-mismatch");

    function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("两次密码不一致，请重新输入。");
            password_mismatch.style.display = "inline";
        } else {
            confirm_password.setCustomValidity('');
            password_mismatch.style.display = "none";
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

</script>
</body>
</html>
