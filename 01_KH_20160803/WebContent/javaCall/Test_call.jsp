<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Test" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
Test t = new Test();
ArrayList<Member> get_al = t.bbb();
out.println(get_al + "<-- get_al <br><br>");
Member m1 = get_al.get(0);
out.println(m1.getM_id() + "<-- m1.getM_id() <br>");
out.println(m1.getM_pw() + "<-- m1.getM_pw() <br>");
out.println(m1.getM_level() + "<-- m1.getM_level() <br>");
out.println(m1.getM_name() + "<-- m1.getM_name() <br>");
out.println(m1.getM_email() + "<-- m1.getM_email() <br><br>");

Member m2 = get_al.get(1);
out.println(m2.getM_id() + "<-- m2.getM_id() <br>");
out.println(m2.getM_pw() + "<-- m2.getM_pw() <br>");
out.println(m2.getM_level() + "<-- m2.getM_level() <br>");
out.println(m2.getM_name() + "<-- m2.getM_name() <br>");
out.println(m2.getM_email() + "<-- m2.getM_email() <br><br>");


%>