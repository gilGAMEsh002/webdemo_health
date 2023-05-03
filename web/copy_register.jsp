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
<form action="register_success.jsp" method="post" οnsubmit="return checkAll()">
    <!-- 表单提交的时候是会触发onsubmit事件的，如果onsubmit事件的方法返回是true，那么该表单允许提交，如果返回的是false，该表单不允许提交。-->
    <ul class="left-form">
        <input type="hidden" name="form" value="true"/>

                   <!--第一个输入框：昵称-->
        <li><input type="text" id="name" name="name" placeholder="昵称"
                   maxlength="15" οnblur="checkName()" /> <a href="#" id="nameclass" class=""> </a>
            <div class="clear"></div></li>&nbsp;&nbsp;
               <span  style="font-size:13px" id="namespan"></span> 
                  <!--第二 个输入框：账号 -->         
        <li><input type="text" id="id" name="id" placeholder="账号"
                   maxlength="15" οnblur="checkId()"/> <a href="#" id="idclass" class=""/> </a>
            <div class="clear"></div></li>&nbsp;&nbsp;
               <span  style="font-size:13px" id="idspan"></span>  
                
        <!--第三个输入框：邮箱-->     
        <li><input type="text" id="email" name="email" placeholder="邮箱"
                   maxlength="20" οnblur="checkEmail()"/> <a href="#" id="emailclass" class=""> </a>
            <div class="clear"></div></li>&nbsp;&nbsp;
               <span  style="font-size:13px" id="emailspan"></span>  

                <!--第四个输入框：密码-->   
        <li><input type="password" id="password" name="password" placeholder="密码"
                   maxlength="16" οnblur="checkPassword()" /> <a href="#" id="passwordclass" class=""> </a>
            <div class="clear"></div></li>&nbsp;&nbsp;
               <span  style="font-size:13px" id="passwordspan"></span>   
        <!--第五个输入框：确认-->   
        <li><input type="password" id="password2" name="password2" placeholder="确认密码"
                   maxlength="16" οnblur="checkSame();"/> <a href="#" id="passwordclass2" class=""> </a>
            <div class="clear"></div></li>&nbsp;&nbsp;
               <span  style="font-size:13px" id="passwordspan2"></span>  
        <li><input type="submit" value="注册"/>
            <div class="clear"></div></li>
    </ul>
</form>
<script>
//2.接下来看一下对应的js函数是如何获取这些id，以及如何利用这些id的。

//1.检查用户名  
function checkName(){  
    var name = document.getElementById("name").value;  
    var spanNode = document.getElementById("namespan");  
    //用户名的规则： 昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号
    var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;      
    if(reg.test(name)){  
        //符合规则  
        spanNode.innerHTML = "".fontcolor("green");  
        document.getElementById("nameclass").className = "icon ticker";   
        return true;  
    }else{  
        //不符合规则  
        spanNode.innerHTML = "昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号".fontcolor("red");  
        document.getElementById("nameclass").className = "icon into";    
        return false;  
    }     
}   
//2.检查密码
function checkPassword(){  
    var password = document.getElementById("password").value;  
    var spanNode = document.getElementById("passwordspan");  
    //密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
    var reg = /^([a-zA-Z0-9]){6,16}$/i;      
    if(reg.test(password)){  
        //符合规则  
        spanNode.innerHTML = "".fontcolor("green");  
        document.getElementById("passwordclass").className = "icon ticker";   
        return true;  
    }else{  
        //不符合规则  
        spanNode.innerHTML = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");  
        document.getElementById("passwordclass").className = "icon into";    
        return false;  
    }     
}   
//3.检查邮箱  
function checkEmail(){  
    var email = document.getElementById("email").value;  
    var spanNode = document.getElementById("emailspan");  
       //编写邮箱的正则  
    var reg = /^[a-z0-9]\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/i;   
    if(reg.test(email)){  
        //符合规则  
        spanNode.innerHTML = "".fontcolor("green");  
        document.getElementById("emailclass").className = "icon ticker";    
        return true;  
    }else{  
        //不符合规则  
        spanNode.innerHTML = "邮箱格式不正确，请重新填写！".fontcolor("red");  
        document.getElementById("emailclass").className = "icon into";    
        return false;  
    }     
}  
//4.检查两次输入的密码是否一致
function checkSame(){  
var password = document.getElementById("password").value; 
var password2 = document.getElementById("password2").value;  
var spanNode = document.getElementById("passwordspan2");  
   //密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
   var reg = /^([a-zA-Z0-9]){6,16}$/i;   
   //确认密码输入符合规则  
   if(reg.test(password2)){  
       //符合规则  
       if(password==password2){
       spanNode.innerHTML = "".fontcolor("green");  
       document.getElementById("passwordclass2").className = "icon ticker";   
            return true;  
       }else{
       spanNode.innerHTML = "两次输入的密码不一致！".fontcolor("red");  
       document.getElementById("passwordclass2").className = "icon into";    
           return false;  
       }
   }
   //确认输入密码不符合规则  
   else{  
       spanNode.innerHTML = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");  
       document.getElementById("passwordclass2").className = "icon into";    
       return false;  
   }     
}  
    
//5.检查账号是否符合输入规则
function checkId(){  
    var id = document.getElementById("id").value;  
    var spanNode = document.getElementById("idspan");  
    //账号的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
    var reg = /^([a-zA-Z0-9]){6,16}$/i;      
    if(reg.test(id)){  
        //符合规则  
        spanNode.innerHTML = "".fontcolor("green");  
        document.getElementById("idclass").className = "icon ticker";   
        return true;  
    }else{  
        //不符合规则  
        spanNode.innerHTML = "账号的长度为 6-16，包含任意的字母、数字，不可以使用其他符号".fontcolor("red");  
        document.getElementById("idclass").className = "icon into";    
        return false;  
    }     
}  
//6.检查用户所有的输入的所有是否符合规则
function checkAll(){  
        var email = checkEmail();  
        var name = checkName();  
        var id = checkId();  
        var password = checkPassword();  
        var same = checkSame();  
        if(email&&name&&id&&password&&same){  
            return true;  
        }else{  
            return false;  
        }  

    }
function checkAll(){
    var email = checkEmail();
    var name = checkName();
    var id = checkId();
    var password = checkPassword();
    var same = checkSame();
    if(email&&name&&id&&password&&same){
        return true;
    }else{
        return false;
    }

}

</script>
</body>
</html>
