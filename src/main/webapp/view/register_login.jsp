<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 18/02/2023
  Time: 9:02 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bài Tập</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="../themify-icons/themify-icons.css"/>
    <link rel="stylesheet" href="../css/bootstrap.css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url('../img/bg.jpg') top center / cover no-repeat;
        }

        form {
            margin-top: 24px;
        }

        .login {
            width: 500px;
            height: 400px;
            border: 1px solid gray;
            border-radius: 10px;
            text-align: center;
            margin: auto;
        }

        .login h2 {
            margin-top: 40px;
            color: #868787;
            font-family: sans-serif;
        }

        .login .username,
        .login .password {
            width: 400px;
            height: 40px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid gray;
            padding-left: 20px;
        }

        .login .submit,
        .login a {
            display: inline-block;
            width: 400px;
            height: 40px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: none;
            background-color: #45a049;
            color: #fff;
            text-decoration: none;
            line-height: 40px;
            opacity: 0.8;
        }

        .login .submit:hover,
        .login a:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
<form method="post" action="/food?actionUser=login">
    <div class="login">
        <h2>Login</h2>
        <input value="${loginName}" type="text" class="username" name="username" placeholder="username"/>
        <input value="${loginPassword}" type="password" class="password" name="password" placeholder="password"/>
        <input type="submit" class="submit" value="Đăng nhập">
        <hr>
        <a href="/food?actionUser=register" style="background-color: Blue;">Đăng ký</a>
    </div>
</form>

<script src="../js/bootstrap.js.map"></script>
</body>
</html>
