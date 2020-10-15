<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.category.model.*"%>
<% int count = 0; %>
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
        <h1 style="display: inline;">新增商品分類</h1>
        <div style="position: relative; left:78em; display: inline;"><a href="${pageContext.request.contextPath}/BookManagementIndex">返回商品管理首頁</a></div>
        <form id="addCategory" role="form" action="${pageContext.request.contextPath}/CategoryManagement" method="post">
            <div class="form-row">
                <div class="col-md-12">
                    <label for="categoryName" class="control-label">新分類名稱</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" value='${param.categoryName}' required>
                    <div class="help-block with-errors"></div>
                    <button type="submit" class="btn btn-danger btn-block" style="position: relative;top: 1em">確認送出</button>
                </div>
            </div>
        </form>
        <h3 style="position: relative;top: 1em">既有商品分類列表</h3>
        <table class="table" style="position: relative;top: 3em">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">商品類別編號</th>
                    <th scope="col">商品類別名稱</th>
                    <th scope="col">母類別編號</th>
                    <th scope="col">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categories}">
                <% count += 1; %>
                    <tr>
	                    <td><%=count%></td>
	                    <td>${category.categoryID}</td>
	                    <td>${category.categoryName}</td>
	                    <td>${category.parentCategoryID}</td>
	                    <td><a href="${pageContext.request.contextPath}/UpdateCategory?categoryID=${category.categoryID}">編輯</a>／<a href="${pageContext.request.contextPath}/DeleteCategory?categoryID=${category.categoryID}">刪除</a></td>
	                </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>