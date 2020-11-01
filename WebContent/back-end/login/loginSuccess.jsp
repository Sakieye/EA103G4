<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>登入成功</title>
<!-- BOOSTRAP CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/vendors/styles/style.css">
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
						<h2 class="text-danger h2">
							<b>登入成功 !</b>
						</h2>
					</div>
				</div>
			</div>
			<hr>

			<!-- Begin Page Content -->
			<div class="container-fluid">
				<!-- Content Row -->
				<div class="row">
					<div class="col-xl-8 col-lg-7">
						<!-- Area Chart -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Transaction
									of this month</h6>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="myAreaChart"></canvas>
								</div>
							</div>
						</div>

						<!--Bar Chart-->
						<!--               <div class="card shadow mb-4"> -->
						<!--                 <div class="card-header py-3"> -->
						<!--                   <h6 class="m-0 font-weight-bold text-primary">Transaction for nearly 6 months</h6> -->
						<!--                 </div> -->
						<!--                 <div class="card-body"> -->
						<!--                   <div class="chart-bar"> -->
						<!--                     <canvas id="myBarChart"></canvas> -->
						<!--                   </div> -->
						<!--                 </div> -->
						<!--               </div> -->

					</div>

					<!-- Donut Chart -->
					<div class="col-xl-4 col-lg-5">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Selling Chart</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4">
									<canvas id="myPieChart"></canvas>
								</div>
							</div>
						</div>
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Daily
									Sentence</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div>
									<img src="<%=request.getContextPath()%>/images/login/wu.jpg"
										width="100px" height="100px"> <br>
									<h3 class="text-secondary">
										<b>紙上得來終覺淺,絕知此事必躬行<b>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<jsp:include page="/back-end/sidebar/sidebar.jsp" />
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/sb-admin-2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/chart-area-demo_wj.js"></script>
	<script src="<%=request.getContextPath()%>/js/chart-pie-demo_wj.js"></script>
	<script src="<%=request.getContextPath()%>/js/chart-bar-demo_wj.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

</body>

</html>