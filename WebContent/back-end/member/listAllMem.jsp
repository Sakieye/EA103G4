<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>

<% 
	MemService memSvc = new MemService();
	List<MemVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKSHOP部客匣</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
	html, body{
		width: 100%;
		height: 100%;
	}
	#center.column{
		margin-left: 300px;
	}
	.selectBlock .inputBlock{
		width: 300px;
		border: 1px splid black;
		height: 100px;
		margin-top: 20px;
		display: inline-block;
		margin-left: 20px;
	}
	.selectBlock label{
		display: block;
		font-family: 微軟正黑體;
		font-weight: 700;
		letter-spacing: 1px;
		font-size: 20px;
	}
	.selectBlock .myInput{
		width: 200px;
		height: 40px;
		display: inline-block;
	}
	.selectBlock select{
		font-family: 微軟正黑體;
		width: 200px;
		height: 40px;
		display: inline-block;
		border-color: #DCDCDC;
		border-radius: 5px;
	}
	.selectBlock .myBtn{
		display: inline-block;
		letter-spacing: 1px;
		
	}
	table {
	width: 1500px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	border-collapse: collapse;
	font-size: 13px;
	font-family: 微軟正黑體;
	line-height: 50px;
	font-weight: 700;
  }
  table, th, td {
    border-bottom: 1px solid grey;
    text-align: center;
    padding-bottom: 3px;
    padding-top: 3px;
  }
  
  th{
  	font-size:16px
  }
</style>
</head>
<body>
	<jsp:include page="/back-end/header/header.jsp" />
    <div id="container" >
        <main id="center" class="column">
        	<div class="selectBlock">
        	<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" enctype="multipart/form-data">
        		<div class="inputBlock">			
        			<label>姓名查詢</label>
	        		<input type="text" name="mem_name" class="form-control myInput" />
        		</div>
        		
        		<div class="inputBlock">
        			<label>E-Mail查詢</label>
	        		<input type="text" name="mem_email" class="form-control myInput" />
        		</div>
        		<div class="inputBlock">
        			<label>帳號狀態查詢</label>
	        		<select size="1" name="mem_status">
							<option value="0">正常</option>
							<option value="2">被註銷</option>
					</select>
        		</div>
        		<div class="inputBlock">
        			<label>身分查詢</label>
	        		<select size="1" name="mem_iskol">
							<option value="0">普通會員</option>
							<option value="1">公眾人物</option>
					</select>
					<input type="hidden" name="action" value="listMems">
					<button type="submit" class="btn btn-primary btn-lg myBtn">查詢</button> 	
        		</div>
        	</form>
        			 		
        	</div>
        	
        	<table>
				<tr>
					<th>會員編號</th>
					<th>會員帳號</th>
					<th>姓名</th>
					<th>E-MAIL</th>
					<th>暱稱</th>
					<th>性別</th>
					<th>生日</th>
					<th>地址</th>
					<th>電話</th>
					<th>紅利點數</th>
					<th>會員身分</th>
					<th>經驗值</th>
					<th>帳號狀態</th>
					<th>註冊時間</th>
					<th></th>
					<th></th>
				</tr>
				<%@ include file="page1.file" %>
				<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<tr>
					<td>${memVO.mem_id}</td>
					<td>${memVO.mem_account}</td>
					<td>${memVO.mem_name}</td>
					<td>${memVO.mem_email}</td>
					<td>${memVO.mem_nickname}</td>
					<c:if test="${memVO.mem_sex == 0}">
						<td>女</td>
					</c:if>
					<c:if test="${memVO.mem_sex == 1}">
						<td>男</td>
					</c:if>
					<td>${memVO.mem_birth}</td>
					<td>${memVO.mem_addr}</td>
					<td>${memVO.mem_tel}</td>
			
					<td>${memVO.mem_bonus}</td>
					<c:if test="${memVO.mem_iskol == 0}">
						<td>普通會員</td>
					</c:if>
					<c:if test="${memVO.mem_iskol == 1}">
						<td>公眾人物</td>
					</c:if>
					<td>${memVO.mem_exp}</td>
					<c:if test="${memVO.mem_status == 0}">
						<td style="color: blue;">正常</td>
					</c:if>
					<c:if test="${memVO.mem_status == 2}">
						<td style="color: red;">已註銷</td>
					</c:if>
					<td><fmt:formatDate value="${memVO.mem_cretime}" pattern="yyyy-MM-dd hh:mm"/></td>
					<td>
						<button type="submit" class="btn btn-primary btn-sm" onclick='openWindows("${memVO.mem_id}")' >修改</button>
					</td>
					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" enctype="multipart/form-data">
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
							<input type="hidden" name="mem_bonus" value="${memVO.mem_bonus}" />
							<input type="hidden" name="mem_exp" value="${memVO.mem_exp}" />
							<input type="hidden" name="mem_iskol" value="${memVO.mem_iskol}" />
							<input type="hidden" name="mem_status"  value="2" />			    
						    <input type="hidden" name="mem_id"  value="${memVO.mem_id}" />
						    <input type="hidden" name="action"	value="UpdateStatusDelete" />
						    <button type="submit" class="btn btn-danger btn-sm">註銷</button>
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="page2.file" %>
    </main>
    <jsp:include page="/back-end/sidebar/sidebar.jsp" />
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function openWindows(mem_id){

			window.open("update_mem.jsp?mem_id=" + mem_id ,"Sample","fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no, copyhistory=no,width=500,height=430,left=750,top=150");
		}
	</script>

</body>
</html>