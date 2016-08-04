<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

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
Member m = dao.mSelectforUpdate(send_id);

String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;
dbid = m.getM_id();
dbpw = m.getM_pw();
dblevel = m.getM_level();
dbname = m.getM_name();
dbemail = m.getM_email();

%>
<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td>
<input type="hidden" name="m_id" size="20" value="<%= dbid %>">	
		<%= dbid %>
		
<%-- 
<input type="text" name="m_id" size="20" value="<%= dbid %>" readonly> 
--%>
	
	</td>
<tr> 
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>



<%@ include file="/module/hadan.jsp" %>

</body>
</html>






