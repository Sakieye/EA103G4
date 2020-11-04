<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.signup.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	LectureVO lectureVO = (LectureVO) request.getAttribute("lectureVO");
	pageContext.setAttribute("lectureVO", lectureVO);
%>
<%
	SignupVO signupVO = (SignupVO) request.getAttribute("signupVO");
%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
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
			</tr>
			<tr>
			<th>會員名稱 : </th><td>${memVO.mem_name}</td>
			</tr>
			<tr>
			<th>講座地點 : </th><td>${lectureVO.lc_place}</td>
			</tr>
			<tr>
			<th>講座時間 : </th><td>${lectureVO.lc_time}</td>
			</tr>
			<tr>
			<th>講座時數 : </th><td>${lectureVO.lc_hr} hr</td>
			</tr>
			<tr>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/signup/signup.do">
			<input type="submit" value="報名">
			<input type="hidden" name="lc_id" value="${lectureVO.lc_id}"/>
			<input type="hidden" name="mem_id" value="${memVO.mem_id}"/>
			<input type="hidden" name="action" value="insert">
			</FORM>
			<input type="submit" value="取消" href="<%=request.getContextPath()%>/front-end/lecture/lecture_index.jsp">
			
		</tr>
	</table>

</body>
</html>