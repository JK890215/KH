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
	<td>��ǰ�ڵ�</td>
	<td><input type="text" name="g_code" size="20"></td>
<tr> -->
<tr>
	<td>��ɸ�</td>
	<td><input type="text" name="g_name" size="20"></td>
<tr>
<tr>
	<td>ī�װ�</td>
	<td><input type="text" name="g_cate" size="20"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="g_price" size="20"></td>
<tr>
<tr>
	<td>�󼼼���</td>
	<td><input type="text" name="g_desc" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="��ɵ�Ϲ�ư"></td>
</tr>
</table>
</form>

		 </div>
		 <!-- End Right Column -->
		 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>