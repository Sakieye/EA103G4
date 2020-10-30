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
	BookClubService BookClubSvc = new BookClubService();
	List<BookClubVO> listBook = BookClubSvc.getAll();
	pageContext.setAttribute("listBook", listBook);
%>

<html>
<head>
<style type="text/css">
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>讀書會報名紀錄</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewBookClub.css">
</head>
<body bgcolor='white' >
	<div class="bg"></div>
	<div class="bg bg2"></div>
	<div class="bg bg3"></div>
	<div class="container">
		<div class="row">
			<jsp:include page="/front-end/header/header.jsp" />
			
		</div>
	</div>
	<section id="One" class="wrapper style3">
        <div class="inner">
            <header class="align-center">
                <p>部客匣BookShop</p>
                <h2>讀書會報名紀錄</h2>
            </header>
        </div>
    </section>
	<div class="container">
		<div class="row" id="container">
			<div class="col-12">
				<table class="table reviewBody text-center table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col" class="titleItem text-nowrap">讀書會名稱</th>
							<th scope="col" class="titleItem text-nowrap">讀書會狀態</th>
							<th scope="col" class="titleItem text-nowrap">審核狀態</th>
							<th scope="col" class="titleItem text-nowrap">詳情</th>
							<th scope="col" class="titleItem text-nowrap">聊天室</th>
							<th scope="col" class="titleItem text-nowrap">退出行程</th>
						</tr>
					</thead>
					<tbody>
						<jsp:useBean id="bookClubSvc" scope="page"
							class="com.bookclub.model.BookClubService" />
						<c:forEach var="bookClub_Regis_DetailVO" items="${list}">
							<tr>
								<td><c:forEach var="bookClubVO" items="${listBook}">
										<c:if
											test="${bookClub_Regis_DetailVO.bc_id eq bookClubVO.bc_id}">
                           					 ${bookClubVO.bc_name}
                        				</c:if>
									</c:forEach></td>
								<c:set var='bc_status' value='${bookClubSvc.getOneBookClub(bookClub_Regis_DetailVO.bc_id).bc_status}'/>
								<td>${bcStatus[bc_status]}</td>	
								<td>${brdStatus[bookClub_Regis_DetailVO.brd_status]}</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0">
										<input type="hidden" value="${bc_status}" class="statuss">
										<button type="submit" class="reviewGroupBtn btn btn-info ${bookClub_Regis_DetailVO.brd_status} ${bc_status}"
											name="action" value="getOne_For_Display">詳情</button>
										<input type="hidden" name="bc_id"
											value="${bookClub_Regis_DetailVO.bc_id}">
									</form>
								</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0">
										<img src="<%=request.getContextPath()%>/images/bookclub/chat.png" class="btn chat chatpic ">
										<button type="submit" class="btn chat ${bc_status}" name="action" id="chatbtn"
											value="bookClubChat" style="border: none;display: none"
											${(bookClub_Regis_DetailVO.brd_status ne 2)? 'disabled' : ''}>
										</button>
										<input type="hidden" name="bc_id"
											value="${bookClub_Regis_DetailVO.bc_id}"> <input
											type="hidden" name="mem_id" value="<%=memVO.getMem_id()%>">
									</form>
								</td>
								<td>
									<button type="button" class="btn btn-danger quit ${bookClub_Regis_DetailVO.brd_status} ${bc_status}"
										data-toggle="modal"
										data-target="#quitModal"
										value="${bookClub_Regis_DetailVO.bc_id}">退出</button>
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
					<h4 class="modal-title" id="exampleModalCenterTitle">確定要退出此讀書會?</h4>
				</div>
				<img src="<%=request.getContextPath()%>/images/bookclub/check.png" style="height:250px">
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
<script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
<script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%= request.getContextPath()%>/js/util.js"></script>
<script src="<%= request.getContextPath()%>/js/main.js"></script>
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

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

	
	$('.3').attr("disabled", true);
	$('.4').attr("disabled", true);
	$('.chatpic').on('click',function(){
		$(this).next().click();
	});
</script>

</html>