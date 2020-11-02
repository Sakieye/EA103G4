<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->

<html>

<head>
<title>BookShop</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
</head>

<body>
	<!-- Header -->
	<jsp:include page="/front-end/header/header.jsp" />
	<!-- Banner -->
	<section class="banner full">
		<article>
			<img src="<%=request.getContextPath()%>/front-end/images/6.jpg" alt="" />
			<div class="inner">
				<!--                 <header> -->
				<!--                     <p>Content1</p> -->
				<!--                     <h2>Ad1</h2> -->
				<!--                 </header> -->
			</div>
		</article>
		<article>
			<img src="<%=request.getContextPath()%>/front-end/images/1.jpg" alt="" />
			<div class="inner">
				<!--                 <header> -->
				<!--                     <p>Content2</p> -->
				<!--                     <h2>Ad2</h2> -->
				<!--                 </header> -->
			</div>
		</article>
		<article>
			<img src="<%=request.getContextPath()%>/front-end/images/2.jpg" alt="" />
			<div class="inner">
				<!--                 <header> -->
				<!--                     <p>Content3</p> -->
				<!--                     <h2>Ad3</h2> -->
				<!--                 </header> -->
			</div>
		</article>
		<article>
			<img src="<%=request.getContextPath()%>/front-end/images/3.jpg" alt="" />
			<div class="inner">
				<!--                 <header> -->
				<!--                     <p>Content4</p> -->
				<!--                     <h2>Ad4</h2> -->
				<!--                 </header> -->
			</div>
		</article>
		<article>
			<img src="<%=request.getContextPath()%>/front-end/images/4.jpg" alt="" />
			<div class="inner">
				<!--                 <header> -->
				<!--                     <p>Content5</p> -->
				<!--                     <h2>Ad5</h2> -->
				<!--                 </header> -->
			</div>
		</article>
	</section>
	<!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="grid-style">
				<div>
					<div class="box">
						<div class="image fit">
							<img src="<%=request.getContextPath()%>/front-end/images/Bookshop-eshop.jpg" alt="Bookshop Logo" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>部客匣網路書城</p>
								<h2>BOOKSHOP</h2>
							</header>
							<p></p>
							<footer class="align-center">
								<a href="<%=request.getContextPath()%>/front-end/bookshop-eshop/index.jsp" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>
				<div>
					<div class="box">
						<div class="image fit">
							<img src="<%=request.getContextPath()%>/front-end/images/lecture_index.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>部客匣講座</p>
								<h2>LECTURE</h2>
							</header>
							<p></p>
							<footer class="align-center">
								<a href="#" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>
				<div>
					<div class="box">
						<div class="image fit">
							<img src="<%=request.getContextPath()%>/front-end/images/pic3.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>部客匣討論區</p>
								<h2>FORUM</h2>
							</header>
							<p></p>
							<footer class="align-center">
								<a href="<%=request.getContextPath()%>/front-end/forum/forumIndex.jsp" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>
				<div>
					<div class="box">
						<div class="image fit">
							<img src="<%=request.getContextPath()%>/front-end/images/bookClub_index.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>部客匣讀書會</p>
								<h2>BOOKCLUB</h2>
							</header>
							<p></p>
							<footer class="align-center">
								<a href="<%=request.getContextPath()%>/front-end/bookclub/bookclub_index.jsp" class="button alt">Learn More</a>
							</footer>
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
</body>

</html>