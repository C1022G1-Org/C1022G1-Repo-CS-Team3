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
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="../../themify-icons/themify-icons.css">
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
        <li><a href="/adminFood?actionUser=search" class="app-menu__item active" type="button"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><button class="app-menu__item active" type="button" ><i class='ti-list' style="    display: inline-block;
    width: 38px;"></i><span
                class="app-menu__label">Quản lý đơn hàng</span></button></li>
        <li><a href="/adminFood" class="app-menu__item active" type="button"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý món ăn</span></a>

        </li>
    </ul>
</aside>
<%-- user --%>
<main class="app-content" id="user">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="/adminFood?actionUser=searchOrder"><b>Danh sách Order</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <form class="form-group w-25" action="/adminFood" method="get">
                            <input type="hidden" name="actionUser" value="searchOrder">
                            <input type="text"
                                   class="form-control" name="searchOrder" value="${searchOrder}">
                            <input type="submit" value="Search" class="btn btn-secondary" id="" onclick="showSearchUser()">
                        </form>
                    </div>
                    <table id="tableStudent" class="table table-hover table-striped table-bordered" style="width: 100%">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên thức ăn</th>
                            <th>Tên người order</th>
                            <th>Số lượng</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${orderList}" varStatus="stt">
                            <tr>
                                <td>${stt.count}</td>
                                <td>${order.user}</td>
                                <td>${order.food}</td>
                                <td>${order.quantity}</td>
                                <td>
                                    <button type="button" onclick="deleteUser('${order.id}')" class="btn btn-danger"
                                            data-toggle="modal" data-target="#exampleModal">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                    <a href="/adminFood?actionUser=edit&id=${order.id}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
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
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
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

    function deleteUser(id) {
        document.getElementById("deleteUserId").value = id;
    }
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'ltrip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>

</html>
