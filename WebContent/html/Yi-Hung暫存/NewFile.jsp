<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.publishers.model.*"%>

<%
PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
List<Publisher> publishers = publisherService.getAll();
System.out.println(publishers.size());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label for="publisher">Choose a browser from this list:</label>
	<input list="${publishers}" id="publisher" name="publisher" />
	<datalist id="${publishers}">
		<c:forEach var="publisher" items="${publishers}">
		   <option value="${publisher.publisherName}">
		</c:forEach>
	</datalist>
</body>
</html>