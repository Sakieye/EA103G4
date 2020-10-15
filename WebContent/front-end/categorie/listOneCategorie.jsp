<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.categorie.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  CategorieVO categorieVO = (CategorieVO) request.getAttribute("categorieVO"); //CategorieServlet.java(Concroller), 存入req的categorieVO物件
%>

<html>
<head>
<title>類別資料 - listOneCategorie.jsp</title>

<style>

</style>

</head>
<body>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneCategorie.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>類別編號</th>
		<th>類別名稱</th>
	</tr>
	<tr>
		<td><%=categorieVO.getLc_class_id()%></td>
		<td><%=categorieVO.getLc_class_name()%></td>
	</tr>
</table>

</body>
</html>