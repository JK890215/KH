<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Goods" %>

��� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>��ɸ�</td><td>ī�װ�</td><td>����</td><td>�󼼼���</td><td>����</td><td>����</td>
</tr>
<%
Mdao dao = new Mdao();
ArrayList<Goods> get_alg = dao.gAllSelect();
for(int i = 0; i<get_alg.size() ; i++){
	Goods g = get_alg.get(i);
%>
	<tr>
		<td><%= g.getG_code()%></td>
		<td><%= g.getG_name()%></td>
		<td><%= g.getG_cate()%></td>
		<td><%= g.getG_price()%></td>
		<td><%= g.getG_desc()%></td>
		
	<td>
<a href="<%= request.getContextPath() %>/gupdate/g_update_form.jsp?send_id=<%= g.getG_code()%>">����Ŭ��</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/gdelete/g_delete_pro.jsp?send_id=<%= g.getG_name()%>">����Ŭ��</a>			
		</td>
	</tr>
<%		
}
%>	
</table>

