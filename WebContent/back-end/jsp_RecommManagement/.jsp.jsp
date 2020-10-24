<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.category.model.*"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 自訂css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>新增商品分類</title>
</head>

<body>
    <!--表單內容-->
    <main class="col-md-12" style="margin:0 auto;">
        <h1 style="display: inline;">編輯商品分類</h1>
        <div style="position: relative; left:78em; display: inline;"><a href="${pageContext.request.contextPath}/CategoryManagement">返回類別管理首頁</a></div>
        <form id="addCategory" role="form" action="${pageContext.request.contextPath}/UpdateCategory?categoryID=${category.categoryID}" method="post">
            <div class="form-row">
                <div class="col-md-12">
                    <label for="categoryName" class="control-label">修改分類名稱</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" value='${category.categoryName}' required>
                    <div class="help-block with-errors"></div>
                    <button type="submit" class="btn btn-danger btn-block" style="position: relative;top: 1em">確認送出</button>
                </div>
            </div>
        </form>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>