<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
System.out.println(send_id + "<-- send_id g_update_form.jsp");
Mdao dao = new Mdao();
Goods g = dao.gSelectforUpdate(send_id);

String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;
dbid = g.getG_code();
dbpw = g.getG_name();
dblevel = g.getG_cate();
dbname = g.getG_price();
dbemail = g.getG_desc();

%>
<form action="<%= request.getContextPath() %>/gupdate/g_update_pro.jsp" method="post">
<table border="1">

<tr>
	<td>재능코드</td>

	<td>
<%-- <input type="hidden" name="g_code" size="20" value="<%= dbid %>">	
		<%= dbid %>
 --%>
<input type="text" name="g_code" size="20" value="<%= dbid %>" readonly> 
	</td>
<tr> 
<tr>
	<td>재능명</td>
	<td><input type="text" name="g_name" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>카테고리</td>
	<td><input type="text" name="g_cate" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>가격</td>
	<td><input type="text" name="g_price" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>상세설명</td>
	<td><input type="text" name="g_desc" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="재능수정버튼"></td>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>

</body>
</html>






