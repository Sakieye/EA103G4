<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bookclub.model.*"%>

<%
	List<BookClubVO> list = (List) session.getAttribute("list");
%>
<!doctype html>
<html lang="zh">

<head>

<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bookclub_index.css">
</head>

<body>
	<jsp:include page="/front-end/bookclub/bookClubNotice.jsp" />
	<jsp:include page="/front-end/header/header.jsp" />
	

	<!-- 點擊置頂按鈕 -->
	<button type="button" id="BackTop" class="toTop-arrow"></button>
	<div class="jumbotron jumbotron-fluid">
		<form action="bookclub.do" method="post" id="form">
			<input id="form_input" type="hidden" name="action" value="">
			<input type="hidden" name='requestURL'
				value='<%=request.getServletPath()%>'>
		</form>
		<div class="container">
			<h1 class="display-4">
				<B>樂活天地</B>
			</h1>
			<p class="lead">閱讀讓你突破時間、空間的限制，在文字中旅行。</p>
		</div>
	</div>
	<div class="path">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<nav class="style-9d977bdb-tab-list-container" style="top: 50px;">
						<ul class="style-e2cd9693-tab-list">
							<li class="style-9c4d2ab9-tab" id="1"
								style="width: 20%; color: rgb(187, 187, 187); border-bottom: none transparent;">
								<div>
									<a class="style-9394412d-tab-link"
										onclick="formSubmit('getAll_For_Display')"><span
										class="style-d50a2f10-tab-inner"><img
											class="style-fe5cd619-tab-icon" id="1-1"
											src="https://static.accupass.com/channel/choice_wb.png"><span
											class="style-de5806aa-tab-label">全部讀書會</span></span></a>
								</div>
							</li>
							<li class="style-9c4d2ab9-tab" id="2"
								style="width: 20%; color: rgb(187, 187, 187); border-bottom: none transparent;">
								<div>
									<a class="style-9394412d-tab-link"
										onclick="formSubmit('new_BookClub')"><span
										class="style-d50a2f10-tab-inner"><img
											class="style-fe5cd619-tab-icon" id="2-1"
											src="https://static.accupass.com/channel/study_wb.png"><span
											class="style-de5806aa-tab-label">最新讀書會</span></span></a>
								</div>
							</li>
							<li class="style-9c4d2ab9-tab" id="3"
								style="width: 20%; color: rgb(187, 187, 187); border-bottom: none transparent;">
								<div>
									<a class="style-9394412d-tab-link" onclick="formSubmit('full')"><span
										class="style-d50a2f10-tab-inner"><img
											class="style-fe5cd619-tab-icon" id="3-1"
											src="https://static.accupass.com/channel/art_wb.png"><span
											class="style-de5806aa-tab-label">即將額滿</span></span></a>
								</div>
							</li>
							<li class="style-9c4d2ab9-tab" id="4"
								style="width: 20%; color: rgb(187, 187, 187); border-bottom: none transparent;">
								<div>
									<a class="style-9394412d-tab-link"
										onclick="formSubmit('comingSoon')"><span
										class="style-d50a2f10-tab-inner"><img
											class="style-fe5cd619-tab-icon" id="4-1"
											src="https://static.accupass.com/channel/experience_wb.png"><span
											class="style-de5806aa-tab-label">即將截止</span></span></a>
								</div>
							</li>
							<li class="style-9c4d2ab9-tab"
								style="width: 20%; color: rgb(187, 187, 187); border-bottom: none transparent;">
								<div>
									<a class="style-9394412d-tab-link"
										onclick="location='<%=request.getContextPath()%>/front-end/bookclub/addBookClub.jsp'"><span
										class="style-d50a2f10-tab-inner"><img
											class="style-fe5cd619-tab-icon"
											src="<%=request.getContextPath()%>/images/bookclub/create_bookclub.png"><span
											class="style-de5806aa-tab-label">舉辦讀書會</span></span></a>
								</div>
							</li>
						</ul>
						<div class="style-bf418730-tab-list-border"></div>
					</nav>
				</ol>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="col-12 col-md-12">
				<nav class="little_title">
					<div class="con">
						<img
							src="<%=request.getContextPath()%>/images/bookclub/search_background.jpg"
							alt="Avatar" class="image">
						<div id="search">
							<form action="bookclub.do" method="post">
								<input type="hidden" name="action" value="search"> <input
									type="text" name="search" id="search-box" placeholder="search">
							</form>
						</div>
						<div class="overlay">
							<h1>找讀書會嗎?</h1>
							<p>出社會後，工作越來越繁忙，漸漸[閱讀]變成一種奢侈
								很慶幸也是因為讀書會的關係，認識一群很棒的人，也常與他們一起辦活動，知名大廠工程師、幼稚園老師、補教名師、知名理財部落客、專
								di業投資人、各產業TOP SALES.. 等。 因此我們集結一些好友，一同舉辦好書分享會!
								藉由輕鬆自在的分享，我們交流想法，充實心靈，更重要的是結交益友!
								請您放心我們不是老鼠會也不是保險業，只是我們對於財經/心靈勵志方面的書籍較有興趣，挑的都是一些很經典的書籍。若你有推薦的書單，也可跟我們分享。
							</p>
						</div>
					</div>
				</nav>
				<%@ include file="page1.file"%>
				<h4 class="alert-heading">${title}</h4>

				<c:forEach var="BookClubVO" items="${list}" begin="<%= index %>"
					end="<%= index + rowsNum -1 %>">

					<div class="row">
						<div class="card mb-3" style="max-width: 100%;">
							<div class="row no-gutters">
								<div class="col-md-4">
									<img
										src="<%= request.getContextPath()%>/front-end/bookclub/bookclub.do?getImg=${BookClubVO.bc_id}"
										class="img-thumbnail">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h3 class="card-title" style="color:black">${BookClubVO.bc_name}</h3>
										<div class="date">
											<img
												src="<%=request.getContextPath()%>/images/bookclub/clock.png"
												class="clock"> <span class="date-text">${BookClubVO.bc_init}</span>
											<span class="date-text"> ~ </span> <span class="date-text">${BookClubVO.bc_deadline}</span>
										</div>
										<p class="card-text JQellipsis">${BookClubVO.bc_intro}</p>
										<p class="card-text">
											<small class="text-muted"></small>
										</p>
										<div id="look_button">
											<form action="bookclub.do" method="post">
												<input type="hidden" name="bc_id"
													value="${BookClubVO.bc_id}"> <input type="hidden"
													name="action" value="getOne_For_Display"> <input
													type="submit" value="瀏覽詳情">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<%@ include file="page2.file"%>

			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script src="<%=request.getContextPath()%>/js/sweetAlert2 9.5.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
	<!-- 點擊置頂按鈕js -->
	<script>
		console.log($('#BackTop'));
		$(function() {
			$('#BackTop').click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 333);
			});
			$(window).scroll(function() {
				if ($(this).scrollTop() > 300) {
					$('#BackTop').fadeIn(222);
				} else {
					$('#BackTop').stop().fadeOut(222);
				}
			}).scroll();
		});
	</script>
	<script>
		$(function() {
			var len = 80; // 超過50個字以"..."取代
			$(".JQellipsis").each(function(i) {
				if ($(this).text().length > len) {
					$(this).attr("title", $(this).text());
					var text = $(this).text().substring(0, len - 1) + "...";
					$(this).text(text);
				}
			});
		});
	</script>
	<!-- 	超連結submit -->
	<script>
		function formSubmit(action) {
			console.log(action);
			$('#form_input').attr("value", action);
			$('#form').submit();
		}
	</script>
	<!-- 	分類換顏色 -->
	<script>
		$('#1')
				.click(
						function() {
							$(this).css({
								'color' : 'rgb(177, 9, 35)',
								'border-bottom' : '6px solid rgb(177, 9, 35)'
							});
							$('#1-1')
									.attr('src',
											'https://static.accupass.com/channel/choice.png');
							$('#2').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#2-1')
									.attr('src',
											'https://static.accupass.com/channel/study_wb.png');
							$('#3').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#3-1')
									.attr('src',
											'https://static.accupass.com/channel/art_wb.png');
							$('#4').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#4-1')
									.attr('src',
											'https://static.accupass.com/channel/experience_wb.png');
						});
		$('#2')
				.click(
						function() {
							$('#1').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#1-1')
									.attr('src',
											'https://static.accupass.com/channel/choice_wb.png');
							$(this)
									.css(
											{
												'color' : 'rgb(177, 130, 217)',
												'border-bottom' : '6px solid rgb(177, 130, 217)'
											});
							$('#2-1')
									.attr('src',
											'https://static.accupass.com/channel/study.png');
							$('#3').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#3-1')
									.attr('src',
											'https://static.accupass.com/channel/art_wb.png');
							$('#4').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#4-1')
									.attr('src',
											'https://static.accupass.com/channel/experience_wb.png');
						});
		$('#3')
				.click(
						function() {
							$('#1').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#1-1')
									.attr('src',
											'https://static.accupass.com/channel/choice_wb.png');
							$('#2').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#2-1')
									.attr('src',
											'https://static.accupass.com/channel/study_wb.png');
							$(this).css({
								'color' : 'rgb(77, 190, 152)',
								'border-bottom' : '6px solid rgb(77, 190, 152)'
							});
							$('#3-1')
									.attr('src',
											'https://static.accupass.com/channel/art.png');
							$('#4').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#4-1')
									.attr('src',
											'https://static.accupass.com/channel/experience_wb.png');
						});
		$('#4')
				.click(
						function() {
							$('#1').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#1-1')
									.attr('src',
											'https://static.accupass.com/channel/choice_wb.png');
							$('#2').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#2-1')
									.attr('src',
											'https://static.accupass.com/channel/study_wb.png');
							$('#3').css({
								'color' : 'rgb(187, 187, 187)',
								'border-bottom' : 'none transparent'
							});
							$('#3-1')
									.attr('src',
											'https://static.accupass.com/channel/art_wb.png');
							$(this).css({
								'color' : 'rgb(242, 171, 46)',
								'border-bottom' : '6px solid rgb(242, 171, 46)'
							});
							$('#4-1')
									.attr('src',
											'https://static.accupass.com/channel/experience.png');
						});
	</script>
	<!-- 	sweetAlert -->
	<script>
		<c:if test="${not empty search_result.data_not_found}">
		swal.fire({
			icon : 'warning',
			title : 'oops',
			text : "查無此資料"
		});
	<%request.removeAttribute("search_result");%>
		</c:if>
		<c:if test="${not empty search_result.error}">
		swal.fire({
			icon : 'error',
			title : '錯誤',
			text : "請輸入關鍵字"
		});
	<%request.removeAttribute("search_result");%>
		</c:if>
	</script>
</body>

</html>