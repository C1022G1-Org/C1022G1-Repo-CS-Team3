<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 17/02/2023
  Time: 7:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Update</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<form action="/adminFood?actionUser=edit" method="post">
    <input type="hidden" name="id" value="${food.id}">
    <label for="name">Input Name</label>
    <input type="text" class="form-control" name="name" id="name" value="${food.name}">

    <label for="imgURL">Input imgURL</label>
    <input type="text" class="form-control" name="imgURL" id="imgURL" value="${food.imgURL}">

    <label for="description">Input Description</label>
    <input type="text" class="form-control" name="description" id="description" value="${food.description}">

    <label for="price">Input Price</label>
    <input type="text" class="form-control" name="price" id="price" value="${food.price}">

    <label for="categoryName">Input Category Name</label>
    <input type="text" class="form-control" name="categoryName" id="categoryName" value="${food.categoryName}">

    <input type="submit" value="Cập nhật" class="btn btn-secondary mt-3">
</form>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
