<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/21
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookShare综合管理平台</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="Login">
<!--Login-开始-->

<div class="Login_heand dk">
    <a href="#" class="Login_logo fl">
        <img src="images/logo.png" class="fl"/><p class="fl">BookShare综合管理平台</p><div class="clear"></div>
    </a>
    <a href="#" class="Login_down fr">(IDEA,JDK1.8,Mysql5.6,Tomecat9)</a><div class="clear"></div>
</div>

<div class="Login_k">
    <div class="Login_T">密码登录<p></p></div>
    <!--登录-开始-->
    <form class="Login_dl" action="/hello" method="post">
        <div class="Login_row">
            <input name="name" type="text" value="" class="Login_input Login_inp1" placeholder="用户名" />
        </div>
        <div class="Login_row">
            <input name="password" type="password" value="" class="Login_input Login_inp2" placeholder="密码" />
        </div>
        <input type="submit" value="登录" class="Login_dla">

        <label class="Login_pitch fl">
            <input type="checkbox" name="checkbox01" class=" fl" /><div class="fl">自动登录</div><div class="clear"></div>
        </label>
        <div class="Login_wj fr">
            <a href="#">忘记密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">注册</a>
        </div><div class="clear"></div>

    </form>
    <!--登录-结束-->

</div>

<div class="Login_foot">
    <p>山西大学软件学院</p>
    <p>201515614261 孟祺</p>
</div>
<!--Login-结束-->

</body>
</html>
