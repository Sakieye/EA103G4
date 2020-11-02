<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bookclub.model.*"%>
<%@ page import="com.question.model.*"%>
<%@ page import="com.questionnair_answer.model.*"%>

<%
	BookClubVO bookClubVO = (BookClubVO) request.getAttribute("listOneBookClub");
	request.setAttribute("listOneBookClub", bookClubVO);
	if(bookClubVO == null){
		String bc_id = (String) session.getAttribute("bc_id");
		BookClubService bookClubService = new BookClubService();
		bookClubVO =  bookClubService.getOneBookClub(bc_id);
	}
%>
<%
	QuestionService questionSvc = new QuestionService();
	List<QuestionVO> listQ = questionSvc.getByBcid(bookClubVO.getBc_id());
	pageContext.setAttribute("listQ", listQ);
%>


<jsp:useBean id="memSvc" class="com.mem.model.MemService" />

<html lang="zh">
<head>
<title>瀏覽讀書會</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bookclub_listone.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<body >
	<jsp:include page="/front-end/bookclub/bookClubNotice.jsp" />
	<jsp:include page="/front-end/header/header.jsp" />
	<div class="bg"></div>
	<div class="bg bg2"></div>
	<div class="bg bg3"></div>
	<!-- 點擊置頂按鈕 -->
	<button type="button" id="BackTop" class="toTop-arrow"></button>
	
	<c:choose>
		<c:when test="${listOneBookClub.bc_status eq 1}">
	<div class="container">
		<div class="jumbotron jumbotron-fluid" id="bookclub_pic">
			<img
				src="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do?getImg=<%=bookClubVO.getBc_id()%>">
		</div>
	</div>
	<div class="container">
		<br>
		<div class="row">
			<div class="col-12 col-md-9">
				<div>
					<h1><%=bookClubVO.getBc_name()%></h1>
				</div>
				<div class="bookclub_subtitle">
					<img
						src="<%=request.getContextPath()%>/images/bookclub/calendar.png"
						class="subtitle_pic"> <span>報名時間:</span> <span
						class="date-text"> <%=bookClubVO.getBc_init()%> ~ <%=bookClubVO.getBc_deadline()%></span>
				</div>
				<div class="bookclub_subtitle">
					<img src="<%=request.getContextPath()%>/images/bookclub/clock.png"
						class="subtitle_pic"> <span>活動時間:</span> <span
						class="date-text"><fmt:formatDate
							value="<%=bookClubVO.getBc_time_start()%>"
							pattern="yyyy-MM-dd HH:mm" /> ~ <fmt:formatDate
							value="<%=bookClubVO.getBc_time_end()%>" pattern="HH:mm" /></span>
				</div>
				<div class="bookclub_subtitle">
					<img
						src="<%=request.getContextPath()%>/images/bookclub/mapMarker.png"
						class="subtitle_pic"> <span>活動地點:</span> <span
						class="date-text"> <%=bookClubVO.getBc_place()%></span>
				</div>
				<div class="bookclub_subtitle">
					<img src="<%=request.getContextPath()%>/images/bookclub/peo_up.png"
						class="subtitle_pic"> <span>人數上限:</span> <span
						class="date-text"> <%=bookClubVO.getBc_peo_upper_limit()%></span>
				</div>
				<div class="bookclub_subtitle">
					<img
						src="<%=request.getContextPath()%>/images/bookclub/peo_down.png"
						class="subtitle_pic"> <span>人數下限:</span> <span
						class="date-text"> <%=bookClubVO.getBc_peo_lower_limit()%></span>
				</div>
				<div class="bookclub_subtitle">
					<img
						src="<%=request.getContextPath()%>/images/bookclub/peo_comfirm.png"
						class="subtitle_pic"> <span>已報名人數:</span> <span
						class="date-text"> <%=bookClubVO.getBc_comfirm_peo()%></span>
				</div>
				
				<br>
				<div>
					<h2>讀書會介紹</h2>
					<div class="bookclub_context">
						<%=bookClubVO.getBc_intro()%>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-3">
				<div id="mem">
					<img src="<%=request.getContextPath()%>/mem/MemPic?mem_id=<%=bookClubVO.getMem_id()%>"
						id="mem_pic">
					<div id="mem_name">
						<a href="">${memSvc.getOneMem(listOneBookClub.mem_id).mem_nickname}</a>
					</div>
					<div id="bookclub_intro">
						總是不厭其煩舉例說明，總是為同學提綱挈領，總是<b>超越時數</b>限制地傳授，歡迎「與神同行」！
					</div>
					<c:if test="${memVO.mem_id ne listOneBookClub.mem_id}">
					<button class="style-6e8fa4a0-register-button checkMem" >立即報名<i class="right"></i></button>
					<button  type="button" data-toggle="modal" data-target="#mymodal-data" style="display:none"></button>
					</c:if>
					<c:if test="${memVO.mem_id ne listOneBookClub.mem_id}">
					<button class="style-6e8fa4a0-register-button checkMem" >檢舉讀書會<i class="right"></i></button>
					<button type="button" data-toggle="modal" data-target="#report-bookclub" style="display:none"></button>
					</c:if>
					<c:if test="${memVO.mem_id eq listOneBookClub.mem_id}">
						<button type="button" class="style-6e8fa4a0-register-button"
							data-toggle="modal" data-target="#verify">
							審核成員
						</button>
					</c:if>
					<button type="button" data-toggle="modal" data-target="#logInn" id="logInnn" style="display:none"></button>
					<c:if test="${memVO.mem_id eq listOneBookClub.mem_id}">
						<FORM METHOD="post" ACTION="bookclub.do">
							<button type="submit" class="style-6e8fa4a0-register-button">修改讀書會</button>
							<input type="hidden" name="bc_id"value="<%= bookClubVO.getBc_id() %>">
							<input type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<h3>活動地圖</h3>
			<div id="map">

			</div>
			<div class="bookclub_address">
				<p class="address"><%=bookClubVO.getBc_place()%></p>
			</div>
		</div>
	</div>
	</c:when>
		<c:otherwise>
		<div class="container" style="height:1400px;padding-right: 90%;padding-top: 4%">
			<img src="<%=request.getContextPath()%>/images/bookclub/404.png" style="height: 50%;position: absolute">
		</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/front-end/footer/footer.jsp" />
	<!---------------------------------------------------檢舉讀書會跳窗 --------------------------------------------------->
	<div class="modal" id="report-bookclub" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">檢舉讀書會</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="POST"	action="<%=request.getContextPath()%>/bookclub_report/bookclub_report.do" enctype="multipart/form-data">
						<label for="message-text" class="col-form-label" >原因</label>
						<input type="text" name="bcr_reason">
						<label for="message-text" class="col-form-label" >證明圖片</label>
						<input type="file" name="bcr_proof">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						關閉</button>
					<input type="hidden" name="action" value="insert"> <input
						type="hidden" name="bc_id" value="<%=bookClubVO.getBc_id()%>">
					<input type="hidden" name="mem_id" value="${memVO.mem_id}">
					<input type="hidden" name='requestURL' value = '<%=request.getServletPath() %>'>
					<button type="submit" class="btn btn-primary">送出</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!--------------------------------------------------- 檢舉讀書會跳窗 --------------------------------------------------->
	<!--------------------------------------------------報名問卷跳窗 --------------------------------------------------->
	<div class="modal" id="mymodal-data" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">報名問卷</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="POST"	action="<%=request.getContextPath()%>/back-end/bookclub_regis_detail/bookclub_regis_detail.do">
						<c:forEach var="questionVO" items="${listQ}" varStatus="question">
							<input type="hidden" name="bcq_id" value="${questionVO.bcq_id}">
							<label for="message-text" class="col-form-label" >問題:${question.count}</label>
							<label for="message-text" class="col-form-label">${questionVO.q_data}</label>
							<input type="text" name="qa_data">
						</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						關閉</button>
					<input type="hidden" name="action" value="insert"> <input
						type="hidden" name="bc_id" value="<%=bookClubVO.getBc_id()%>">
					<input type="hidden" name="mem_id" value="${memVO.mem_id}">
					<input type="hidden" name='requestURL' value='<%=request.getServletPath() %>'>
					<button type="submit" class="btn btn-primary">送出</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-------------------------------------------------報名問卷跳窗 --------------------------------------------------->
	<!--------------------------------------------------- 審核跳窗 --------------------------------------------------->

	<!-- 取出service物件 -->
	<jsp:useBean id="bookClub_Regis_DetailSvc"
		class="com.bookclub_regis_detail.model.BookClub_Regis_DetailService" />

	<div class="modal fade" id="verify" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-scrollable modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="verifyTitle">審核列表</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-sm">
						<thead>
							<tr>
								<th>會員編號</th>
								<th>查看問題</th>
								<th>允許</th>
								<th>拒絕</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bookClub_Regis_DetailVO"
								items="<%=bookClub_Regis_DetailSvc.getVerify(bookClubVO.getBc_id())%>">
								<tr>
									<td scope="row" class="memno">${memSvc.getOneMem(bookClub_Regis_DetailVO.mem_id).mem_name}</td>
									<td>
										<table>
											<tr>
												<th>問題編號</th>
												<th>問題內容</th>
												<th>回答編號</th>
												<th>回答內容</th>
											</tr>
											<c:forEach var="questionVO" items="${listQ}"
												varStatus="question">
												<tr>
													<td><label for="message-text" class="col-form-label">問題:${question.count}</label></td>
													<td><label for="message-text" class="col-form-label">${questionVO.q_data}</label></td>
													<td><label for="message-text" class="col-form-label">回答:${question.count}</label></td>
													<td><label for="message-text" class="col-form-label">${questionnair_AnswerSvc.getQuestionnair_Answer(bookClub_Regis_DetailVO.brd_id,questionVO.bcq_id).qa_data}</label></td>
												</tr>
											</c:forEach>
										</table>
									</td>
									<td>
									<input type="hidden" value="${memSvc.getOneMem(bookClub_Regis_DetailVO.mem_id).mem_id}">
									<button type="button"
											class="btn btn-success successVerify"
											value="${listOneBookClub.bc_id}"
											id="${bookClub_Regis_DetailVO.mem_id}"
											onclick="successVerify(this);">允許</button>
									</td>
									<td>
									<input type="hidden" value="${memSvc.getOneMem(bookClub_Regis_DetailVO.mem_id).mem_id}">
									<button type="button"
											class="btn btn-danger failVerify"
											value="${listOneBookClub.bc_id}"
											id="${bookClub_Regis_DetailVO.mem_id}"
											onclick="failVerify(this);">拒絕</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=bookClubVO.getBc_place()%>" id="address">
	<input type="hidden" value="${memVO.mem_id}" id="memcheck">
	<input type="hidden" value="<%=request.getContextPath() %>" id="url">
	<!--------------------------------------------------- 審核跳窗 --------------------------------------------------->
	<!---------------------------------------------------檢舉讀書會跳窗 --------------------------------------------------->
	<div class="modal" id="logInn" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">你還沒登入哦~</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form ACTION="<%=request.getContextPath()%>/mem/mem.do" METHOD="post">
				<div class="modal-body">
					<div id="input-div">
					帳號:
				<label for="inputEmail" class="sr-only">Account</label> 
				<input type="text" id="inputEmail" class="form-control"
					placeholder="Account" required autofocus name="mem_account"
					value="" />
					密碼: 
				<label for="inputPassword" class="sr-only">Password</label> 
				<input type="password" id="inputPassword" class="form-control"
					placeholder="Password" required name="mem_password" value="" />
			</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						關閉</button>
					<button type="submit" name="action" value="signin" class="btn btn-primary">登入</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!--------------------------------------------------- 檢舉讀書會跳窗 --------------------------------------------------->
	<%
		ServletContext context = getServletContext();
		String key = context.getInitParameter("key");
		String key2 = context.getInitParameter("key2");
		StringBuffer magicKey = new StringBuffer("https://maps.googleapis.com/maps/api/js?key=").append(key).append("B").append(key2).append("&libraries=places&callback=initMap");
	%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
		function getPosition(element) {
			var x = 0;
			var y = 0;
			// 搭配上面的示意圖可比較輕鬆理解為何要這麼計算
			while (element) {
				x += element.offsetLeft - element.scrollLeft
						+ element.clientLeft;
				y += element.offsetTop - element.scrollLeft + element.clientTop;
				element = element.offsetParent;
			}

			return {
				x : x,
				y : y
			};
		}

		var start_position = getPosition(document.getElementById("mem"));
		// alert("座標: " + position.x + ', ' + position.y);
		function init() {
			var intViewportHeight = window.innerHeight;

			window
					.addEventListener(
							"scroll",
							function(e) {
								var elem = document.getElementById("mem");
								var position = getPosition(elem);

								if (position.y > start_position.y) {
									// alert("you're at the bottom of the page");
									// document.getElementById("bookclub_intro").style['color'] = "red";

									document.getElementById("bookclub_intro").style['display'] = "block";
									// document.getElementById("mem").style['transition'] = "all,1.5s";
									console.log("g");
								} else {
									// document.getElementById("bookclub_intro").style['color'] = "blue";
									console.log("f");
									document.getElementById("bookclub_intro").style['display'] = "none";
								}
							}, false);

		}
		window.addEventListener('load', init, false);
	</script>
	<script>
	//查詢<a>的各種送出表單
		function formSubmit(action) {
			console.log(action);
			$('#form_input').attr("value", action);
			$('#form').submit();
		}
		
		var checkMem = document.getElementsByClassName('checkMem');
		for (var i = 0; i < checkMem.length; i++) {
			checkMem[i].addEventListener('click', function(e){
				var memVO = '${memVO.mem_id}';
				if(memVO === ''){
					$('#logInnn').click();
					e.stopPropagation();
				}else{
					$(this).next().click();
				}
			});
		}
	</script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					function alignModal() {

						var modalDialog = $(this).find(".modal-dialog");

						/* Applying the top margin on modal dialog to align it vertically center */

						modalDialog.css("margin-top", Math.max(0, ($(window)
								.height() - modalDialog.height()) / 2));

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
	$('.successVerify').click(function(){
	        $.ajax({
	            url: '<%=request.getContextPath()%>/back-end/bookclub_regis_detail/bookclub_regis_detail.do',
	            type: 'post',
	            data: {
	                action: 'verify',
	                verify: 'Pass',
	                bc_id: $(this).val(),
	                mem_id: $(this).attr('id')
	            },
	        });
	        $(this).parent().parent().css('display', 'none');
	        swal.fire({
				icon : 'success',
				title : 'YEAH',
				text : "審核通過",
				showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
			});
	    });

	 $('.failVerify').click(function(){
	        $.ajax({
	            url: '<%=request.getContextPath()%>/back-end/bookclub_regis_detail/bookclub_regis_detail.do',
				type : 'post',
				data : {
					action : 'verify',
					verify : 'fail',
					bc_id : $(this).val(),
					mem_id : $(this).attr('id')
				},
			});
			$(this).parent().parent().css('display', 'none');
			swal.fire({
				icon : 'warning',
				title : 'GG',
				text : "審核不通過",
					showClass: {
					    popup: 'animate__animated animate__fadeInDown'
					  },
					  hideClass: {
					    popup: 'animate__animated animate__fadeOutUp'
					  }
			});
		});
	</script>
	<script>
	<c:if test="${listOneBookClub.bc_status ne 1}">
	swal.fire({
		icon : 'error',
		title : '404',
		text : "找不到囉~ 讀書會已解散",
		onClose: () => {
		location.href=`<%=request.getContextPath()%>` + "/front-end/bookclub/bookclub_index.jsp";
	  		}
		});
	</c:if>
	
		<c:if test="${not empty situation.success}">
		swal.fire({
			icon : 'success',
			title : 'YEAH',
			text : "報名成功，等待審核",
				showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
		});
		sendAddBookClubMessage();
			<%request.removeAttribute("success");%>
		</c:if>
		<c:if test="${not empty situation.report}">
		swal.fire({
			icon : 'success',
			title : 'YEAH',
			text : "檢舉成功，等待審核",
				showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
		});
			<%request.removeAttribute("report");%>
		</c:if>
		<c:if test="${not empty situation.registered}">
	    swal.fire({
	        icon:'warning',
	        title:'oops',
	        text:"已報名，等待審核"
	    });
	    	<% request.removeAttribute("registered"); %>
	    </c:if>
	    <c:if test="${not empty situation.isFull}">
	    swal.fire({
	        icon:'warning',
	        title:'oops',
	        text:"人數已滿"
	    });
	    <% request.removeAttribute("isFull"); %>
	    </c:if>
	    <c:if test="${not empty situation.update}">
	    swal.fire({
	        icon:'success',
	        title:'YEAH',
	        text:"修改成功"
	    });
	    sendUpdateBookClubMessage();
	    	<% request.removeAttribute("update"); %>
	    </c:if>
	</script>
		<!-- 地圖script -->
	<script>
        var map;
     
        function initMap() {
        	geocoder = new google.maps.Geocoder();
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 24.9656967, lng: 121.1922173 },
                zoom: 16,
                
            });
            
            var address = document.getElementById('address').value;

            geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == 'OK') {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                var infowindow = new google.maps.InfoWindow({
                    content: `
                        <div class="info_title">` + "" + `</div>
                        <div><span class="info_head">地址: </span>` + results[0].formatted_address + `</div>

                    `
                });
              } else {
                console.log(status);
              }
              infowindow.open(map, marker);
            });
        }
    </script>
	<script	src=<%=magicKey%> async defer></script>
</body>

</html>