<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 17/02/2023
  Time: 3:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Buy</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%--<style>--%>
<%--    *{--%>
<%--        padding: 0px;--%>
<%--        margin: 0px auto;--%>
<%--    }--%>
<%--    body{--%>
<%--        //background-image: ;--%>
<%--    }--%>

<%--</style>--%>
<form action="/food?actionUser=order" method="post">
    <div class="card w-25 col-md-12">
<%--        <input type="hidden" name="username" value="${loginName}">--%>
<%--        <input type="hidden" name="password" value="${loginPass}">--%>
        <img class="card-img-top" src="${food.imgURL}" alt="">
        <div class="card-body">
            <input type="hidden" name="foodName" value="${food.name}">
            <input type="hidden" name="userName" value="${user.name}">
            <h4 class="card-title">${food.name}</h4>
            <p class="card-text">${food.description} </p>
            <p class="card-text">Hạng mục: ${food.categoryName}</p>
            <input type="hidden" name="" value="${food.price}" id="price">
            <p class="card-text">Giá: ${food.price}đ</p>
            <p>
                Số lượng:&nbsp <input type="number" name="quantity" id="quantity" style="width: 40px;" onclick="showTotalMoney()">
            </p>
            <p >
                Tổng tiền: <span id="result"></span>
            </p>
        </div>
        <input type="submit" value="Mua" class="btn btn-secondary">
    </div>

</form>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script>
    function showTotalMoney() {
        let price = document.getElementById("price").value;
        let quantity = document.getElementById("quantity").value;
        document.getElementById("result").innerHTML =  price * quantity + " đ";
    }
</script>
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
