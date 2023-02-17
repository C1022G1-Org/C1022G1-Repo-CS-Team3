<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 16/02/2023
  Time: 6:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách món ăn | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <!-- User Menu-->
        <li><a class="app-nav__item" href="#"><i class='bx bx-log-out bx-rotate-180'></i> </a>
        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="img/bandmember.jpg" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b>Admin</b></p>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item " href="#"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item active" href="/adminFood"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý món ăn</span></a>

        </li>
    </ul>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách món ăn</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="#" id="them" title="Thêm" data-toggle="modal"
                               data-target="#addfood"><i class="fas fa-plus"></i>
                                Tạo mới món ăn</a>
                        </div>
                        <form class="form-group" action="/adminFood">
                            <input type="text"
                                   class="form-control" name="search" value="${search}">
                            <input type="submit" value="Search" class="btn btn-secondary">
                        </form>
                    </div>
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên món ăn</th>
                            <th>Danh mục</th>
                            <th>Giá tiền</th>
                            <th>Ảnh</th>
                            <th>Mô tả</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="food" items="${foodList}" varStatus="stt">
                            <tr>
                                <td>${stt.count}</td>
                                <td>${food.name}</td>
                                <td><img src="${food.imgURL}" alt="" width="100px;"></td>
                                <td>${food.description}</td>
                                <td>${food.price}</td>
                                <td>${food.category_name}</td>
                                <td>
                                    <button type="button" onclick="deleteInfo('${food.id}','${food.name}')" class="btn btn-danger"
                                            data-toggle="modal" data-target="#exampleModal">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                    <a href="/adminFood?actionUser=edit&id=${food.id}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<%-- modal xóa --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete User Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/adminFood" method="get">
                <div class="modal-body">
                    <input type="hidden" name="actionUser" value="delete">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    Confirm delete this item?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- modal thêm mới -->
<div class="modal fade" id="addfood" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header col-md-9">
                <h3 style="text-align:center; color: #ea0000;">THÊM MỚI MÓN ĂN</h3>
            </div>
            <div class="modal-body">
                <form role="form" class="form-horizontal" action="/adminFood?actionUser=add" method="post">
                    <div class="form-group">
                        <div id="thongbao" class="text-danger" style="text-align: center;"></div>
                    </div>
                    <div class="form-group">
                    </div>
                    <div class="form-group">
                        <label for="txtName" class="control-label col-xs-3">Tên món ăn</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="txtName" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtDm" class="control-label">Danh mục</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" name ="category">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtGia" class="control-label col-xs-3">Ảnh sản phẩm</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="txtGia" name="imgURL">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtGia" class="control-label col-xs-3">Giá bán</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="txtGia" name="price">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtMota" class="control-label col-xs-3">Mô tả</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="txtGia" name="description">
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="txtLoai" class="control-label col-xs-3">Loại đồ ăn</label>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <input type="text" class="form-control" id="txtGia" name="category_name">--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="modal-footer col-md-5 text-center">
                        <input type="submit" id="btnSave" class="btn btn-success btn-block" value="Lưu">
                        <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/main.js"></script>
    <script src="../../js/plugins/pace.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script type="text/javascript" src="../../js/addfood.js"></script>
    <script>
        function deleteInfo(id) {
            document.getElementById("deleteId").value = id;
        }
//        function readURL(input, thumbimage) {
//            if (input.files && input.files[0]) {
//                var reader = new FileReader();
//                reader.onload = function (e) {
//                    $("#thumbimage").attr('src', e.target.result);
//                }
//                reader.readAsDataURL(input.files[0]);
//            } else { // Sử dụng cho IE
//                $("#thumbimage").attr('src', input.value);
//
//            }
//            $("#thumbimage").show();
//            $('.filename').text($("#uploadfile").val());
//            $('.Choicefile').css('background', '#14142B');
//            $('.Choicefile').css('cursor', 'default');
//            $(".removeimg").show();
//            $(".Choicefile").unbind('click');
//        }
//
//        $(document).ready(function () {
//            $(".Choicefile").bind('click', function () {
//                $("#uploadfile").click();
//            });
//            $(".removeimg").click(function () {
//                $("#thumbimage").attr('src', '').hide();
//                $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
//                $(".removeimg").hide();
//                $(".Choicefile").bind('click', function () {
//                    $("#uploadfile").click();
//                });
//                $('.Choicefile').css('background', '#14142B');
//                $('.Choicefile').css('cursor', 'pointer');
//                $(".filename").text("");
//            });
//        })
    </script>
</body>

</html>