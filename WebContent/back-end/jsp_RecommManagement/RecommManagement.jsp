<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>


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
<title>推薦系統管理</title>
</head>
<body>
	<%@include file="/back-end/header/header.jsp"%>
	<div id="container">
		<main id="center" class="column">
			<h1>推薦系統管理</h1>
			<!-- Table - Hoverable rows -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">KeyName</th>
						<th scope="col">Size</th>
						<th scope="col">TTL (sec)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="recommKey" items="${recommKeys}">
						<tr>
							<td>
								<a href='${pageContext.request.contextPath}/ShowRecommKeyDetails?keyName=${recommKey.keyName}'>${recommKey.keyName}</a>
							</td>
							<td>${recommKey.size}</td>
							<td>${recommKey.ttl}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
		<%@include file="/back-end/sidebar/sidebar.jsp"%>
	</div>
</body>
</html>