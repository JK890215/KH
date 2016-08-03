<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/gsearch/g_search_list.jsp" method="post">
	<select name="sk">
	    <option value="m_id">재능명</option>
	    <option value="m_level">카테고리</option>
	    <option value="m_name">가격</option>
	    <option value="m_email">상세설명</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="검색버튼">
</form>
