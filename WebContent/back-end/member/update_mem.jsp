<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
	//(Concroller) 存入req的memVO物件 (包括幫忙取出的memVO, 也包括輸入資料錯誤時的memVO物件)
// 	MemVO memVO = (MemVO) request.getAttribute("memVO");
	String mem_id = request.getParameter("mem_id");
	MemService memSvc = new MemService();
	MemVO memVO = memSvc.getOneMem(mem_id);
	pageContext.setAttribute("memVO", memVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台修改資料</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body bgcolor="black">
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" enctype="multipart/form-data">
		<table class="table table-dark">
			<tr>
				<td>會員編號</td>
				<td>${memVO.mem_id}</td>
			</tr>
			<tr>
				<td>會員帳號</td>
				<td>${memVO.mem_account}</td>
			</tr>
			<tr>
				<td>會員姓名</td>
				<td>${memVO.mem_name}</td>
			</tr>
			<tr>
				<td>紅利餘額</td>
				<td><input type="text" name="mem_bonus" size="10" value="${memVO.mem_bonus}" /></td>
			</tr>
			<tr>
				<td>經驗值</td>
				<td><input type="text" name="mem_exp" size="10" value="${memVO.mem_exp}" /></td>
			</tr>
			<tr>
				<td>身分</td>
				<c:if test="${memVO.mem_iskol == 0}">
					<td>
						<select size="1" name="mem_iskol">
							<option value="0">普通會員</option>
							<option value="1">公眾人物</option>
						</select>
					</td>
				</c:if>
				<c:if test="${memVO.mem_iskol == 1}">
					<td>
						<select size="1" name="mem_iskol">
							<option value="0">普通會員</option>
							<option value="1">公眾人物</option>
						</select>
					</td>
				</c:if>
			</tr>			
		</table>
		<input type="hidden" name="action" value="update_fromBack" />
		<input type="hidden" name="mem_account" value="${memVO.mem_account}" />
		<input type="hidden" name="mem_password" value="${memVO.mem_password}" />
		<input type="hidden" name="mem_name" value="${memVO.mem_name}" />
		<input type="hidden" name="mem_email" value="${memVO.mem_email}" />
		<input type="hidden" name="mem_nickname" value="${memVO.mem_nickname}" />
		<input type="hidden" name="mem_sex" value="${memVO.mem_sex}" />
		<input type="hidden" name="mem_birth" value="${memVO.mem_birth}" />
		<input type="hidden" name="mem_addr" value="${memVO.mem_addr}" />
		<input type="hidden" name="mem_tel" value="${memVO.mem_tel}" />
		<input type="hidden" name="mem_pic" value="${memVO.mem_pic}" />
		<input type="hidden" name="mem_status" value="${memVO.mem_status}" />
		<input type="hidden" name="mem_id" value="${memVO.mem_id}" />
		<button type="submit" class="btn btn-secondary btn-lg btn-block" >送出修改</button>
		<button type="submit" class="btn btn-secondary btn-lg btn-block" onclick="window.close();" >Close</button>
	</FORM>
</body>
</html>