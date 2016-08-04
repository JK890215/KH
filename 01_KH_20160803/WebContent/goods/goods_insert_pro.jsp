<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html> 

<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="g" class="kr.or.ksmart.dto.Goods"/>
<jsp:setProperty name="g" property="*"/>

<%
Mdao ginsertdao = new Mdao();
ginsertdao.gInsert(g);

response.sendRedirect(request.getContextPath()+"/goods/goods_list.jsp");
%>