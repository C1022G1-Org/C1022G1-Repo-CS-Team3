<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 15/02/2023
  Time: 9:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Home</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css_tu/bootstrap.css">
    <link rel="stylesheet" href="../../themify-icons/themify-icons.css">
    <%--    <link rel="stylesheet" href="index_css.css">--%>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #content {
            background: rgba(0, 0, 0, 0.04);
            padding: 50px 70px;
        }

        #content .content-header {
            margin: auto;
        }

        .footer a {
            text-decoration: none;
            color: #fff;
        }

        .footer-icon i {
            display: inline-block;
            width: 30px;
            font-size: 24px;
        }

        .footer-icon i:hover {
            cursor: pointer;
            opacity: 0.7;
        }

        .action {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
        }

        .logout,
        .logout-responsive {
            border-radius: 8px;
            transition: all 0.2s ease;
            padding: 8px;
            color: #000;
            cursor: pointer;
            text-align: center;
        }

        .logout {
            display: block
        }

        .logout:hover {
            opacity: 0.8;
        }

        .logout-responsive {
            max-width: 150px;
            display: none;
        }

        @media (max-width: 992px) {
            .logout {
                display: none;
            }

            .logout-responsive {
                display: block;
            }

            #content {
                padding: 24px;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: lightblue !important;">
    <div class="container-fluid">
        <form action="/food?actionUser=login" method="post">
            <input type="hidden" name="username" value="${usName}">
            <input type="hidden" name="password" value="${pW}">
            <input type="submit" class="navbar-brand border-0 bg-transparent" value="TDQ">
        </form>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Trang Chủ</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Menu
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li>
                            <form class="dropdown-item" action="/food?actionUser=login" method="post">
                                <input type="hidden" name="username" value="${usName}">
                                <input type="hidden" name="password" value="${pW}">
                                <input type="hidden" name="listBeverage" id="listBeverage">
                                <input type="submit" value="Nước uống" class="border-0 bg-transparent" onclick="addBeverageValue()">
                            </form>
                        </li>
                        <li>
                            <form class="dropdown-item" action="/food?actionUser=login" method="post">
                                <input type="hidden" name="username" value="${usName}">
                                <input type="hidden" name="password" value="${pW}">
                                <input type="hidden" name="listFood" id="listFood" >
                                <input type="submit" value="Đồ ăn" class="border-0 bg-transparent" onclick="addFoodValue()">
                            </form>
                        </li>
                        <li>
                            <form class="dropdown-item" action="/food?actionUser=login" method="post">
                                <input type="hidden" name="username" value="${usName}">
                                <input type="hidden" name="password" value="${pW}">
                                <input type="hidden" name="listFastFood" id="listFastFood">
                                <input type="submit" value="Đồ ăn nhanh" class="border-0 bg-transparent" onclick="addFastFoodValue()">
                            </form>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link actio" href="#">Giới Thiệu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link action" href="#">Tin Tức</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link action" href="#">Liên Hệ</a>
                </li>
            </ul>
            <div class="action nav-item">
                <form method="post" class="d-flex" role="search" action="/food?actionUser=login">
                    <input type="hidden" name="username" value="${usName}">
                    <input type="hidden" name="password" value="${pW}">
                    <input
                            class="form-control me-2"
                            type="search"
                            placeholder="Search"
                            aria-label="Search"
                            name="search"
                            value="${search}"
                            onclick="removeValue()"
                    />
                    <button class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </form>
                <div class="navbar-nav">
                    <c:if test="${sessionScope.us == null}">
                        <div class="hide__on__mobile logout"><a href="/food?actionUser=login"
                                                                class="text-decoration-none text-black-50">
                            Login</a> <i class="ti-shift-left"></i></div>
                    </c:if>
                    <c:if test="${sessionScope.us != null}">
                        <span class="hide__on__mobile logout bg-warning"> <i class="ti-user"></i> ${sessionScope.us}</span>
                        <div class="hide__on__mobile logout">
                            <a href="/login" class="text-decoration-none text-warning">
                            Logout</a> <i class="ti-shift-right"></i></div>
                    </c:if>
                </div>
            </div>
            <div class="navbar-nav mt-4">
                <c:if test="${sessionScope.us == null} ">
                    <div class="logout-responsive"><a href="/food?actionUser=login"
                                                      class="text-decoration-none text-black-50">
                        Login</a> <i class="ti-shift-left"></i></div>
                </c:if>
                <c:if test="${sessionScope.us != null}">
                    <span class="logout-responsive bg-warning"><i class="ti-user"></i> ${sessionScope.us}</span>
                    <div class="logout-responsive"><a href="/food"
                                                      class="text-decoration-none text-warning">
                        Logout</a> <i class="ti-shift-right"></i></div>
                </c:if>
            </div>
        </div>
    </div>
</nav>

<div id="content" class="container-fluid p-5">
    <div class="content-header mb-5 text-center">
        <h1>Menu</h1>
    </div>
    <div class="row g-4">
        <c:forEach var="food" items="${foodList}" varStatus="stt">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card" style="width: 100%">
                    <img height="320px" src="${food.imgURL}" class="card-img-top" alt="..."/>
                    <div class="card-body">
                        <h5 class="card-title">${food.name}</h5>
                        <p class="card-text">
                                ${food.description}
                        </p>
                        <p>
                            Giá: ${food.price} đ
                        </p>
<%--                        <a href="/food?actionUser=buy&id=${food.id}&userId=${sessionScope.userId}"--%>
<%--                           class="btn btn-primary">Chọn</a>--%>
                        <form action="/food" method="get">
                            <input type="hidden" name="actionUser" value="buy">
                            <input type="hidden" name="username" value="${usName}">
                            <input type="hidden" name="password" value="${pW}">
                            <input type="hidden" name="id" value="${food.id}">
                            <input type="hidden" name="userId" value="${sessionScope.userId}">
                            <input type="submit" value="Chọn" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:forEach var="food1" items="${foodList1}" varStatus="stt">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card" style="width: 100%">
                    <img height="320px" src="${food1.imgURL}" class="card-img-top" alt="..."/>
                    <div class="card-body">
                        <h5 class="card-title">${food1.name}</h5>
                        <p class="card-text">
                                ${food1.description}
                        </p>
                        <p>
                            Giá: ${food1.price} đ
                        </p>
<%--                        <a href="/food?actionUser=buy&id=${food1.id}&userId=${sessionScope.userId}"--%>
<%--                           class="btn btn-primary">Chọn</a>--%>
                        <form action="/food" method="get">
                            <input type="hidden" name="actionUser" value="buy">
                            <input type="hidden" name="username" value="${usName}">
                            <input type="hidden" name="password" value="${pW}">
                            <input type="hidden" name="id" value="${food.id}">
                            <input type="hidden" name="userId" value="${sessionScope.userId}">
                            <input type="submit" value="Chọn" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:forEach var="food2" items="${foodList2}" varStatus="stt">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card" style="width: 100%">
                    <img height="320px" src="${food2.imgURL}" class="card-img-top" alt="..."/>
                    <div class="card-body">
                        <h5 class="card-title">${food2.name}</h5>
                        <p class="card-text">
                                ${food2.description}
                        </p>
                        <p>
                            Giá: ${food2.price} đ
                        </p>
<%--                        <a href="/food?actionUser=buy&id=${food2.id}&userId=${sessionScope.userId}"--%>
<%--                           class="btn btn-primary">Chọn</a>--%>
                        <form action="/food" method="get">
                            <input type="hidden" name="actionUser" value="buy">
                            <input type="hidden" name="username" value="${usName}">
                            <input type="hidden" name="password" value="${pW}">
                            <input type="hidden" name="id" value="${food.id}">
                            <input type="hidden" name="userId" value="${sessionScope.userId}">
                            <input type="submit" value="Chọn" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:forEach var="food3" items="${foodList3}" varStatus="stt">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card" style="width: 100%">
                    <img height="320px" src="${food3.imgURL}" class="card-img-top" alt="..."/>
                    <div class="card-body">
                        <h5 class="card-title">${food3.name}</h5>
                        <p class="card-text">
                                ${food3.description}
                        </p>
                        <p>
                            Giá: ${food3.price} đ
                        </p>
<%--                        <a href="/food?actionUser=buy&id=${food3.id}&userId=${sessionScope.userId}"--%>
<%--                           class="btn btn-primary">Chọn</a>--%>
                        <form action="/food" method="get">
                            <input type="hidden" name="actionUser" value="buy">
                            <input type="hidden" name="username" value="${usName}">
                            <input type="hidden" name="password" value="${pW}">
                            <input type="hidden" name="id" value="${food.id}">
                            <input type="hidden" name="userId" value="${sessionScope.userId}">
                            <input type="submit" value="Chọn" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- footer -->
<section class="footer bg-dark text-light">
    <div class="container">
        <div class="row" data-aos="fade-right">
            <div class="col-lg-3 py-4 py-md-5">
                <div class="d-flex align-items-center">
                    <h4 class="">Group 3</h4>
                </div>
                <p class="py-3 para-light">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam
                    atque, deserunt doloremque doloribus et facere, illo ipsam iste
                    molestiae, necessitatibus nobis nulla officia perspiciatis qui
                    ratione similique suscipit vel voluptatem!
                </p>
            </div>

            <div class="col-lg-3 py-4 py-md-5">
                <div>
                    <h4 class="py-2">Contact</h4>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-location-pin"></i>
                        <a href="#about">
                            <p class="ms-3 mb-0">123 Street, New York, USA</p>
                        </a>
                    </div>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-mobile"></i>
                        <a href="#">
                            <p class="ms-3 mb-0">+01 2000 800 9999</p>
                        </a>
                    </div>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-email"></i>
                        <a href="#">
                            <p class="ms-3 mb-0">info@domain.com</p>
                        </a>
                    </div>
                    <div class="footer-icon d-flex align-items-center py-2">
                        <i class="ti-instagram"></i>
                        <i class="ti-facebook"></i>
                        <i class="ti-twitter-alt"></i>
                        <i class="ti-linkedin"></i>
                        <i class="ti-youtube"></i>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 py-4 py-md-5">
                <div>
                    <h4 class="py-2">Quick Links</h4>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-angle-right"></i>
                        <a href="#">
                            <p class="ms-3 mb-0">For Artists</p>
                        </a>
                    </div>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-angle-right"></i>
                        <a href="#">
                            <p class="ms-3 mb-0">Developers</p>
                        </a>
                    </div>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-angle-right"></i>
                        <a href="#">
                            <p class="ms-3 mb-0">Advertisement</p>
                        </a>
                    </div>
                    <div class="d-flex align-items-center py-2">
                        <i class="ti-angle-right"></i>
                        <a href="#">
                            <p class="ms-3 mb-0">Investors</p>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 py-4 py-md-5">
                <div class="d-flex align-items-center">
                    <h4>Subscribe</h4>
                </div>
                <p class="py-3 para-light">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Reprehenderit, voluptatum?
                </p>
                <div class="d-flex align-items-center">
                    <div class="input-group mb-3">
                        <input
                                type="text"
                                class="form-control p-2"
                                placeholder="Enter Email"
                                aria-label="Recipient's email"
                        />
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script>
    function addFoodValue() {
        document.getElementById("listFood").value = "listFood"
        document.getElementById("listFastFood").value = ""
        document.getElementById("listBeverage").value = ""
    }

    function addFastFoodValue() {
        document.getElementById("listFood").value = ""
        document.getElementById("listFastFood").value = "listFastFood"
        document.getElementById("listBeverage").value = ""
    }

    function addBeverageValue() {
        document.getElementById("listFood").value = ""
        document.getElementById("listFastFood").value = ""
        document.getElementById("listBeverage").value = "listBeverage"
    }

    function removeValue() {
        document.getElementById("listFood").value = ""
        document.getElementById("listFastFood").value = ""
        document.getElementById("listBeverage").value = ""
    }
</script>
<script src="../../js_tu/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
