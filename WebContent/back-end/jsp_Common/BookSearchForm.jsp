<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.category.model.*"%>

<div class="form-row">
	<div class="col-md-2">
		<label for="bookName">書名</label> 
		<input type="text" class="form-control" id="bookName" name="bookName" value='${param.bookName}'>
	</div>
	<div class="col-md-2">
		<label for="author">作者</label> 
		<input type="text" class="form-control" id="author" name="author" value='${param.author}'>
	</div>
	<div class="col-md-2">
		<label for="publisherName">出版社名稱</label> 
		<input type="text" class="form-control" id="publisherName" name="publisherName" value='${param.publisherName}'>
	</div>
	<div class="col-md-2">
		<label for="isbn">ISBN(精準)</label> <input type="text" class="form-control" id="isbn" name="isbn" value='${param.isbn}'>
	</div>
	<div class="col-md-1">
		<label for="realPriceMin">售價(最低)</label> 
		<input type="number" class="form-control" id="realPriceMin" name="realPriceMin" min="0" value='${param.realPriceMin}'>
	</div>
	<div class="col-md-1">
		<label for="number">售價(最高)</label> 
		<input type="number" class="form-control" min="0" id="realPriceMax" name="realPriceMax" min="0" value='${param.realPriceMax}'>
	</div>
	<div class="col-md-1">
		<label for="discountMin">折扣(下限)</label> 
		<input type="number" class="form-control" id="discountMin" name="discountMin" min="0" max="100" value='${param.discountMin}' placeholder="0">
	</div>
	<div class="col-md-1">
		<label for="discountMax">折扣(上限)</label> 
		<input type="number" class="form-control" id="discountMax" name="discountMax" min="0" max="100" value='${param.discountMax}'placeholder="100">
	</div>
</div>
<div class="form-row">
	<div class="col-md-1">
		<label for="isSold">上架狀態</label> <select name="isSold" id="isSold" class="form-control" name="isSold" value='${param.isSold}'>
			<option></option>
			<option value="0">下架</option>
			<option value="1">上架</option>
		</select>
	</div>
	<div class="col-md-2">
		<label for="publicationDateMin">出版日期(最早)</label> 
		<input type="date" class="form-control" id="publicationDateMin" name="publicationDateMin" value='${param.publicationDateMin}'>
	</div>
	<div class="col-md-2">
		<label for="publicationDateMax">出版日期(最晚)</label> <input type="date" class="form-control" id="publicationDateMax" name="publicationDateMax" value='${param.publicationDateMax}'>
	</div>
	<div class="col-md-3">
		<label for="categoryID">商品類別</label> <select name="categoryID" id="categoryID" class="form-control">
			<option></option>
			<c:forEach var="category" items="${categories}">
				<option value="${category.categoryID}">${category.categoryName}</option>
			</c:forEach>
		</select>
	</div>
	<input type="hidden" name="action" value="getAdvSearch">
	<div class="col-md-2">
	   <button class="btn btn-primary" type="submit" style="position: absolute; bottom: 0;">送出查詢</button>
	</div>
</div>
