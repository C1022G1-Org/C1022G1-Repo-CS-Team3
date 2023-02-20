<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20/02/2023
  Time: 12:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Buy food</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"/>
    <!-- MDB -->
    <link rel="stylesheet" href="../../css/bootstrap-shopping-carts.min.css"/>
</head>
<style>
    @media (min-width: 1025px) {
        .h-custom {
            height: 100vh !important;
        }
    }

    .card-registration .select-input.form-control[readonly]:not([disabled]) {
        font-size: 1rem;
        line-height: 2.15;
        padding-left: .75em;
        padding-right: .75em;
    }

    .card-registration .select-arrow {
        top: 13px;
    }

    .bg-grey {
        background-color: #eae8e8;
    }

    @media (min-width: 992px) {
        .card-registration-2 .bg-grey {
            border-top-right-radius: 16px;
            border-bottom-right-radius: 16px;
        }
    }

    @media (max-width: 991px) {
        .card-registration-2 .bg-grey {
            border-bottom-left-radius: 16px;
            border-bottom-right-radius: 16px;
        }
    }
    .food-name {
        text-transform: capitalize;
    }
</style>
<body>
<!-- Start your project here-->

<form action="/food?actionUser=order" method="post">
    <section class="h-100 h-custom" style="background-color: #d2c9ff;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-9">
                                    <div class="p-5">
                                        <div class="d-flex justify-content-between align-items-center mb-5">
                                            <h1 class="fw-bold mb-0 text-black">Món ăn</h1>
                                        </div>
                                        <hr class="my-4">
                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <img class="card-img-top" src="${food.imgURL}" alt="">
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                <div class="card-body">
                                                    <input type="hidden" name="foodName" value="${food.name}">
                                                    <input type="hidden" name="userName" value="${user.name}">
                                                    <h4 class="card-title food-name">${food.name}</h4>
                                                    <p class="card-text">${food.description} </p>
                                                    <p class="card-text">Hạng mục: ${food.categoryName}</p>
                                                    <input type="hidden" name="" value="${food.price}" id="price">

                                                </div>
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">

                                                <input min="0" class="form-control form-control-sm"
                                                       type="number" name="quantity" id="quantity" style="width: 60px;"
                                                       onclick="showTotalMoney()">

                                            </div>
                                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                <p class="card-text">Giá: ${food.price}đ</p>
                                            </div>
                                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                <span id="clear-quantity" class="text-muted" onclick="clearQuantityValue()">
                                                    <i class="fas fa-times"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 bg-grey">
                                    <div class="p-5">
                                        <h3 class="fw-bold mb-5 mt-2 pt-1">Thông tin</h3>
                                        <hr class="my-4">
                                        <div class="d-flex justify-content-between mb-5">
                                            <h4 class="card-title food-name">${food.name}</h4>
                                            <h4 id="total"></h4>
                                        </div>

                                        <hr class="my-4">
                                        <div class="d-flex justify-content-between mb-5">
                                            <h5 class="text-uppercase">Tổng tiền</h5>
                                            <h5 id="result"></h5>
                                        </div>

                                        <button type="submit" class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark">Chọn
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
<!-- End your project here-->

<!-- MDB -->
<script>
    function clearQuantityValue() {
        document.getElementById("quantity").value = 0;
        document.getElementById("result").innerHTML = "";
        document.getElementById("total").innerHTML = "";
    }
    function showTotalMoney() {
        let price = document.getElementById("price").value;
        let quantity = document.getElementById("quantity").value;
        document.getElementById("result").innerHTML = price * quantity + " đ";
        document.getElementById("total").innerHTML = quantity;
    }
</script>
<script type="text/javascript" src="../../js/mdb.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript"></script>
</body>
</html>
