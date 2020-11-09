<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.categorie.model.*"%>
<%@ page import="com.signup.model.*"%>

<%
	LectureService lectureService = new LectureService();
	List<LectureVO> list = lectureService.getByState();
	pageContext.setAttribute("list", list);
%>

<%
	String mem_id = (String) session.getAttribute("mem_id");
%>
<!DOCTYPE HTML>
<html>

<head>
<title>BookShop</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/lecture_index.css" />
<title>講座首頁</title>
</head>

<body>
	<!-- Header -->
	<jsp:include page="/front-end/header/header.jsp" />
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p style="font-size: 18px;">與讀者分享書中的樂趣，與作者探索書中的秘密</p>
				<h2>與書共享</h2>
			</header>
		</div>
	</section>
	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>主辦人與使用者一起共襄盛舉的園地</p>
						<h2>講座 Lecture</h2>
					</header>
					<div class="container">
						<div class="row">
							<div class="col-12 col-md-12" style="width: 1500px;">
								<jsp:useBean id="lectureService1" scope="page"
									class="com.lecture.model.LectureService" />
								<jsp:useBean id="signupService1" scope="page"
									class="com.signup.model.SignupService" />
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">講座編號</th>
											<th scope="col">照片</th>
											<th scope="col">名稱</th>
											<th scope="col">簡介</th>
											<th scope="col">講座時間</th>
											<th scope="col">時數</th>
											<th scope="col">地點</th>
											<th scope="col">報名截止日期</th>
											<th scope="col">人數上限</th>
											<th scope="col">報名</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="lectureVO" items="${list}">
											<tr>
												<td>${lectureVO.lc_id}</td>
												<td style="display: inline-block; width: 81px;">
													<div id="lecturePic">
														<img width="80px" heigh="80px"
															src="${pageContext.request.contextPath}/ShowLecturePic?lc_id=${lectureVO.lc_id}"
															style="border-radius: 0%; width: 80px; height: 80px;" />
													</div>
												</td>
												<td>${lectureVO.lc_name}</td>
												<td>${lectureVO.lc_info}</td>
												<td>${lectureVO.lc_time}</td>
												<td>${lectureVO.lc_hr}</td>
												<td>${lectureVO.lc_place}</td>
												<td>${lectureVO.lc_deadline}</td>
												<td>${lectureVO.lc_peo_up}</td>	
												<td>
													<c:if test="${signupService1.checkSignUp(sessionScope.memVO.mem_id, lectureVO.lc_id)}">
														已報名
													</c:if>
													<c:if test="${signupService1.checkSignUp(sessionScope.memVO.mem_id, lectureVO.lc_id) == false}">
<%-- 														<form method="post" BorderStyle="0" ACTION="<%=request.getContextPath()%>/front-end/lecture/lecture.do"> --%>
<!-- 															<button type="button" style="background-color: #dee2e6;" data-toggle="modal" data-target="#signUp"> -->
<!-- 																<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> -->
<!--   																	<path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" /> -->
<!--   																	<path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" /> -->
<!-- 																</svg> -->
<!-- 															</button> -->
															<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signUp">
																報名
															</button>

															<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"> 
															<input type="hidden" name="action" value="getOne_ForMem_Display" />
<!-- 														</form> -->
													</c:if>
													<div class="modal fade" id="signUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalCenterTitle">確認是否報名</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body" style="color:black;">
													        <table>
																<tr>
																	<th style="color:black;">講座名稱 : </th><td>${lectureVO.lc_name}</td>
																	</tr>
																	<tr>
																	<th style="color:black;">會員名稱 : </th><td>${memVO.mem_name}</td>
																	</tr>
																	<tr>
																	<th style="color:black;">講座地點 : </th><td>${lectureVO.lc_place}</td>
																	</tr>
																	<tr>
																	<th style="color:black;">講座時間 : </th><td>${lectureVO.lc_time}</td>
																	</tr>
																	<tr>
																	<th style="color:black;">講座時數 : </th><td>${lectureVO.lc_hr} hr</td>
																	</tr>
																	<tr>
																	
																</tr>
															</table>

													      </div>
													      <div class="modal-footer">
															    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/signup/signup.do">
																			<input type="submit" value="報名">
																			<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"/>
																			<input type="hidden" name="mem_id" value="${memVO.mem_id}"/>
																			<input type="hidden" name="action" value="insert">
																</FORM>
													        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
													      </div>
													    </div>
													  </div>
													</div>
												</td>										
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="/front-end/footer/footer.jsp" />
	<!-- Scripts -->
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

	<!-- 超連結submit -->
	<script>
	function Signup() {
		  window.open(`<%=request.getContextPath()%>
		`
									+ '/signup/addSignup.jsp',
							"_blank",
							"toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=400, height=400");
		}
	</script>

</body>

</html>