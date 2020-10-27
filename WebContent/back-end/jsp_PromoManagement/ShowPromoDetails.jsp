<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promo.model.*"%>
<%@ page import="com.promodetail.model.*"%>
<%@ page import="com.book.model.*"%>
<%@ page import="com.publishers.model.*"%>

<%
Promo promo = (Promo) request.getAttribute("promo");
String promoID = promo.getPromoID();
pageContext.setAttribute("promoID", promoID);
List<PromoDetail> promoDetails = (ArrayList<PromoDetail>) request.getAttribute("promoDetails");
List<Book> books = (ArrayList<Book>) request.getAttribute("promoBooks");
PublisherService publisherService = (PublisherService) getServletContext().getAttribute("publisherService");
PromoDetailService promoDetailService = (PromoDetailService) getServletContext().getAttribute("promoDetailService");

//換頁操作需用session紀錄
session.setAttribute("promo", promo);
session.setAttribute("promoDetails", promoDetails);
session.setAttribute("books", books);
%>

<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 自訂css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-back.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManagement.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>查看/修改促銷明細</title>
</head>

<body>
    <!-- header -->
    <%@include file="/back-end/header/header.jsp"%>
    <div id="container">
        <main id="center" class="column">
            <%@include file="/back-end/jsp_Common/PromoInfo.jsp"%>
            <form method='post' action='${pageContext.request.contextPath}/ShowPromoDetails'>
                <div class="form-row">
                    <div class="col-md-2">
                        <label for="discount">設定統一的折扣百分比</label>
                        <input type="number" class="form-control" id="discount" name="discount" min="0" max="99" required>
                    </div>
                    <div class="col-md-2">
                        <label for="bpPercent">設定統一的紅利百分比</label>
                        <input type="number" class="form-control" id="bpPercent" name="bpPercent" min="0" max="99" required>
                    </div>
                    <input type="hidden" name="promoID" value="${promo.promoID}">
                    <input type="hidden" name="action" value="UpdatePromoDetails">
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-danger" id="UpdateAllPromoDetails" style="position: absolute; bottom: 0;">確認對全體更改</button>
                    </div>
                    <div class="col-md-3" style="position: relative;left:-5.5em">
                        <button type="button" class="btn btn-danger" id="RemoveFromPromo" style="position: absolute; bottom: 0;">將已選商品移出此促銷事件</button>
                    </div>
                    <div class="col-md-3" style="position: relative;left:-13.5em">
                        <button type="button" class="btn btn-danger" id="RemoveAllFromPromo" style="position: absolute; bottom: 0;" onclick="location.href='${pageContext.request.contextPath}/ShowPromoDetails?action=RemoveAllFromPromo&promoID=${promo.promoID}'">將所有商品移出此促銷事件</button>
                    </div>
                    <span style="float:right; font-size:12px">
                        <br>
                        *百分比是以定價為基準，若設定折扣百分比10%、紅利百分比10%，即能以定價90%的價格購買此商品，並獲得同等於定價10%的紅利於下次使用<br>
                        *若設定的紅利百分比過低，導致促銷紅利低於預設紅利，則使用者看到的紅利回饋以最高者為主<br>
                        *折扣百分比同上，若導致促銷售價高於預設售價，則以預設售價為主<br>
                        *若同時有其他促銷事件作用在同一商品上，會以折扣百分比最高的促銷事件為主，故顯示的促銷售價和促銷紅利可能和本促銷事件的設定百分比不同<br>
                        *網站從每天0時開始每30分鐘刷新一次促銷事件，本次設定可能在幾分鐘後才更改商品促銷售價、紅利<br>
                    </span>
                </div>
            </form>
            <!-- Table - Hoverable rows -->
            <table class="table table-hover">
                <%@ include file='/back-end/jsp_Common/PromoDetailTableHead.jsp' %>
                <tbody>
                    <c:if test="${not empty books}">
                        <%@ include file='/back-end/pages_BookManagement/page1.file' %>
	                    <c:forEach var="book" items="${books}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		                    <%  
                                Book book = (Book) pageContext.getAttribute("book");
		                        String bookID = book.getBookID();
                                String publisherName = publisherService.getOnePublisher(book.getPublisherID()).getPublisher_Name();
                                Optional<PromoDetail> pd = promoDetailService.getByPromoIDAndBookID(promoID, bookID);

                                PromoDetail promoDetail = null;
                                if (pd.isPresent()){
                                	promoDetail = pd.get();
                                	//設定回pageContext，jstl判斷式才取得到值
                                	pageContext.setAttribute("promoDetail", promoDetail);
                                }
                            %> 
		                    <tr>
		                        <td><input type="checkbox" value="${book.bookID}"></td>
		                        <td><a href="${pageContext.request.contextPath}/Shopping.html?book_id=${book.bookID}">${book.bookName}</a>
		                            <p>${book.bookNameOriginal}</p>
		                        </td>
		                        <td>${book.author}</td>
		                        <td><%=publisherName%></td>
		                        <td>${book.listPrice}</td>
		                        <td>${book.salePrice}</td>
		                        <td>${book.salePricePromo eq Double.NaN ? "" : book.salePricePromo}
                                    <p>${promoDetail eq null ? "" : promoDetail.discount}</p>
		                        </td>
		                        <td>${book.bookBP}</td>
		                        <td>${book.bookBPPromo eq Double.NaN ? "" : book.bookBPPromo}
                                    <p>${promoDetail eq null ? "" : promoDetail.bpPercent}</p>
		                        </td>
		                        <td>${book.isSold eq 1 ? "上架" : "下架"}</td>
		                        <c:choose>
                                     <c:when test="${book.stock < book.safetyStock}">
                                         <td style="color:red;">${book.stock}<br>庫存不足</td>
                                     </c:when>
                                     <c:otherwise>
                                         <td>${book.stock}</td>
                                     </c:otherwise>
                                </c:choose>
		                        <td>
									<FORM METHOD="get" action="${pageContext.request.contextPath}/UpdatePromoDetail" style="margin-bottom: 0px;" target="_blank">
									    <input type="hidden" name="promoID" value="<%=promoID%>">
									    <input type="hidden" name="bookID" value="${book.bookID}">
									    <input type="submit" value="編輯">
									</FORM>
		                        </td>
		                    </tr>
	                    </c:forEach>
	                    <%@ include file="/back-end/pages_BookManagement/page2.file" %>
                    </c:if>
                </tbody>
            </table>
        </main>
        <%@include file="/back-end/sidebar/sidebar.jsp" %>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            //註冊全選按鈕click
            $('#select-all').click(function() {
                var checked = this.checked;
                $('input[type="checkbox"]').each(function() {
                    this.checked = checked;
                });
            })

            //註冊移除按鈕click
            $('#RemoveFromPromo').click(function() {
                var bookList = "0";
                $('input[type="checkbox"]').each(function() {
                    if (this.checked === true) {
                        bookList = bookList + "," + this.value;
                    }
                });
                
                $.post('${request.header("Referer")}?action=removeFromPromo&promoID=<%=promoID%>', { bookList: bookList }, function(){
                	alert("更新成功！");
                    window.location.replace("<%=request.getContextPath() + "/ShowPromoDetails?promoID=" + promoID + "&update=1"%>");
                })
            })
        });
    </script>
</body>
</html>