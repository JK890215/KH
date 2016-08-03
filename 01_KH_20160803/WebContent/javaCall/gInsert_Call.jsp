<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Goods" %>

<%
Mdao dao = new Mdao();
for(int i = 0; i<get_alm.size() ; i++){
	Goods m = get_alm.get(i);
g.setG_name("1432");
g.setG_cate("pw001");
g.setG_desc("12321");
g.setG_price("asdas");


%>