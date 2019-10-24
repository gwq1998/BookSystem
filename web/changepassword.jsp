<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <base href="<%=basePath%>">
    <title>login</title>

    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/swal.css">
    <link rel="stylesheet" type="text/css" href="css/yzm.css">

    <script type="text/javascript" src="js/swal.js"></script>
    <script type="text/javascript" src="js/background.js"></script>
    <script type="text/javascript" src="js/vector.js"></script>
    <script type="text/javascript" src="js/REGyzm.js"></script>

    <style>

    </style>
</head>
<body>
<script>
    function addCheck(){
        var username=document.getElementById("entry_name").value;
        var password=document.getElementById("entry_password").value;
        var newword=document.getElementById("entry_repassword").value;
        if(username==""){
            swal("用户名不能为空!");
            document.getElementById("entry_name").focus();
            return false;
        }
        if(password==""){
            swal("密码不能为空!");
            document.getElementById("entry_password").focus();
            return false;
        }
        if(password != newword){
            swal("两次输入密码不相同!");
            document.getElementById("entry_repassword").focus();
            return false;
        }
    }
    function validate(){
        var flag = addCheck();
        if(flag == false)
            return false;
        return true;
    }
</script>


<div id="container">
    <div id="output">
        <div class="containerT">
            <h1>更改密码</h1>
            <form class="form" id="entry_reform" name="register" action="password.jsp" method="post" onsubmit="return validate()">
                <input type="text" class="userid" name="Userid" placeholder="账号" id="entry_id" />
                <input type="password" class="password" name="Password" placeholder="密码" id="entry_password" />
                <input type="password" class="password" name="rePassword" placeholder="再次输入密码" id="entry_repassword" />
                <input type="password" class="password" name="newPassword" placeholder="输入新密码" id="entry_newpassword" />
                <button type="submit" id="entry_REGbtn" class="register">更改</button>

                <div id="prompt" class="prompt"></div>
            </form>
        </div>
    </div>
</div>



<!-- ---------------------------------------------------------------------- -->
<!-- <script>
    function TryLogin() {
        if ($(".username").val() == '')
            swal("请输入用户名!");
        else if ($(".password").val() == '')
            swal("请输入密码!");
        else if ($(".password").val() != $(".repassword").val())
            swal("输入的密码不一致!");
    }
</script> -->
<!-- ---------------------------------------------------------------------- -->

<script type="text/javascript">
    $(function() {
        Victor("container", "output"); //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event) {
            if (event.keyCode == 13) {
                $("#entry_btn").click();
            }
        });
    });
</script>
<div style="text-align:center;">
</div>
</body>
</html>
