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
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="./stylesheet.css" />
    <link rel="stylesheet" href="../themify-icons/themify-icons.css" />
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .login  {
            width: 500px;
            height: 400px;
            border: 1px solid gray;
            border-radius: 10px;
            text-align: center;
            margin: auto;
        }

        .login h2 {
            margin-top: 70px;
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
            width: 200px;
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
        <input type="text" class="username" name="username" id="" placeholder="username" />
        <input type="password" class="password" name="password" id="" placeholder="password" />
        <input type="submit" class="submit" value="Đăng nhập">
        <a href="/food?actionUser=register" >Đăng ký</a>
    </div>
</form>

<script src="../js/bootstrap.js.map"></script>
</body>
</html>
