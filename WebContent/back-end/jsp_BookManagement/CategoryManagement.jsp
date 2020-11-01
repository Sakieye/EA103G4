<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.category.model.*"%>
<%
	int count = 0;
%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<title>新增商品分類</title>
</head>

<body>
	<!--表單內容-->
	<main class="col-md-12" style="margin: 0 auto;">
		<h1 style="display: inline;">新增商品分類</h1>
		<div style="position: relative; left: 78em; display: inline;">
			<a href="${pageContext.request.contextPath}/BookManagementIndex">返回商品管理首頁</a>
		</div>
		<form id="addCategory" role="form" action="${pageContext.request.contextPath}/CategoryManagement" method="post">
			<div class="form-row">
				<div class="col-md-12">
					<label for="categoryName" class="control-label">新分類名稱</label>
					<input type="text" class="form-control" id="categoryName" name="categoryName" value='${param.categoryName}' required>
					<div class="help-block with-errors"></div>
					<button type="submit" class="btn btn-danger btn-block" id="submitBtn" style="position: relative; top: 1em" disabled>確認送出</button>
				</div>
			</div>
		</form>
		<div id="msgDiv" style="color: red;">
		</div>
		<h3 style="position: relative; top: 1em">既有商品分類列表</h3>
		<span style="position: relative; top: 2em; color: red; font-size: 12px">*已有商品參照的類別無法編輯／刪除</span>
		<table class="table" style="position: relative; top: 3em">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">商品類別編號</th>
					<th scope="col">商品類別名稱</th>
					<th scope="col">母類別編號</th>
					<th scope="col">商品個數</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<%
				Map<String, Integer> categoryCountMap = (Map<String, Integer>) request.getAttribute("categoryCountMap");
			%>
			<tbody>
				<c:forEach var="category" items="${categories}">
					<%
						count += 1;
							String categoryID = ((Category) pageContext.getAttribute("category")).getCategoryID();
							boolean showCat = (categoryCountMap.get(categoryID) > 0);
							pageContext.setAttribute("showCat", showCat);
					%>
					<tr>
						<td><%=count%></td>
						<td><%=categoryID%></td>
						<td>
							<a href="${pageContext.request.contextPath}/Search?categoryID=<%=categoryID%>">${category.categoryName}</a>
						</td>
						<td>${category.parentCategoryID}</td>
						<td><%=categoryCountMap.get(categoryID)%></td>
						<td>
							<c:choose>
								<c:when test="${showCat}">
									編輯 ／ 刪除
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/UpdateCategory?categoryID=<%=categoryID%>">編輯</a>
								            ／
									<a href="${pageContext.request.contextPath}/DeleteCategory?categoryID=<%=categoryID%>">刪除</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	<%@include file="/back-end/jsp_Common/jquery-popper-bootstrap-js.jsp"%>
	<%@include file="/back-end/jsp_Common/check-category-js.jsp"%>
</body>

</html>