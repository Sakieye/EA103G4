<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.signup.model.*"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	SignupService signupService = new SignupService();
List<SignupVO> list = signupService.getAll();
pageContext.setAttribute("list", list);
%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<%
	LectureVO lectureVO = (LectureVO) request.getAttribute("lectureVO");
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
				<div class="pull-left">
						<h1 class="text-blue h1" >講座訂單清單列表</h1>
						<div>
							<a href="<%=request.getContextPath()%>/back-end/lecture/listAllLecture.jsp"><big>講座列表 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-event" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
  									<path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
								</svg></big>
							</a>&nbsp;&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/back-end/categorie/listAllCategorie.jsp">類別列表 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  								<path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
  								<circle cx="3.5" cy="5.5" r=".5"/>
  								<circle cx="3.5" cy="8" r=".5"/>
  								<circle cx="3.5" cy="10.5" r=".5"/>
						</svg></a>
						</div>
					</div>
					<jsp:useBean id="signupService1" scope="page" class="com.signup.model.SignupService" />
					<jsp:useBean id="lectureService1" scope="page" class="com.lecture.model.LectureService" />
					<jsp:useBean id="memService1" scope="page" class="com.mem.model.MemService" />
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

							
						</tr>
					</thead>
					<tbody>
						<%@ include file="page1.file"%>
						
						<c:forEach var="signupVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<td>${signupVO.signup_id}</td>
								<td>${signupVO.mem_id}</td>
								<td>${memService1.getOneMem(signupVO.mem_id).mem_name}</td>
								<td>${signupVO.lc_id}</td>
								<td>${lectureService1.getOneLecture(signupVO.lc_id).lc_name}</td>
								<td>${signupVO.signup_time}</td>
								
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