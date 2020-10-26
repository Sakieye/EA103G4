<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-back.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>商品管理首頁</title>
<style type="text/css">
.jumbotron {
	padding: 3rem 2rem !important;
}
</style>
</head>

<body>
	<%@include file="/back-end/header/headerYH.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<h1>商品管理首頁</h1>
			<p></p>
			<div class="jumbotron jumbotron-fluid">
                <div class="container" style="padding: 0; margin: 0;">
                    <a href='${pageContext.request.contextPath}/BookManagement'>
                        <h3 class="display-6">商品上下架管理</h3>
                    </a>
                    <p class="lead">查看、新增、修改商品基本資料</p>
                </div>
            </div>
            <div class="jumbotron jumbotron-fluid">
                <div class="container" style="padding: 0; margin: 0;">
                    <a href='${pageContext.request.contextPath}/CategoryManagement'>
                        <h3 class="display-6">商品分類管理</h3>
                    </a>
                    <p class="lead">查看、新增、修改、刪除商品分類</p>
                </div>
            </div>
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>