<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/gsearch/g_search_list.jsp" method="post">
	<select name="sk">
	    <option value="g_name">재능명</option>
	    <option value="g_cate">카테고리</option>
	    <option value="g_price">가격</option>
	    <option value="g_desc">상세설명</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="검색버튼">
</form>
