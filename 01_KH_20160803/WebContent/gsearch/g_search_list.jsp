<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Goods" %>

<%@ include file="/gsearch/g_search_form.jsp" %>
재능 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>재능명</td><td>카테고리</td><td>가격</td><td>상세설명</td><td>수정</td><td>삭제</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");

String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk m_search_list.jsp");
System.out.println(sv + "<-- sv m_search_list.jsp");

Mdao dao = new Mdao();
ArrayList<Goods> get_alg = dao.gSearch(sk, sv);

for(int i = 0; i<get_alg.size() ; i++){
	Goods g = get_alg.get(i);
%>
	<tr>
		<td><%= g.getG_name()%></td> <!-- G_name -->
		<td><%= g.getG_cate()%></td> <!-- G_cate -->
		<td><%= g.getG_price()%></td><!-- G_price -->
		<td><%= g.getG_desc()%></td> <!-- G_desc -->
		<!-- G_name G_cate G_price G_desc -->
		
		<td>
<a href="<%= request.getContextPath() %>/gupdate/g_update_form.jsp?send_id=<%= g.getG_name()%>">수정클릭</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?send_id=<%= g.getG_name()%>">삭제클릭</a>			
		</td>
	</tr>
<%		
	}	
%>
</table>