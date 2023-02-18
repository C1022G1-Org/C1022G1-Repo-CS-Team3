<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13/02/2023
  Time: 11:39 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style type="text/css">
        body {
            font-family: Times New Roman, serif;
            font-size: 16px;
            background: url('../img/bg.jpg') top center / cover no-repeat;
        }

        div {
            border-bottom: 2px;
            margin: auto;
            padding-bottom: 10px;
            padding-top: 5px;
            width: 720px;
        }

        li {
            list-style-type: none;
            float: right;
        }

        .title {
            float: left;
            width: 200px;
            text-align: left;
            padding-right: 10px;
            color: black;
            font-size: 18px;
        }

        .radio-buttons label {
            float: none;
        }

        .submit {
            text-align: center;

        }

        span {
            color: red;
            font-size: 14px;
        }

        a {
            color: black !important;
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="col-md-12">
    <nav class="navbar-default">
        <div class="navbar-header col-sm-9 col-lg-9 col-md-9 col-xl-9">
            <li><a href="/food">Trang chủ</a></li>
        </div>
    </nav>
</div>

<h2 class="text-center mt-md-5" style="color:red">ĐĂNG KÝ TÀI KHOẢN</h2>
<form id="form1" name="form1" method="post" action="/food?actionUser=register">
    <div>
        <label for="loginName" class="title">Tên đăng nhập:</label>
        <input required id="loginName" onBlur="return KiemTraTenDN();" type="text" name="loginName" size="30" /><span id="tendn">
                *</span>
    </div>
    <div>
        <label for="loginPassword" class="title">Mật khẩu:</label>
        <input required id="loginPassword" onBlur="return KiemTraPassWord();" type="password" name="loginPassword" size="30" /><span id="mk">
                *</span>
    </div>
    <div>
        <label for="name" class="title">Họ và tên:</label>
        <input required type="text" id="name" name="name" size="30" /><span id="hoten"> * bắt buộc</span>
    </div>
    <div>
        <label for="dateOfBirth" class="title">Ngày sinh:</label>
        <input required id="dateOfBirth" onBlur="return KiemTraNgaySinh();" type="date" name="dateOfBirth" size="30" /><span
            id="ngaysinh"></span>
    </div>
    <div>
        <input onBlur="return KiemTraNgaySinh();" type="hidden" name="role" size="30" value="user"/><span
            id="role"></span>
    </div>
    <div class="radio-buttons">
        <span class="title">Giới tính:</span>
        <input type="radio" name="gender" id="male" value="M" checked />
        <label for="male">Nam</label>
        <input type="radio" name="gender" id="female" value="F" checked />
        <label for="female">Nữ</label><br />
    </div>
    <div>
        <label for="address" class="title">Địa chỉ:</label>
        <input required type="text" name="address" id="address" size="30" />
        <span id="diachi"></span>
    </div>
    <div>
        <label for="email" class="title">Email:</label>
        <input required type="email" name="email" id="email" size="30" />
        <span id="gmail">* </span>
    </div>
    <div class="submit">
        <button type="submit" id="submit">Đăng ký</button>
        <button><a href="/view/login.jsp">Hủy</a></button>
    </div>
</form>


<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/file.js"></script>
</body>

</html>
