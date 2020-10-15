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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>編輯商品圖片</title>
</head>
<body>
    <main class="col-md-12" style="margin:0 auto;">
        <h1 style="display: inline;">上傳商品預覽圖</h1>
        <a href="${pageContext.request.contextPath}/BookUpdateOne?bookID=${bookID}" style="position: relative; left:76em; display: inline;">返回商品編輯頁面</a>
	    <p></p>
	    <form id="updateBookPic" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/UpdateBookPic?bookID=${bookID}" method="post"> 
			<div class="form-row col-md-10" style="padding-bottom:10px;">
			   <input type="file" style="position: relative; left:0.5em;" id="uploadBookPics" name="uploadBookPics" multiple>
			</div>
			<div class="form-row col-md-10" style="padding-bottom:10px;">
				<table style="border:3px #cccccc solid;" border='1'>
				    <tbody>
				        <tr>
				            <td>檔案名稱</td>
				            <td>預覽</td>
				            <td>操作</td>
				        </tr>
				        <c:forEach var="bookPic" items="${bookPics}">
				            <tr>
				                <td>${bookPic.bookPicName}</td>
				                <td><div class="col-md-12"><img style="display:block;" src="${pageContext.request.contextPath}/ShowBookPic?bookID=${bookPic.bookID}&bookPicName=${bookPic.bookPicName}"/></div></td>
				                <td><a href="${pageContext.request.contextPath}/DownloadBookPic?bookID=${bookPic.bookID}&bookPicName=${bookPic.bookPicName}">下載</a>／<a href="${pageContext.request.contextPath}/DeleteBookPic?bookID=${bookPic.bookID}&bookPicName=${bookPic.bookPicName}">刪除</a></td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
	        </div>
	        <div class="form-row col-md-12" style="padding-bottom:10px;">
	            <input type="submit" value="確認送出查看結果" class="btn btn-danger btn-block" />
	        </div>
	    </form>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
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