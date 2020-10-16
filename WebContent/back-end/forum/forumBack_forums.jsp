<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.Far.model.*"%>
<%@ page import="com.Fmr.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.admins.model.*"%>
<%@ page import="java.util.*"%>

<%
	FarService farSvc = new FarService();
	List<FarVO> list = farSvc.getAllJundge();
	pageContext.setAttribute("list", list);
	
	String admin_id = (String)session.getAttribute("admin_id");
	String admin_name= (String)session.getAttribute("admin_name");
	AdminsService admSvc = new AdminsService();
	AdminsVO adminsVO = admSvc.getOneAdmin(admin_id);
    session.setAttribute("adminsVO", adminsVO);    
%>

<jsp:useBean id="faSvc" scope="page" class="com.Fa.model.FaService" />
<jsp:useBean id="fmSvc" scope="page" class="com.Fm.model.FmService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />


<!DOCTYPE html>
<html>

<head>
<meta name="name" content="content" charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main-back.css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style>
html {
	margin-left: 250px;
	margin-top: 50px;
}

#center {
	margin: 50px auto;
}

#center .row div {
	border: solid 1px;
	height: 50px;
}

.title {
	margin-top: 20px;
}

.modal-dialog {
	top: 180px;
}
</style>
</head>

<body>
	<!-- header -->
	<jsp:include page="/back-end/header/header.jsp" />

	<div id="container">

		<main id="center" class="column">
			<select class="mdb-select md-form colorful-select dropdown-primary"
				onChange="location = this.options[this.selectedIndex].value;">
				<option selected>請選擇</option>
				<option
					value="<%=request.getContextPath()%>/back-end/forum/forumBack_forums.jsp">文章檢舉</option>
				<option
					value="<%=request.getContextPath()%>/back-end/forum/forumBack_messages.jsp">留言檢舉</option>
			</select>

			<div class="title">
				<h2>文章檢舉</h2>
			</div>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">檢舉會員</th>
						<th scope="col">文章內容</th>
						<th scope="col">檢舉原因</th>
						<th scope="col">檢舉時間</th>
						<th scope="col">是否通過</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="farVO" items="${list}" varStatus="vs">

						<c:if test="${faSvc.getOneFa(farVO.faId).faStatus == 0}">
							<tr>
								<th scope="row">${memSvc.getOneMem(farVO.memId).mem_name}</th>
								<td><button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#exampleModal_1${vs.index}">文章詳情</button></td>
								<td><button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#exampleModal${vs.index}">檢舉原因</button></td>


								<td><fmt:formatDate value="${farVO.farDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<form method="post"
									action="<%=request.getContextPath()%>/back-end/forum/far.do">
								<td><select name="farStatus">
										<option value="0"></option>
										<option value="1">通過</option>
										<option value="2">不通過</option>
								</select></td>
								<td><input type="submit"> <input type="hidden"
									name="action" value="judge"> <input type="hidden"
									name="farId" value="${farVO.farId}"> <input
									type="hidden" name="faId" value="${farVO.faId}"> <input
									type="hidden" name="adminId" value="${adminsVO.admin_id}"></td>
									${adminsVO.admin_id}ddd
								</form>
							</tr>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal_1${vs.index}"
								tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">${faSvc.getOneFa(farVO.faId).faTopic}</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">${faSvc.getOneFa(farVO.faId).faContent}</div>

									</div>
								</div>
							</div>
							<!-- Modal -->
							<!-- Modal -->
							<div class="modal fade" id="exampleModal${vs.index}"
								tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">${farVO.farContent}</div>

									</div>
								</div>
							</div>
							<!-- Modal -->


						</c:if>
					</c:forEach>

				</tbody>
			</table>
			</form>

		</main>
	</div>

	<jsp:include page="/back-end/sidebar/sidebar.jsp" />

</body>

</html>