<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.category.model.*"%>
<%@ page import="com.publishers.model.*"%>
<%@ page import="com.language.model.*"%>
<%
CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
LanguageService languageService = (LanguageService) getServletContext().getAttribute("languageService");
%>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 自訂css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>新增商品(單筆)</title>
</head>

<body>
    <!--表單內容-->
    <main class="col-md-12" style="margin:0 auto;">
        <h1 style="display: inline;">新增商品</h1>
        <div style="position: relative; left:83em; display: inline;"><a href="${pageContext.request.contextPath}/BookManagement">返回商品上下架管理</a></div>
        <form action="${pageContext.request.contextPath}/AddOneBook" enctype="multipart/form-data" method="post">
            <div class="form-row" style="padding-bottom:10px;">
                <div class="col-md-4">
                    <label for="bookName" class="control-label">書名</label>
                    <input type="text" class="form-control" id="bookName" name="bookName" value='${param.bookName}' required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-2">
                    <label for="isbn" class="control-label">ISBN</label>
                    <input id="isbn" name="isbn" type="text" class="form-control" name="isbn" value='${param.isbn}' maxlength="13">
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-3">
                    <label for="publisherName" class="control-label">出版社名稱(完整)</label>
                    <input type="text" class="form-control" id="publisherName" name="publisherName" value='${param.publisherName}' required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-3">
                    <label for="author" class="control-label">作者</label>
                    <input type="text" class="form-control" id="author" name="author" value='${param.author}' required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-row" style="padding-bottom:10px;">
                <div class="col-md-4">
                    <label for="bookNameOriginal" class="control-label">書名原文</label>
                    <input type="text" class="form-control" id="bookNameOriginal" name="bookNameOriginal" value='${param.bookNameOriginal}'>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-1">
                    <label for="listPrice" class="control-label">定價</label>
                    <input type="number" class="form-control" id="listPrice" name="listPrice" value='${param.listPrice}' min="0" required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-1">
                    <label for="salePrice" class="control-label">預設售價</label>
                    <input type="number" class="form-control" id="salePrice" name="salePrice" value='${param.salePrice}' min="0" required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-1">
                    <label for="bookBP" class="control-label">紅利點數</label>
                    <input type="number" class="form-control" id="bookBP" name="bookBP" value='${param.bookBP}' min="0" required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-1">
                    <label for="isSold">上架狀態</label>
                    <select name="isSold" id="isSold" class="form-control" name="isSold" value='${param.isSold}'>
                        <option value="1">上架</option>
                        <option value="0">下架</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label for="publicationDate">出版日期</label>
                    <input type="date" class="form-control" id="publicationDate" name="publicationDate" value='${param.publicationDate}'>
                </div>
                <div class="col-md-1">
                    <label for="stock" class="control-label">庫存量</label>
                    <input type="number" class="form-control" id="stock" name="stock" value='${param.stock}' min="0" required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-1">
                    <label for="safetyStock" class="control-label">安全庫存量</label>
                    <input type="number" class="form-control" id="safetyStock" name="safetyStock" value='${param.safetyStock}' min="0" required>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-row" style="padding-bottom:10px;">
                <div class="col-md-4">
                    <label for="category">商品分類</label>
                    <select name="category" id="category" class="form-control" name="category" required>
                        <c:forEach var="categoryVO" items="${categoryService.all}">
                            <option value="${categoryVO.categoryID}">${categoryVO.categoryName}</option>
                        </c:forEach>
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="col-md-2">
                    <label for="language">語言</label>
                    <select name="language" id="language" class="form-control" name="language">
                        <c:forEach var="lan" items="${languageService.all}">
                            <option value="${lan.language_ID}">${lan.language_Name}</option>
                        </c:forEach>
                        <option value="">不指定</option>
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
                
            </div>
            <div class="form-group">
                <label for="bookIntro">書籍簡介</label>
                <textarea class="form-control" id="bookIntro" rows="20" name="bookIntro" required>${param.bookIntro}</textarea>
                <div class="help-block with-errors"></div>
            </div>
            <%-- 錯誤表列 --%>
			<%@include file="/back-end/jsp_Common/ErrorMsgs.jsp" %>
            <input type="submit" value="確認送出" class="btn btn-danger btn-block" />
        </form>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>