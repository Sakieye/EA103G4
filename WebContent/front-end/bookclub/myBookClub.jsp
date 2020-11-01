<%@page import="com.mem.model.*"%>
<%@page import="com.bookclub.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>



<title>我創建的讀書會</title>

</head>

<!--------------------------------------- 取出Service 跑創建者的集合 ---------------------------------->
<%
	HttpSession mySession = request.getSession();
	MemVO memVO = (MemVO) mySession.getAttribute("memVO");
	BookClubService bookClubSvc = new BookClubService();
	List<BookClubVO> Blist = bookClubSvc.getByMyself(memVO.getMem_id());
	pageContext.setAttribute("list", Blist);
%>
<!--------------------------------------- 取出Service 跑創建者的集合 ---------------------------------->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sweetalert.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/myBookClub.css">
<body>
<div class="bg"></div>
	<div class="bg bg2"></div>
	<div class="bg bg3"></div>
	<jsp:include page="/front-end/header/header.jsp" />
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>部客匣BookShop</p>
				<h2>
					<b>我的讀書會</b>
				</h2>
			</header>
		</div>
	</section>


	
		<div class="row" id="container">

			<div class="col-12">
				<!------------------------------------------------ 表頭 ------------------------------------------->
				<table class="table reviewBody text-center table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col" class="titleItem text-nowrap">讀書會名稱</th>
							<th scope="col" class="titleItem text-nowrap">活動地址</th>
							<th scope="col" class="titleItem text-nowrap">活動時間</th>
							<th scope="col" class="titleItem text-nowrap">活動狀態</th>
							<th scope="col" class="titleItem text-nowrap">人數上限</th>
							<th scope="col" class="titleItem text-nowrap">參與人數</th>
							<th scope="col" class="titleItem text-nowrap">修改</th>
							<th scope="col" class="titleItem text-nowrap">詳情</th>
							<th scope="col" class="titleItem text-nowrap">聊天室</th>
							<th scope="col" class="titleItem text-nowrap">解散</th>
						</tr>
					</thead>
					<!------------------------------------------------ 表頭 ------------------------------------------->

					<tbody>

						<!----------------------------------------------- 滾出資料 ------------------------------------------>
						<c:forEach var="bookClubVO" items="${list}">
							<tr>
								<td class="text-nowrap">${bookClubVO.bc_name}</td>
								<td>${bookClubVO.bc_place}</td>
								<td><fmt:formatDate value="${bookClubVO.bc_time_start}"
										pattern="yyyy-MM-dd HH:mm" /> ~ <fmt:formatDate
										value="${bookClubVO.bc_time_end}" pattern="HH:mm" /></td>
								<td>${bcStatus[bookClubVO.bc_status]}</td>
								<td>${bookClubVO.bc_peo_upper_limit}</td>
								<td>${bookClubVO.bc_comfirm_peo}</td>
								<td>
									<FORM METHOD="post" ACTION="bookclub.do">
										<button type="submit" class="btn btn-warning ${bookClubVO.bc_status}">修改讀書會</button>
										<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0">
										<button type="submit" class="reviewGroupBtn btn btn-info ${bookClubVO.bc_status}"
											name="action" value="getOne_For_Display">詳情</button>
										<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
									</form>
								</td>
								<td>
									
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0" id="myBookClubimg">
										<img src="<%=request.getContextPath()%>/images/bookclub/chat.png" class="btn chat chatpic">
										<button type="submit" class="btn chat ${bookClubVO.bc_status}" name="action" id="chatbtn"
										 	value="bookClubChat" style="border: none;display: none">
										</button>
										<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
										<input type="hidden" name="mem_id"
											value="<%=memVO.getMem_id()%>">
									</form>
								</td>
								<td>
									<button type="button" class="btn btn-danger quit disband ${bookClubVO.bc_status}"
										data-toggle="modal"
										data-target="#quitModal"
										value="${bookClubVO.bc_id}" >解散</button>
								</td>
							</tr>
						</c:forEach>
						<!------------------------------------------------ 滾出資料 ------------------------------------------>

					</tbody>

				</table>
			</div>
		</div>
	
	
	<div class="modal fade" id="quitModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h5 class="modal-title" id="exampleModalCenterTitle">確定要解散此讀書會?</h5>
				</div>
				<img src="<%=request.getContextPath()%>/images/bookclub/check.png" style="height:250px">
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>

					<form method="POST"
						action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
						class="reviewSubmit">
						<button type="submit" id="disbandSubmit" class="btn btn-primary" name="bc_id" value="">確定</button>
						<input type="hidden" name="action" value="disband">
					</form>

				</div>
			</div>
		</div>
	</div>

	<!------------------------------------------------ bootstrap.js --------------------------------------------->
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/sweetAlert2 9.5.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	
	<script>
	
	
	$('.disband').click(function() {
		var disbandValue = $(this).val();
		console.log(disbandValue);
		$('#disbandSubmit').val(disbandValue);
	});
	
	<c:if test="${not empty situation.disband}">
	swal.fire({
		icon : 'success',
		title : 'GoodBye',
		text : "已解散此讀書會"
	});
	<%request.removeAttribute("disband");%>
	</c:if>
	
	$('.chatpic').on('click',function(){
		$(this).next().click();
	});
	$('td').css('vertical-align','middle');
	$('.3').attr("disabled", true);
	var status = '${bookClubVO.bc_status}'
		if(status === '2'){
			$('.btn').attr("disabled", true);
		}
	</script>
	
</body>
</html>