<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.categorie.model.*"%>

<%
	CategorieService categorieService = new CategorieService();
List<CategorieVO> list = categorieService.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有類別資料 - listAllCategorie.jsp</title>

<style>
</style>
</head>

</html>
<body>
<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>所有類別資料 - listAllCategorie.jsp</h3>
			<h4>
				<a href="select_page.jsp">回首頁</a>
			</h4>
		</td>
	</tr>
</table>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>類別編號</th>
		<th>類別名稱</th>
		<th>修改</th>
		<th>刪除</th>
			</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="categorieVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${categorieVO.lc_class_id}</td>
			<td>${categorieVO.lc_class_name}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/categorie/categorie.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="lc_class_id"  value="${categorieVO.lc_class_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/categorie/categorie.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="lc_class_id"  value="${categorieVO.lc_class_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
	</table>
<%@ include file="page2.file" %>
</body>
</html>