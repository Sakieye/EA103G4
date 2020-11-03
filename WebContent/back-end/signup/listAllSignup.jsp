<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.signup.model.*"%>
<%@ page import="com.lecture.model.*"%>

<%
	SignupService signupService = new SignupService();
List<SignupVO> list = signupService.getAll();
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
<title>訂單列表管理</title>

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
					<jsp:useBean id="signupService1" scope="page" class="com.signup.model.SignupService" />
					<jsp:useBean id="lectureService1" scope="page" class="com.lecture.model.LectureService" />
					<div class="pull-right">
						<form method="post" action="<%=request.getContextPath()%>/back-end/lecture/lecture.do" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<select class="custom-select form-control" name="lc_id">
									<c:forEach var="lectureVO" items="${lectureService1.getAll()}">
										<option value="${lectureVO.lc_id}">${lectureVO.lc_id}${lectureVO.lc_name}
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
							<th scope="col">訂單編號</th>
							<th scope="col">會員編號</th>
							<th scope="col">會員名稱</th>
							<th scope="col">講座編號</th>
							<th scope="col">講座名稱</th>
							<th scope="col">報名時間</th>
						<!-- 	<th scope="col">修改</th> -->
							<th scope="col">刪除</th>
							
						</tr>
					</thead>
					<tbody>
						<%@ include file="page1.file"%>
						<c:forEach var="signupVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<td>${signupVO.signup_id}</td>
								<td>${signupVO.mem_id}</td>
								<td>member name</td>
								<td>${signupVO.lc_id}</td>
								<td >lecture name</td>
								<td>${signupVO.signup_time}</td>
								
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/signup/signup.do">
										<button type="submit">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  											<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
										</svg>
										</button>
										<input type="hidden" name="signup_id" value="${signupVO.signup_id}"> <input type="hidden" name="action" value="delete">
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