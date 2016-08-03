<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
Mdao dao = new Mdao();
Member m = dao.mSelectforUpdate("id003");
String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;

dbid = m.getM_id();
dbpw = m.getM_pw();
dblevel = m.getM_level();
dbname = m.getM_name();
dbemail = m.getM_email();
%>

아이디 : <%= dbid %> <br>
비번 : <%= dbpw %> <br>
권한 : <%= dblevel %> <br>
이름 : <%= dbname %> <br>
이메일 : <%= dbemail %> <br>





