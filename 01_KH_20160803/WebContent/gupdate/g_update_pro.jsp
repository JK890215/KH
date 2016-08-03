<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="g" class="kr.or.ksmart.dto.Goods"/>
<jsp:setProperty name="g" property="*"/>
<%
Mdao updatedao = new Mdao();
updatedao.gUpdate(g);
response.sendRedirect(request.getContextPath()+"/gsearch/g_search_list.jsp");
%>