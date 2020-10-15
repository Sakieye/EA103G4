<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.bookclub.model.*"%>
<%@ page import="com.bookclub_regis_detail.model.*"%>
<%@ page import="com.mem.model.*"%>>
<%@ page import="java.util.*"%>

<%
	HttpSession Signsession = request.getSession();
	MemVO memVO = (MemVO) Signsession.getAttribute("memVO");
	BookClub_Regis_DetailService bookClub_Regis_DetailSvc = new BookClub_Regis_DetailService();
	List<BookClub_Regis_DetailVO> list = bookClub_Regis_DetailSvc.getByMyself(memVO.getMem_id());
	pageContext.setAttribute("list", list);
%>
<%
	BookClubService bookClubSvc = new BookClubService();
	List<BookClubVO> listBook = bookClubSvc.getAll();
	pageContext.setAttribute("listBook", listBook);
%>

<html>
<head>
<style type="text/css">
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>我參加的讀書會</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewBookClub.css">
</head>
<body bgcolor='white'>

	<div class="container">
		<div class="row">
			<jsp:include page="/front-end/header/header.jsp" />
			
		</div>
	</div>
	<div class="container">
		<div class="row" id="container">
			<div class="col-12">


				<div style="font-size: 40px">
					<b>已參加讀書會</b>
				</div>
				<table class="table reviewBody text-center table-striped">
					<thead class="thead-light">
						<tr>
							<th scope="col" class="titleItem text-nowrap">讀書會名稱</th>
							<th scope="col" class="titleItem text-nowrap">審核狀態</th>
							<th scope="col" class="titleItem text-nowrap">詳情</th>
							<th scope="col" class="titleItem text-nowrap">聊天室</th>
							<th scope="col" class="titleItem text-nowrap">退出行程</th>
						</tr>
					</thead>
					<tbody>
						<jsp:useBean id="BookClubSvc" scope="page"
							class="com.bookclub.model.BookClubService" />
						<c:forEach var="BookClub_Regis_DetailVO" items="${list}">
							<tr>
								<td><c:forEach var="bookClubVO" items="${listBook}">
										<c:if
											test="${BookClub_Regis_DetailVO.bc_id eq bookClubVO.bc_id}">
                           					 ${bookClubVO.bc_name}
                        				</c:if>
									</c:forEach></td>
								<td>${brdStatus[BookClub_Regis_DetailVO.brd_status]}</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0">
										<button type="submit" class="reviewGroupBtn btn btn-info"
											name="action" value="getOne_For_Display">詳情</button>
										<input type="hidden" name="bc_id"
											value="${BookClub_Regis_DetailVO.bc_id}">
									</form>
								</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0">
										<button type="submit" class="btn chat" name="action"
											value="bookClubChat" style="border: none;"
											${(BookClub_Regis_DetailVO.brd_status ne 2)? 'disabled' : ''}>
											<img
												src="<%=request.getContextPath()%>/images/bookclub/chat.png">
										</button>
										<input type="hidden" name="bc_id"
											value="${BookClub_Regis_DetailVO.bc_id}"> <input
											type="hidden" name="mem_id" value="<%=memVO.getMem_id()%>">
									</form>
								</td>
								<td>
									<button type="button" class="btn btn-danger quit"
										id="${BookClub_Regis_DetailVO.brd_status}" data-toggle="modal"
										data-target="#quitModal"
										value="${BookClub_Regis_DetailVO.bc_id}">退出</button>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>

	<jsp:include page="/front-end/footer/footer.jsp" />

	<div class="modal fade" id="quitModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h5 class="modal-title" id="exampleModalCenterTitle">退出此行程?</h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>

					<form method="POST"
						action="<%=request.getContextPath()%>/back-end/bookclub_regis_detail/bookclub_regis_detail.do"
						class="reviewSubmit">
						<button type="submit" id="quitSubmit" class="btn btn-primary"
							name="bc_id" value="">確定</button>
						<input type="hidden" name="action" value="quit"> <input
							type="hidden" name="mem_id" value="${memVO.mem_id}">
					</form>

				</div>
			</div>
		</div>
	</div>




</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
<script src="<%=request.getContextPath()%>/js/sweetAlert2 9.5.2.js"></script>
<script	src='<%=request.getContextPath()%>/js/jquery.datetimepicker.full.js'></script>
<script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
<script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%= request.getContextPath()%>/js/util.js"></script>
<script src="<%= request.getContextPath()%>/js/main.js"></script>
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script id="datetimepicker">
	//設定日曆語言為中文
	$.datetimepicker.setLocale('zh');

	$(function() {
		$('#bc_time_start').datetimepicker(
				{
					format : 'Y-m-d H:i',
					onShow : function() {
						this.setOptions({
							maxDate : $('#bc_time_end').val() ? $(
									'#bc_time_end').val() : false
						})
					},
					timepicker : true
				});

		$('#bc_time_end').datetimepicker(
				{
					format : 'Y-m-d H:i',
					onShow : function() {
						this.setOptions({
							minDate : $('#bc_time_start').val() ? $(
									'#bc_time_start').val() : false
						})
					},
					timepicker : true
				});
		$('#bc_init').datetimepicker(
				{
					format : 'Y-m-d ',
					onShow : function() {
						this.setOptions({
							maxDate : $('#bc_time_start').val() ? $(
									'#bc_time_start').val() : false
						})
					},
					timepicker : false
				});
		$('#bc_deadline').datetimepicker(
				{
					format : 'Y-m-d ',
					onShow : function() {
						this.setOptions({
							minDate : $('#bc_init').val() ? $('#bc_init').val()
									: false,
							maxDate : $('#bc_time_start').val() ? $(
									'#bc_time_start').val() : false
						})
					},
					timepicker : false
				});
	});
	//讀書會開始日期不能在今天之前
	var somedate1 = new Date();
	$('#bc_time_start')
			.datetimepicker(
					{
						beforeShowDay : function(date) {
							if (date.getYear() < somedate1.getYear()
									|| (date.getYear() == somedate1.getYear() && date
											.getMonth() < somedate1.getMonth())
									|| (date.getYear() == somedate1.getYear()
											&& date.getMonth() == somedate1
													.getMonth() && date
											.getDate() < somedate1.getDate())) {
								return [ false, "" ]
							}
							return [ true, "" ];
						}
					});
</script>

<script>
	$('.quit').click(function() {
		var quitValue = $(this).val();
		$('#quitSubmit').val(quitValue);
	});
	<c:if test="${not empty situation.quit}">
	swal.fire({
		icon : 'success',
		title : 'GoodBye',
		text : "已退出此行程"
	});
<%request.removeAttribute("quit");%>
	</c:if>
	$('#3').attr("disabled", true);
	$('#4').attr("disabled", true);
</script>

</html>