<%@page import="com.mem.model.*"%>
<%@page import="com.bookclub.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/myBookClub.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<body>


	<jsp:include page="/front-end/header/header.jsp" />
	


	<div class="container">
		<div class="row" id="container">
			<div class="col-12">
				<div style="color: black; font-size: 40px; margin-top: 30px"><b>我創建的讀書會</b></div>


				<!------------------------------------------------ 表頭 ------------------------------------------->
				<table class="table reviewBody text-center table-striped">
					<thead class="thead-light">
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
									<button type="submit" class="update-button">修改讀書會</button>
										<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0">
										<button type="submit" class="reviewGroupBtn btn btn-info"
											name="action" value="getOne_For_Display">詳情</button>
										<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
									</form>
								</td>
								<td>
									<form
										action="<%=request.getContextPath()%>/front-end/bookclub/bookclub.do"
										class="m-0" id="myBookClubimg">
										<button type="submit" class="btn chat" name="action"
											value="bookClubChat" style="border: none">
											<img
												src="<%=request.getContextPath()%>/images/bookclub/chat.png">
										</button>
										<input type="hidden" name="bc_id" value="${bookClubVO.bc_id}">
										<input type="hidden" name="mem_id" value="<%=memVO.getMem_id()%>">
									</form>
								</td>
							</tr>
						</c:forEach>
						<!------------------------------------------------ 滾出資料 ------------------------------------------>
										 
					</tbody>

				</table>
			</div>
		</div>
	</div>

	<!------------------------------------------------ bootstrap.js --------------------------------------------->
	<jsp:include page="/front-end/footer/footer.jsp" />
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%= request.getContextPath()%>/js/util.js"></script>
    <script src="<%= request.getContextPath()%>/js/main.js"></script>
</body>
</html>