<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.categorie.model.*"%>

<%
	LectureService lectureService = new LectureService();
List<LectureVO> list = lectureService.getByState();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE HTML>
<html>

<head>
<title>BookShop</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/lecture_index.css" />
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
								<jsp:useBean id="lectureService1" scope="page" class="com.lecture.model.LectureService" />

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
														<img width="80px" heigh="80px" src="${pageContext.request.contextPath}/ShowLecturePic?lc_id=${lectureVO.lc_id}" style="border-radius: 0%; width: 80px; height: 80px;" />
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
													<form method="post" action="<%=request.getContextPath()%>/back-end/lecture/lecture.do">
														<button type="submit" style="background-color: #dee2e6;">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  																<path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
  																<path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
															</svg>
														</button>
														<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"> <input type="hidden" name="action" value="getOne_For_Update">

													</form>
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

	<!-- 超連結submit -->
	<script>
		function formSubmit(action) {
			console.log(action);
			$('#form_input').attr("value", action);
			$('#form').submit();
		}
	</script>

</body>

</html>