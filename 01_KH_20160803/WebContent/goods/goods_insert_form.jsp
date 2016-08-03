<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<link rel="stylesheet" type="text/css" href="main.css" />

<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
}
</style>
							 
</head>

<body>

<%@ include file="/module/top.jsp" %>

<%@ include file="/module/left.jsp" %>

		 <!-- Begin Right Column -->
		 <div id="rightcolumn">

<form action="<%= request.getContextPath() %>/goods/goods_insert_pro.jsp" method="post">
<table border="1">
<!-- <tr>
	<td>상품코드</td>
	<td><input type="text" name="g_code" size="20"></td>
<tr> -->
<tr>
	<td>재능명</td>
	<td><input type="text" name="g_name" size="20"></td>
<tr>
<tr>
	<td>카테고리</td>
	<td><input type="text" name="g_cate" size="20"></td>
<tr>
<tr>
	<td>가격</td>
	<td><input type="text" name="g_price" size="20"></td>
<tr>
<tr>
	<td>상세설명</td>
	<td><input type="text" name="g_desc" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="재능등록버튼"></td>
</tr>
</table>
</form>

		 </div>
		 <!-- End Right Column -->
		 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>