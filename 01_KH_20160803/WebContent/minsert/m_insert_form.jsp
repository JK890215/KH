<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<form action="<%= request.getContextPath() %>/minsert/m_insert_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20"></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원가입버튼"></td>
</tr>
</table>
</form>