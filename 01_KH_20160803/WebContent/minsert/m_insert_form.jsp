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
		<td>���̵�</td> <!-- DB����ó���Ϸ� -->
		<td><input type="text" name="m_id" size="20" required></td>
	<tr>
	<tr>
		<td>��й�ȣ</td> <!-- DB����ó���Ϸ� -->
		<td><input type="password" name="m_pw" size="20" required></td>
		<!-- <input type="password" id="pw1" name="pw1"><br>
		<input type="password" id="pw2" name="pw2"> -->
	<tr>
	<tr>
		<td>�̸�</td> <!-- DB����ó���Ϸ� -->
		<td><input type="text" name="m_name" size="20" required></td>
	<tr>
	<tr>
		<td>����</td> <!-- DB����ó���Ϸ� -->
		<td>
			<select name="m_level" required>
			    <option value="">���Ѽ���</option>
			    <option value="������">������</option>
			    <option value="�Ǹ���">�Ǹ���</option>
			    <option value="������">������</option>
		    </select>
			<!-- <input type="text" name="m_level" size="20"> -->
		</td>
	<tr>
	<tr>
		<td>�̸���</td> <!-- DB����ó���Ϸ� -->
		<td>
			<input type="text" name="m_email1" autofocus required> 
	       	@ 
			<select name="m_email2">
				<option value="">�����Է�</option>
				<option value="@naver.com">���̹�</option>
				<option value="@nate.com">����Ʈ</option>
				<option value="hanmail.net">�Ѹ���</option>
				<option value="gmail.com">������</option>
				<option value="yahoo.com">����</option>
				<option value="dreamwiz.com">�帲����</option>
				<option value="empal.com">���Ľ�</option>
				<option value="freechal.com">����ÿ</option>
				<option value="hanafos.com">�ϳ�����</option>
				<option value="hanmir.com">�ѹ̸�</option>
				<option value="hitel.net">������</option>
				<option value="hotmail.com">�ָ���</option>
				<option value="korea.com">�ڸ��ƴ���</option>
				<option value="lycos.co.kr">�����ڽ�</option>
				<option value="netian.com">�׶��</option>
				<option value="paran.com">�Ķ�</option>
				<option value="yahoo.co.kr">�����ڸ���</option>
				<option value="chol.com.com">õ����</option>		
			</select>
			<span style="line-height: 15pt !important;" class="font small">
			<i style="margin:0;" class="check circle outline icon">
			</i>���� ������� ������ �Է��� �ּ���.</span>
		</td>
	<tr>
	<tr>
		<tr> <!-- DB����ó���Ϸ� -->
		<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
	<tr>
</tr>

<!-- 	<tr>
			<td>����</td>
			<td> 
				<input type="radio" value="male" name="gendet">��
				<input type="radio" value="female" name="gendet">��
			</td>
	<tr>
		<td>�ּ�</td> 
		<td><input type="text" name="m_add" size="50"></td>
	<tr>
	<tr>
		<td>�޴�����ȣ(����)</td>
		<td><input type="text" name="m_hp" seiz="50"></td>
	<tr>
-->
<!-- 	<tr>
		<td>�̸���</td>
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
		<td>�г���</td>
		<td><input type="text" name="" size="10"></td>
	<tr>
	<tr>
		<td>���</td>
		<td>
			<input type="checkbox" value="sport" name="hobby">�
			<input type="checkbox" value="sport" name="hobby">�
			<input type="checkbox" value="read" name="hobby">����
		</td>
	<tr>
	<tr>
		<td>����</td>
		<td><input type="date" id="birth" name="birth"></td>
	<tr>
	<tr>
		<td>����</td>
		<td><input type="text" id="age" name="age"></td>
	<tr> -->
<!-- 	<tr>
		<td>�ڱ�Ұ�</td>
		<td><textarea id="memo" rows="3" cols="50"></textarea></td>
	<tr> -->
	
	</table>
</form>
</body>
</html>
