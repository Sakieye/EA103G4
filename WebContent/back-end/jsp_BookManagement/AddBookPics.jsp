<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 自訂css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<title>新增商品圖片</title>
</head>
<body>
	<h1>商品新增成功，請新增商品預覽圖</h1>
	<form id="updateBookPic" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/UpdateBookPic/${book.bookID}" method="post">
		<div class="form-row" style="padding-bottom: 10px;">
			<div class="col-md-10">
				<label for="file">上傳商品預覽圖</label>
				<input type="file" style="position: relative; left: 0.5em;" id="uploadBookPics" name="uploadBookPics" multiple>
			</div>
		</div>
		<div class="form-row" style="padding-bottom: 10px;">
			<div class="col-md-12">
				<table style="border: 3px #cccccc solid;" 10" border='1'">
					<tbody>
						<tr>
							<td>檔案名稱</td>
							<td>預覽</td>
							<td>操作</td>
						</tr>
						<c:forEach var="bookPic" items="${bookPics}">
							<tr>
								<td>${bookPic.bookPicName}</td>
								<td>
									<div class="col-md-12">
										<img style="display: block;" src="${pageContext.request.contextPath}/ShowBookPic?bookID=${bookPic.bookID}&bookPicName=${bookPic.bookPicName}" />
									</div>
								</td>
								<td>
									<a href="${pageContext.request.contextPath}/DownloadBookPic?bookID=${bookPic.bookID}&bookPicName=${bookPic.bookPicName}">下載</a>
									／
									<a href="${pageContext.request.contextPath}/DeleteBookPic?bookID=${bookPic.bookID}&bookPicName=${bookPic.bookPicName}">刪除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<input type="submit" value="確認送出查看結果" class="btn btn-danger btn-block" />
	</form>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@include file="/back-end/jsp_Common/jquery-popper-bootstrap-js.jsp"%>
	<script>
		$(document).ready(function() {
			let fileArray = [];
			$('input[type = "file"').change(function(e) {
				fileArray.length = 0;
				//you can also add an event for selecting specific file
				$.each(e.target.files, function(index, value) {
					//Add your condition for allowing only specific file

					var fileReader = new FileReader();
					fileReader.readAsDataURL(value);
					fileArray.push(fileReader);

					fileReader.addEventListener('load', function(event) {
						let tr = document.createElement('tr');
						let td1 = document.createElement('td');

						let img = document.createElement('img');
						img.setAttribute('src', event.target.result);

						let td2 = document.createElement('td');
						td2.innerHTML = '<div class="col-md-12"></div>';
						td2.append(img)

						let td3 = document.createElement('td');
						td3.innerText = '請先點選送出後再選擇操作';

						tr.append(td1, td2, td3);
						$('tbody').append(tr);
					});
				}); //finish files for each
			}); //finish inputTag change
		}); // finish ready
	</script>
</body>
</html>