<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.categorie.model.*"%>

<%
	LectureService lectureService = new LectureService();
List<LectureVO> list = lectureService.getAll();
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
<title>講座列表管理</title>

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
						<h1 class="text-blue h1" >講座清單列表</h1>
						<div><a href="<%=request.getContextPath()%>/back-end/categorie/listAllCategorie.jsp"><big>類別類表 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  								<path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
  								<circle cx="3.5" cy="5.5" r=".5"/>
  								<circle cx="3.5" cy="8" r=".5"/>
  								<circle cx="3.5" cy="10.5" r=".5"/>
						</svg></big></a>&nbsp;&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/back-end/lecture/addLecture.jsp">新增講座 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-event" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
  									<path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
								</svg>
							</a>&nbsp;&nbsp;&nbsp;
							<a href="">講座訂單列表</a>
						</div>
					</div>
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
							<th scope="col">講座編號</th>
							<th scope="col">講座類別編號</th>
							<th scope="col">管理員編號</th>
							<th scope="col">名稱</th>
							<th scope="col">地點</th>
							<th scope="col">時間</th>
							<th scope="col">時數</th>
							<th scope="col">開放報名日期</th>
							<th scope="col">報名截止日期</th>
							<th scope="col">人數下限</th>
							<th scope="col">人數上限</th>
							<th scope="col">簡介</th>
							<th scope="col">介紹照片</th>							
							<th scope="col">狀態</th>						
							<th scope="col">修改</th>
							<th scope="col">刪除</th>
							<th scope="col"></th>
						</tr>
					</thead>
					
						<tbody>
						<%@ include file="page1.file"%>
							<c:forEach var="lectureVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<tr>
									<td>${lectureVO.lc_id}</td>
									<td>${lectureVO.lc_class_id}</td>
									<td>${lectureVO.admin_id}</td>
									<td>${lectureVO.lc_name}</td>
									<td>${lectureVO.lc_place}</td>
									<td>${lectureVO.lc_time}</td>
									<td>${lectureVO.lc_hr}</td>
									<td>${lectureVO.lc_start_time}</td>
									<td>${lectureVO.lc_deadline}</td>
									<td>${lectureVO.lc_peo_lim}</td>
									<td>${lectureVO.lc_peo_up}</td>
									<td>${lectureVO.lc_info}</td>
									<td>
										<div id="img">
											<img width="80px" heigh="80px" src="${pageContext.request.contextPath}/ShowLecturePic?lc_id=${lectureVO.lc_id}" />
										</div>
									</td>
									<td>${lectureVO.lc_state}</td>

									<td>

										<form method="post" action="<%=request.getContextPath()%>/back-end/lecture/lecture.do">
											<button type="submit">
												<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  											<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
										</svg>
											</button>
											<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"> <input type="hidden" name="action" value="getOne_For_Update">

										</form>
									</td>
									<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/lecture/lecture.do">
											<button type="submit">
												<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  											<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
										</svg>
											</button>
											<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"> <input type="hidden" name="action" value="delete">
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