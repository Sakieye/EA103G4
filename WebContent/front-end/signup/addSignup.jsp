<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.signup.model.*"%>

<%
	LectureVO lectureVO = (LectureVO) request.getAttribute("lectureVO");
pageContext.setAttribute("lectureVO", lectureVO);
%>
<%
	SignupVO signupVO = (SignupVO) request.getAttribute("signupVO");
%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>

<jsp:useBean id="lectureService1" scope="page" class="com.lecture.model.LectureService" />
	<table>
		<tr>
			<th>講座名稱 : </th><td>${lectureVO.lc_name}</td>
			<th>講座地點 : </th><td>${lectureVO.lc_place}</td>
			<th>講座時間 : </th><td>${lectureVO.lc_time}</td>
			<th>講座時數 : </th><td>${lectureVO.lc_hr}</td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/signup/signup.do">
			<input type="submit" value="報名">
			<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"/>
			<input type="hidden" name="mem_id" value="${memberVO.mem_id}"/>
			<input type="hidden" name="action" value="insert">
			</FORM>
			<input type="submit" value="取消" href="">
			
		</tr>
	</table>

</body>
</html>