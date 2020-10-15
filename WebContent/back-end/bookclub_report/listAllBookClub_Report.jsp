<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bookclub_report.model.*"%>
<%@ page import="com.bookclub.model.*"%>


<%
	BookClub_ReportService bookClub_ReportSvc = new BookClub_ReportService();
	List<BookClub_ReportVO> list = bookClub_ReportSvc.getAll();
	pageContext.setAttribute("list", list);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT ALL PAGE</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert.css">
<style>
.cover {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/back-end/header/header.jsp" />
	<jsp:useBean id="bookClubSvc" class="com.bookclub.model.BookClubService" />
	<div id="container">
		<main id="center" class="column">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 ">
						<h1>讀書會檢舉清單</h1>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>讀書會檢舉編號</th>
									<th>會員編號</th>
									<th>讀書會編號</th>
									<th>檢舉理由</th>
									<th>檢舉圖片</th>
									<th>讀書會狀態</th>
									<th>讀書會檢舉狀態</th>
									<th>檢舉時間</th>
									<th>查看讀書會</th>
									<th>通過</th>
									<th>不通過</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bookClub_ReportVO" items="${list}">
									<tr>
										<td>${bookClub_ReportVO.bcr_id}</td>
										<td>${bookClub_ReportVO.mem_id}</td>
										<td>${bookClub_ReportVO.bc_id}</td>
										<td>${bookClub_ReportVO.bcr_reason}</td>
										<td><img
											src="<%= request.getContextPath()%>/back-end/bookclub_report/bookclub_report.do?getImg=${bookClub_ReportVO.bcr_id}"
											class="cover"></td>
										<c:set var='bc_status' value='${bookClubSvc.getOneBookClub(bookClub_ReportVO.bc_id).bc_status}'/>
										<td>${bcStatus[bc_status]}</td>
										<td>${bcrStatus[bookClub_ReportVO.bcr_status]}</td>
										<td><fmt:formatDate value="${bookClub_ReportVO.bcr_date}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td><form
												action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
												class="m-0">
												<button type="submit" class="reviewGroupBtn btn btn-info"
													name="action" value="getOne_For_Display">詳情</button>
												<input type="hidden" name="bc_id"
													value="${bookClub_ReportVO.bc_id}">
											</form></td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/back-end/bookclub_report/bookclub_report.do"
												style="margin-bottom: 0px;">
												<input type="submit" value="通過" class="btn btn-secondary ${bookClubSvc.getOneBookClub(bookClub_ReportVO.bc_id).bc_status}">
												<input type="hidden" name="bcr_id"
													value="${bookClub_ReportVO.bcr_id}"> <input
													type="hidden" name="bc_id"
													value="${bookClub_ReportVO.bc_id}"> <input
													type="hidden" name="action" value="pass">
											</FORM>
										</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/back-end/bookclub_report/bookclub_report.do"
												style="margin-bottom: 0px;">
												<button type="submit" class="btn btn-danger ${bookClubSvc.getOneBookClub(bookClub_ReportVO.bc_id).bc_status}" >不通過</button>
<!-- 												<input type="submit" value="不通過" class="btn btn-danger" -->
<%-- 													id="${bookClubSvc.getOneBookClub(bookClub_ReportVO.bc_id).bc_status}"> --%>
												<input type="hidden" name="bcr_id"
													value="${bookClub_ReportVO.bcr_id}"> <input
													type="hidden" name="bc_id"
													value="${bookClub_ReportVO.bc_id}"> <input
													type="hidden" name="action" value="fail">
											</FORM>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="/back-end/sidebar/sidebar.jsp" />
	</div>
	<script src="<%=request.getContextPath()%>/js/sweetAlert2 9.5.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script>
// 	===========================已被檢舉成功，按鈕disabled，重複檢舉的不需再被審核=====================================
		$(".2").attr("disabled", "disabled");
//	===========================已被檢舉成功，按鈕disabled，重複檢舉的不需再被審核=====================================
// 	===========================檢舉通過SweetAlert====================================
	<c:if test="${not empty situation.report}">
		swal.fire({
			icon : 'success',
			title : 'YEAH',
			text : "審核成功"
		});
			<%request.removeAttribute("report");%>
		</c:if>
	</script>
</body>
</html>