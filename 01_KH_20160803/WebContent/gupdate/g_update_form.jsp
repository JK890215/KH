<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Goods" %>

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


<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id m_update_form.jsp");
Mdao dao = new Mdao();
Goods g = dao.gSelectforUpdate(send_id);
//G_name G_cate G_price G_desc
String dbname = null;
String dbcate = null;
String dbprice = null;
String dbdesc = null;

dbname = g.getG_name();
dbcate = g.getG_cate();
dbprice = g.getG_price();
dbdesc = g.getG_desc();
//G_name G_cate G_price G_desc
%>
<form action="<%= request.getContextPath() %>/gupdate/g_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td></td>
	<%-- <td>
 
<input type="hidden" name="G_name" size="20" value="<%= dbname %>">	
		<%= dbname %> 
		

<input type="text" name="G_name" size="20" value="<%= dbname %>" readonly> 

	
	</td> --%>
<tr> 
<tr>
	<td>재능명</td>
	<td><input type="text" name="G_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>카테고리</td>
	<td><input type="text" name="g_cate" size="20" value="<%= dbcate %>"></td>
<tr>
<tr>
	<td>가격</td>
	<td><input type="text" name="G_price" size="20" value="<%= dbprice %>"></td>
<tr>
<tr>
	<td>상세설명</td>
	<td><input type="text" name="G_desc" size="20" value="<%= dbdesc %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="재능수정버튼"></td>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>

</body>
</html>






