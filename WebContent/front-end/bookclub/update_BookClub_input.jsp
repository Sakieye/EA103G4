<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.bookclub.model.*"%>

<%
	BookClubVO bookClubVO = (BookClubVO) request.getAttribute("bookClubVO");
%>

<html>
<head>
<style type="text/css">
#container {
	margin: 0 auto;
	width: 50%;
}
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>讀書會資料修改</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/bookclub_update_input.css" />
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
				<h1>讀書會修改</h1>
				<h1></h1>
				<div style="font-size: 40px">
					<b>讀書會資料修改</b>
				</div>
				<FORM METHOD="post" ACTION="bookclub.do"
					enctype="multipart/form-data">
					<table class="table table-striped">
						<tr>
							<td>讀書會編號:<font color=red><b>*</b></font></td>
							<td>${bookClubVO.bc_id}</td>
						</tr>
						<tr>
							<td>讀書會名稱:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_name}</div> <input
								type="text" name="bc_name" size="45"
								value="${bookClubVO.bc_name}" /></td>
						</tr>
						<tr>

							<td>地點:</td>

							<td><div class="erroMsgs">${errorMsgs.bc_place}</div>
								<div id="twzipcode"></div> <input id="address" type="text"
								name="bc_place" size="45" value="${bookClubVO.bc_place}" /></td>
						</tr>
						<tr>
							<td>活動開始時間:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_time_start}</div> <input
								type="text" name="bc_time_start" id="bc_time_start"
								value="<fmt:formatDate value="${bookClubVO.bc_time_start}" pattern="yyyy-MM-dd HH:mm"/>" /></td>
						</tr>
						<tr>

							<td>活動結束時間:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_time_end}</div> <input
								type="text" name="bc_time_end" id="bc_time_end"
								value="<fmt:formatDate value="${bookClubVO.bc_time_end}" pattern="yyyy-MM-dd HH:mm"/>">
							</td>
						</tr>
						<tr>
							<td>人數上限:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_peo_upper_limit}</div>
								<input type="text" name="bc_peo_upper_limit"
								value="${bookClubVO.bc_peo_upper_limit}" /></td>
						</tr>
						<tr>
							<td>人數下限:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_peo_lower_limit}</div>
								<input type="text" name="bc_peo_lower_limit"
								value="${bookClubVO.bc_peo_lower_limit}" /></td>
						</tr>
						<tr>
							<td>讀書會介紹:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_intro}</div> <textarea
									name="bc_intro">${bookClubVO.bc_intro}</textarea></td>
						</tr>
						<tr>
							<td>讀書會圖片:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_cover_pic}</div> <input
								type="file" name="bc_cover_pic" /></td>
						</tr>
						<tr>
							<td>報名開始時間:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_init}</div> <input
								type="text" name="bc_init" id="bc_init"
								value="${bookClubVO.bc_init}" /></td>
						</tr>
						<tr>
							<td>報名結束時間:</td>
							<td><div class="erroMsgs">${errorMsgs.bc_deadline}</div> <input
								type="text" name="bc_deadline" id="bc_deadline"
								value="${bookClubVO.bc_deadline}" /></td>
						</tr>


					</table>
					<br> <input type="hidden" name="action" value="update">
					<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
					<input type="submit" value="送出修改">
				</FORM>
			</div>
		</div>
	</div>

	<jsp:include page="/front-end/footer/footer.jsp" />
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
<script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%= request.getContextPath()%>/js/util.js"></script>
<script src="<%= request.getContextPath()%>/js/main.js"></script>
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
	//讀書會開始日期不能在兩個禮拜內
	var somedate1 = new Date(new Date().getTime() + 1209600000);
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
	//選單事件註冊
	$(document).ready(function() {
		$("#twzipcode select").change(function() {
			$("#address").val($('#twzipcode :selected').text()); //事件發生時把選單數值填入下方輸入盒
		});

	});

	//地址屬性設定
	$("#twzipcode").twzipcode({
		zipcodeIntoDistrict : true, // 郵遞區號自動顯示在地區
		countyName : "city", // 自訂城市 select 標籤的 name 值
		districtName : "town" // 自訂地區 select 標籤的 name 值
	});
</script>
</html>