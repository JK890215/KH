<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/gsearch/g_search_list.jsp" method="post">
	<select name="sk">
	    <option value="g_name">��ɸ�</option>
	    <option value="g_cate">ī�װ�</option>
	    <option value="g_price">����</option>
	    <option value="g_desc">�󼼼���</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="�˻���ư">
</form>
