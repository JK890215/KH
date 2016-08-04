<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	System.out.println(S_NAME + "<-- S_NAME");
	System.out.println(S_LEVEL + "<-- S_LEVEL");
%>

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header">
		 
		   <CENTER><B>K&nbsp;재능마켓 </B></CENTER><br><br>		 

<%
if(S_LEVEL == null){
%>

<form action="<%= request.getContextPath() %>/login/login_pro.jsp" method="post">

	<div style="text-align:right">
	아이디 : <input type="text" name="id"> 
	비번 : <input type="password" name="pw"> 
	<input type="submit" value="로그인"> 
	</div>

</form>
<br>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> [&nbsp;회원등록&nbsp;] </a>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> [&nbsp;재능리스트&nbsp;] </a>
&nbsp;&nbsp;


<%}else{ %>

<div style="text-align:right"> <%= S_NAME %> 님 <%= S_LEVEL %> 권한 로그인 
<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a></div>
<br>

<%	if(S_LEVEL.equals("구매자")){ 		%>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> [&nbsp;회원등록&nbsp;] </a>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> [&nbsp;재능리스트&nbsp;] </a>
&nbsp;&nbsp;
<%	}else if(S_LEVEL.equals("판매자")){ %>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> [&nbsp;회원등록&nbsp;] </a>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp"> [&nbsp;재능등록&nbsp;] </a>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> [&nbsp;재능리스트&nbsp;] </a>
&nbsp;&nbsp;
<%	}else if(S_LEVEL.equals("관리자")){ %>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> [&nbsp;회원등록&nbsp;] </a> 
&nbsp;&nbsp; 
<a href="<%= request.getContextPath() %>/user/user_list.jsp"> [&nbsp;회원리스트&nbsp;] </a>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp"> [&nbsp;재능등록&nbsp;] </a>
&nbsp;&nbsp;
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> [&nbsp;재능리스트&nbsp;] </a>
&nbsp;&nbsp;
<%	} %>	

<%} %>






































		 </div>
		 <!-- End Header -->
		 
