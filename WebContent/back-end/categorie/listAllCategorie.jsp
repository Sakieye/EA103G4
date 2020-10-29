<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.categorie.model.*"%>

<%
	CategorieService categorieService = new CategorieService();
List<CategorieVO> list = categorieService.getAll();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>員工列表管理</title>

<!-- BOOSTRAP CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendors/styles/style.css">

<!-- 自訂CSS -->
<style type="text/css">
.main-container {
	padding-left: 270px;
	padding-top: 80px;
	padding-right: 30px;
}
</style>
</head>


<body>
	<jsp:include page="/back-end/header/header.jsp" />
	<div class="main-container">
		<main>
			<div class="pd-20 card-box mb-30">
				<div class="clearfix mb-20">
					<div class="pull-left">
						<h1 class="text-blue h1">類別列表</h1>
						<div>
							<a href="<%=request.getContextPath()%>/back-end/categorie/addCategorie.jsp">新增類別 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  									<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
								</svg>
							</a>
						</div>
					</div>
					<jsp:useBean id="categorieService1" scope="page" class="com.categorie.model.CategorieService" />
					<div class="pull-right">
						<form method="post" action="<%=request.getContextPath()%>/back-end/categorie/categorie.do" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<select class="custom-select form-control" name="lc_class_id">
									<c:forEach var="categorieVO" items="${categorieService1.getAll()}">
										<option value="${categorieVO.lc_class_id}">${categorieVO.lc_class_id}${categorieVO.lc_class_name}
									</c:forEach>
								</select>
								<div class="input-group-append">
									<input type="hidden" name="action" value="getOne_For_Display"> <input type="submit" value="送出" class="btn btn-dark btn-sm">
								</div>
							</div>
						</form>
					</div>
				</div>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">類別編號</th>
							<th scope="col">類別名稱</th>
							<th scope="col">修改</th>
							<th scope="col">刪除</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<%@ include file="page1.file"%>
						<c:forEach var="categorieVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<td>${categorieVO.lc_class_id}</td>
								<td>${categorieVO.lc_class_name}</td>
								<td>

									<FORM method="post" action="<%=request.getContextPath()%>/back-end/categorie/categorie.do">
										<button type="submit">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  											<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
										</svg>
										</button>
										<input type="hidden" name="lc_class_id" value="${categorieVO.lc_class_id}"> <input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/categorie/categorie.do">
										<button type="submit">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  											<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
										</svg>
										</button>
										<input type="hidden" name="lc_class_id" value="${categorieVO.lc_class_id}"> <input type="hidden" name="action" value="delete">
									</FORM>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="page2.file"%>
			</div>

		</main>
	</div>
	<jsp:include page="/back-end/sidebar/sidebar.jsp" />
</body>
</html>