<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
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
<title>讀書會資料修改</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/bookclub_update_input.css" />
</head>
<body >
	<div class="container">
		<div class="row">
			<jsp:include page="/front-end/header/header.jsp" />
		</div>
	</div>
	<div class="container">
		<div class="row" id="container">
			<div class="col-12" style="background-color: whitesmoke">
				
				<div style="font-size: 40px">
					<b>讀書會資料修改</b>
				</div>
				<FORM METHOD="post" ACTION="bookclub.do"
					enctype="multipart/form-data">
					<table class="table table-striped">
						<tr>
							<td>讀書會編號:</td>
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
							<td><button type="button" class="style-6e8fa4a0-register-button" style="display:none"
							data-toggle="modal" data-target="#address-map">選擇地點</button>
							<input type="text" class="form-control in" maxlength="30"
							name="bc_place" value="${bookClubVO.bc_place}" id="address_out" ></td>
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
							<td ><div class="erroMsgs">${errorMsgs.bc_intro}</div> <textarea
									name="bc_intro">${bookClubVO.bc_intro}</textarea></td>
						</tr>
						<tr>
							<td>讀書會圖片:</td>
							<td style="position:relative"><div class="erroMsgs">${errorMsgs.bc_cover_pic}</div> <img src="<%= request.getContextPath()%>/front-end/bookclub/bookclub.do?getImg=${bookClubVO.bc_id}" id="img_before">
							<label id="img_upload" >
							<input type="file" name="bc_cover_pic" onchange="img_load(this);" id="img_loadInput"/></label></td>
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
					<input type="submit" class="btn-success" value="送出修改">
				</FORM>
			</div>
		</div>
	</div>

	<jsp:include page="/front-end/footer/footer.jsp" />
	<!---------------------------------------------------地址地圖跳窗 --------------------------------------------------->
	<div class="modal" id="address-map" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">地址</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="address" style="z-index:1000"></label>
					<div id="twzipcode"></div>
					<input type="text" class="form-control in" id="address"	value="${bookClubVO.bc_place}" maxlength="30" >
					<div id="map"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						關閉</button>
					<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="get_address()">選擇</button>
				</div>
			</div>
		</div>
	</div>
	<!--------------------------------------------------- 地址地圖跳窗 --------------------------------------------------->




<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
<%
	ServletContext context = getServletContext();
	String key = context.getInitParameter("key");
	String key2 = context.getInitParameter("key2");
	StringBuffer magicKey = new StringBuffer("https://maps.googleapis.com/maps/api/js?key=").append(key).append("B").append(key2).append("&libraries=places&callback=initMap");
%>


<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
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
<!--     modal 置中script -->
<script type="text/javascript">
		$(document).ready(
				function() {

					function alignModal() {

						var modalDialog = $(this).find(".modal-dialog");

						/* Applying the top margin on modal dialog to align it vertically center */

						modalDialog.css("margin-top", Math.max(0, ($(window)
								.height() - modalDialog.height()) / 4));

					}

					// Align modal when it is displayed

					$(".modal").on("shown.bs.modal", alignModal);

					// Align modal when user resize the window

					$(window).on("resize", function() {

						$(".modal:visible").each(alignModal);

					});

				});
</script>
<script>
        var map;
        function init() {
            var keyword = document.getElementById('address');
            
            var options = {
                componentRestrictions: { country: 'tw' } // 限制在台灣範圍
            };
            var autocomplete = new google.maps.places.Autocomplete(keyword, options);
            console.log(autocomplete);
            // 地址的輸入框，值有變動時執行
            autocomplete.addListener('place_changed', function() {
                var place = autocomplete.getPlace(); // 地點資料存進place
                console.log("2" + place);
                // debugger;
                // 確認回來的資料有經緯度
                if (place.geometry) {
                    // 改變map的中心點
                    var searchCenter = place.geometry.location;
                    // panTo是平滑移動、setCenter是直接改變地圖中心
                    map.panTo(searchCenter);
                    // 在搜尋結果的地點上放置標記
                    var marker = new google.maps.Marker({
                        position: searchCenter,
                        map: map
                    });
                    // info window
                    var infowindow = new google.maps.InfoWindow({
                        content: `
                            <div class="info_title">` + place.name + `</div>
                            <div><span class="info_head">地址: </span>` + place.formatted_address + `</div>
                            <div><span class="info_head">經緯度: </span>(` + place.geometry.location.lat() + `, ` + place.geometry.location.lng() + `)</div> 
                            <div><img class="info_img" src="` + place.photos[5].getUrl() + `"></div>
                        `
                    });
                    infowindow.open(map, marker);
                }

            });
        }

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 24.9656967, lng: 121.1922173 },
                zoom: 15,
            });
        }

        window.onload = init;
        
        function get_address(){
        	var address_in = $("#address").val();
        	$("#address_out").attr("value",address_in);

        }
        
            $("#address_out").on("focus",function(){
            	
                $(this).prev().click();
                
            })
        
    </script>
	<script	src=<%=magicKey%> async defer></script>
	<script>
	function img_load(img) {
		$("#img_before").css('display','none');
        if (img.files && img.files[0]) {
            console.log(img.files);
            var reader = new FileReader();
            reader.onload = function(event) {
                $('#img_upload').css('background-image', 'url(' + event.target.result + ')');
            }
            reader.readAsDataURL(img.files[0]);
        }
    }
	
	$("#img_before").on("click",function(){
		$('#img_upload').click();
	})
	</script>
</body>
</html>