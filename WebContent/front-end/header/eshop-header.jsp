<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.category.model.*"%>

<%
	CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
	Map<String, List<Category>> catMap = categoryService.getCategoryTree();
	List<Category> firstLevelCats = catMap.get(null);
	pageContext.setAttribute("firstLevelCats", firstLevelCats);
%>

<!--Logo-->
<a href="${pageContext.request.contextPath}/front-end/bookshop-eshop/index.jsp" style="padding-left: 17.2vw;">
	<img src="${pageContext.request.contextPath}/BookShopLogo/eshop-header.png">
</a>
<!--Product Categories Menu-->
<div class="categories-menu" id="categories-menu">
	<ul class="sm sm-clean smart-menu" id="categories-menu-first-ul">
		<li>
			<a href="#" id="categories-menu-first-a">書籍分類</a>
			<ul>
				<c:forEach var="firstLvCat" items="${firstLevelCats}">
					<li>
						<a href="${pageContext.request.contextPath}/Search?categoryID=${firstLvCat.categoryID}">${firstLvCat.categoryName}</a>
						<%
							Category firstLvCat = (Category) pageContext.getAttribute("firstLvCat");
							List<Category> secondLevelCats = catMap.get(firstLvCat.getCategoryID());
							pageContext.setAttribute("secondLevelCats", secondLevelCats);
						%>
						<c:if test="${not empty secondLevelCats}">
							<ul>
								<c:forEach var="secondLvCat" items="${secondLevelCats}">
									<li>
										<a href="${pageContext.request.contextPath}/Search?categoryID=${secondLvCat.categoryID}">${secondLvCat.categoryName}</a>
										<%
											Category secondLvCat = (Category) pageContext.getAttribute("secondLvCat");
											List<Category> thirdLevelCats = catMap.get(secondLvCat.getCategoryID());
											pageContext.setAttribute("thirdLevelCats", thirdLevelCats);
										%>
										<c:if test="${not empty thirdLevelCats}">
										<ul>
										     <c:forEach var="thirdLvCat" items="${thirdLevelCats}">
										         <li>
										             <a href="${pageContext.request.contextPath}/Search?categoryID=${thirdLvCat.categoryID}">${thirdLvCat.categoryName}</a>
										         </li>
										     </c:forEach>
										</ul>
										</c:if>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</li>
	</ul>
</div>
<!--End of Product Categories Menu-->
<!--Search-->
<div class="search-bar col-md-2">
    <input type="text" id="normal-search-bookName" name="bookName" placeholder="搜尋書名" class="form-control">
</div>
<!--Advanced Search-->
<div class="search-bar advanced-search col-md-1">
    <button id="search-toggle" type="button" class="btn btn-light dropdown" tabindex="-1" aria-expanded="false" aria-haspopup="true">
        <span>進階搜尋&nbsp;</span>
        <i class="fas fa-angle-down"></i>
    </button>
</div>
<!--Advanced Search Form-->
<div class="advanced-search-form">
    <form method='post' action='<%=request.getContextPath()%>/Search'>
        <div class="row advanced-search-form-row">
            <label for="bookName" class="col-form-label">書名&emsp;&emsp;&emsp;</label>
            <div>
                <input type="text" id="bookName" name="bookName">
            </div>
        </div>
        <div class="row advanced-search-form-row">
            <label for="author" class="col-form-label">作者&emsp;&emsp;&emsp;</label>
            <div>
                <input type="text" id="author" name="author">
            </div>
        </div>
        <div class="row advanced-search-form-row">
            <label for="publisherName" class="col-form-label">出版社名稱</label>
            <div>
                <input type="text" id="publisherName" name="publisherName">
            </div>
        </div>
        <div class="row advanced-search-form-row">
            <label for="realPriceMin" class="col-form-label">售價&emsp;&emsp;&emsp;</label>
            <div>
                <input type="number" id="realPriceMin" min="0" class="numberInput" name="realPriceMin">
            </div>
            <span>到</span>
            <div>
                <input type="number" id="realPriceMax" min="0" class="numberInput" name="realPriceMax">
            </div>
            <span>之間</span>
        </div>
        <div class="row advanced-search-form-row">
            <label for="discountMin" class="col-form-label">折扣％數&emsp;</label>
            <div>
                <input type="number" id="discountMin" min="0" max="100" class="numberInput" name="discountMin">
            </div>
            <span>到</span>
            <div>
                <input type="number" id="discountMax" min="0" max="100" class="numberInput" name="discountMax">
            </div>
            <span>之間</span>
        </div>
        <div class="row">
            <label for="publicationDateMin" class="col-form-label">出版日期&emsp;</label>
            <div>
                <input type="date" id="publicationDateMin" min="0" max="100" class="form-control" name="publicationDateMin">
            </div>
            <span>到</span>
            <div>
                <input type="date" id="publicationDateMax" min="0" max="100" class="date-row2 form-control" name="publicationDateMax">
            </div>
            <span style="padding-left: 8.5em">之間</span>
        </div>
        <input type="hidden" name="action" value="getAdvSearch">
        <div class="col-md-12">
            <br>
            <br>
            <br>
            <button id="submitAdvSearch" class="btn btn-primary" type="submit" style="position: absolute; bottom: 0;">送出查詢</button>
        </div>
    </form>
</div>
<!--Search Icon-->
<div class="search-bar search-icon col-md-1">
    <button id="normal-search-icon" class="search-btn">
        <i class="fas fa-search"></i>
    </button>
</div>