<%--
  Created by IntelliJ IDEA.
  User: coke
  Date: 2023/5/21
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Title</title>

</head>
<style>
    .addArticle{
       display: flex;
        justify-content: center;
        align-items: center;+
        height: 100%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);

    }
    .info{
        display: flex;
    }
    .myForm {
        background-color: #f5f5f5;
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

</style>
<body>

<div class="addArticle">

<form action="addArticleServlet" method="post" class="myForm" id="myForm">
    <div class="info" >
        <span class="help">标题</span>
        <input type="text"  name="title" >
        <!-- tag -->
        <span class="help">标签</span><br/>
        <input type="text" id="tags"  name="tags"><br>
    </div>
    <div class="foot_line"></div>
    <!-- content -->
    <div class="editormd" id="mdView">
        <span>文章内容</span>
        <textarea name="content"></textarea>
    </div>
    <br/>
    <input   type="submit"   value="发布" onclick="checkFormCompletion()"/>
</form>
</div>

</body>
<script>
    var isFormComplete = false;
    var form = document.getElementById("myForm");

    function checkFormCompletion() {
        var inputs = form.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value === "") {
                isFormComplete = false;
                return;
            }
        }
        isFormComplete = true;
    }

    for (var i = 0; i < form.elements.length; i++) {
        form.elements[i].addEventListener("blur", checkFormCompletion);
    }

    form.addEventListener("submit", function(event) {
        if (!isFormComplete) {
            event.preventDefault();
            alert("请填写所有必填字段");
        }
        else{
            alert("发表成功");
        }
    });
</script>

</html>
