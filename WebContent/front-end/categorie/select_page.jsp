<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<html>
<head>
<title>BOOKSHOP Categories: Home</title>
<style></style>
</head>
<body>
<table id="table-1">
   <tr><td><h3>BOOKSHOP Categories: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for BOOKSHOP Categories: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllCategorie.jsp'>List</a> all Categories.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="categorie.do" >
        <b>輸入類別編號 (如LC001):</b>
        <input type="text" name="lc_class_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="categorieService" scope="page" class="com.categorie.model.CategorieService" />
   
  <li>
     <FORM METHOD="post" ACTION="categorie.do" >
       <b>選擇講座編號:</b>
       <select size="1" name="lc_class_id">
         <c:forEach var="categorieVO" items="${categorieService.all}" > 
          <option value="${categorieVO.lc_class_id}">${categorieVO.lc_class_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
</ul>


<h3>類別管理</h3>

<ul>
  <li><a href='addCategorie.jsp'>Add</a> a new Categorie.</li>
</ul>

</body>
</html>