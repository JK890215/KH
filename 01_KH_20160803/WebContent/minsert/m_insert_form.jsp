<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<head>

<!-- <style>
 	table, tr, td{
 		border:1px solid #000000;
 		border-collapse:collapse;
	}
	table{
		width:100%;
	}
</style> -->


</head>

<body>
<form action="<%= request.getContextPath() %>/minsert/m_insert_pro.jsp" method="post">
	<table border="1">
<tr>	
	<tr>
		<td>아이디</td> <!-- DB연결처리완료 -->
		<td><input type="text" name="m_id" size="20" required></td>
	<tr>
	<tr>
		<td>비밀번호</td> <!-- DB연결처리완료 -->
		<td><input type="password" name="m_pw" size="20" required></td>
		<!-- <input type="password" id="pw1" name="pw1"><br>
		<input type="password" id="pw2" name="pw2"> -->
	<tr>
	<tr>
		<td>이름</td> <!-- DB연결처리완료 -->
		<td><input type="text" name="m_name" size="20" required></td>
	<tr>
	<tr>
		<td>권한</td> <!-- DB연결처리완료 -->
		<td>
			<select name="m_level" required>
			    <option value="">권한선택</option>
			    <option value="관리자">관리자</option>
			    <option value="판매자">판매자</option>
			    <option value="구매자">구매자</option>
		    </select>
			<!-- <input type="text" name="m_level" size="20"> -->
		</td>
	<tr>
	<tr>
		<td>이메일</td> <!-- DB연결처리완료 -->
		<td>
			<input type="text" name="m_email1" autofocus required> 
	       	@ 
			<select name="m_email2">
				<option value="">직접입력</option>
				<option value="@naver.com">네이버</option>
				<option value="@nate.com">네이트</option>
				<option value="hanmail.net">한메일</option>
				<option value="gmail.com">지메일</option>
				<option value="yahoo.com">야후</option>
				<option value="dreamwiz.com">드림위즈</option>
				<option value="empal.com">엠파스</option>
				<option value="freechal.com">프리첼</option>
				<option value="hanafos.com">하나포스</option>
				<option value="hanmir.com">한미르</option>
				<option value="hitel.net">하이텔</option>
				<option value="hotmail.com">핫메일</option>
				<option value="korea.com">코리아닷컴</option>
				<option value="lycos.co.kr">라이코스</option>
				<option value="netian.com">네띠앙</option>
				<option value="paran.com">파란</option>
				<option value="yahoo.co.kr">야후코리아</option>
				<option value="chol.com.com">천리안</option>		
			</select>
			<span style="line-height: 15pt !important;" class="font small">
			<i style="margin:0;" class="check circle outline icon">
			</i>실제 사용중인 메일을 입력해 주세요.</span>
		</td>
	<tr>
	<tr>
		<tr> <!-- DB연결처리완료 -->
		<td colspan="4"><input type="submit" value="회원가입버튼"></td>
	<tr>
</tr>

<!-- 	<tr>
			<td>성별</td>
			<td> 
				<input type="radio" value="male" name="gendet">남
				<input type="radio" value="female" name="gendet">여
			</td>
	<tr>
		<td>주소</td> 
		<td><input type="text" name="m_add" size="50"></td>
	<tr>
	<tr>
		<td>휴대폰번호(인증)</td>
		<td><input type="text" name="m_hp" seiz="50"></td>
	<tr>
-->
<!-- 	<tr>
		<td>이메일</td>
		<td>
			<input type="text" id="email" name="email">
			@
			<select id="url">
				<option>naver.com</option>
				<option>daum.net</option>
				<option>nate.com</option>
				<option>google.com</option>
			</select>	
		</td>
	<tr> -->
<!-- 	<tr>
		<td>닉네임</td>
		<td><input type="text" name="" size="10"></td>
	<tr>
	<tr>
		<td>취미</td>
		<td>
			<input type="checkbox" value="sport" name="hobby">운동
			<input type="checkbox" value="sport" name="hobby">운동
			<input type="checkbox" value="read" name="hobby">독서
		</td>
	<tr>
	<tr>
		<td>생일</td>
		<td><input type="date" id="birth" name="birth"></td>
	<tr>
	<tr>
		<td>나이</td>
		<td><input type="text" id="age" name="age"></td>
	<tr> -->
<!-- 	<tr>
		<td>자기소개</td>
		<td><textarea id="memo" rows="3" cols="50"></textarea></td>
	<tr> -->
	
	</table>
</form>
</body>
</html>
