<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promo.model.*"%>

<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-back.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" integrity="sha512-bYPO5jmStZ9WI2602V2zaivdAnbAhtfzmxnEGh9RwtlI00I9s8ulGe4oBa5XxiC6tCITJH/QG70jswBhbLkxPw==" crossorigin="anonymous" />

<title>促銷事件管理</title>
</head>

<body>
	<%@include file="/back-end/header/header.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<!-- search form -->
			<form method='post' action='${pageContext.request.contextPath}/PromoManagement'>
				<%@include file="/back-end/jsp_Common/PromoForm.jsp"%>
				<input type="hidden" name="action" value="getAdvSearch">
				<button class="btn btn-primary" type="submit">送出查詢</button>
				<button type="button" class="btn btn-primary" id="AddPromo" onclick="javascript:location.href='${pageContext.request.contextPath}/AddPromo'">新增促銷事件</button>
			</form>
			<!-- Table - Hoverable rows -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">促銷事件編號</th>
						<th scope="col">促銷事件名稱</th>
						<th scope="col">起始時間</th>
						<th scope="col">終止時間</th>
						<th scope="col">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						//若是未查詢，會是空List或是前一次搜尋結果
						List<Promo> promotions = (ArrayList<Promo>) request.getAttribute("promotions");
						session.setAttribute("promotions", promotions);
					%>
					<c:choose>
						<c:when test="${not empty promotions}">
							<%@ include file='/back-end/pages_PromoManagement/page1.file'%><%-- 查詢筆數和現在頁數的顯示 --%>
							<c:forEach var="promo" items="${promotions}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<tr>
									<td>${promo.promoID}</td>
									<td>
									   ${promo.promoName}
									   <c:if test="${promo.isValid()}">
									       <p>effective</p>
									   </c:if>
									</td>
									<td>
										<fmt:formatDate value="${promo.promoStartTime}" pattern="yyyy-MM-dd HH:mm" />
									</td>
									<td>
										<fmt:formatDate value="${promo.promoEndTime}" pattern="yyyy-MM-dd HH:mm" />
									</td>
									<td>
										<form METHOD="get" action="${pageContext.request.contextPath}/UpdatePromo" style="margin-bottom: 0px; display: inline;" target="_blank">
											<input type="hidden" name="promoID" value="${promo.promoID}">
											<input type="submit" value="編輯">
										</form>
										<form METHOD="get" action="${pageContext.request.contextPath}/ShowPromoDetails" style="margin-bottom: 0px; display: inline;" target="_blank">
											<input type="hidden" name="promoID" value="${promo.promoID}">
											<input type="submit" value="查看/修改明細">
										</form>
										<form METHOD="get" action="${pageContext.request.contextPath}/AddPromoDetails" style="margin-bottom: 0px; display: inline;" target="_blank">
											<input type="hidden" name="promoID" value="${promo.promoID}">
											<input type="submit" value="新增明細">
										</form>
									</td>
								</tr>
							</c:forEach>
							<%@ include file="/back-end/pages_PromoManagement/page2.file"%>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous"></script>
	<script>
		$('#promoStartTime').datetimepicker({
			timepicker : true,
			datepicker : true,
			format : 'Y-m-d H:i',
			hours12 : false,
			step : 30,
		})

		$('#promoEndTime').datetimepicker({
			timepicker : true,
			datepicker : true,
			format : 'Y-m-d H:i',
			hours12 : false,
			step : 30,
		})
	</script>
</body>

</html>