<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


	<div class="main_content">
		<!-- ������ �����̳� ���� -->
		<section class="container">
<section class="left_menu list">
	<div class="title">ȸ������</div>
	<div class="sub_title">HOME  <i class="angle right icon"></i>ȸ������</div>
</section>


<section class="right_menu list">
	<form name="member" method="post" enctype="multipart/form-data" action="http://www.crebugs.com/member/member_pro.php" onSubmit="return joinCheck('Join')">
	<input type="hidden" name="id_chk" id="id_chk" value="N" />
	<input type="hidden" name="mode" id="mode" value="join" />
	<table>
		<colgroup>
			<col width="30%"><col width="70%">
		</colgroup>
        <tbody>
        	<tr>
            	<th>�̸���</th>
                <td>
                	<input type="text" name="email1" type="text" style="width:120px;" autofocus required> 
                	@ 
                	<input type="text" name="email2" style="width:150px;" required/>
                    <select name="email3">
						<option value="">�����Է�</option>
						<option value="naver.com">���̹�</option>
						<option value="nate.com">����Ʈ</option>
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
                    </select><br>
                    <span style="line-height: 15pt !important;" class="font small"><i style="margin:0;" class="check circle outline icon"></i>���� ������� ������ �Է��� �ּ���.</span>
                </td>
            </tr>
            <tr>
            	<th>��й�ȣ</th>
            	<td>
            		<input type="password" name="passwd" id="pwd" style="width:120px;" value="" required/>
            		<span class="font small"><i style="margin:0;" class="check circle outline icon"></i>��й�ȣ�� �ּ� 6�ڸ� �̻� �Է��� �ּ���.</span>
            	</td>
            </tr>
            <tr>
            	<th>��й�ȣȮ��</th>
            	<td>
            		<input type="password" name="repasswd" style="width:120px;" value="" required />
            		<span class="font small"><i style="margin:0;" class="check circle outline icon"></i>���� �Է��� ��й�ȣ�� �����ϰ� �Է��� �ּ���.</span>
            	</td>
            </tr>
            <tr>
            	<th>�г���</th>
                <td>
                	<input type="text" name="userid" id="uid" style="width:120px;" value="" maxlength="12" required/>
                	<span class="font small"><i style="margin:0;" class="check circle outline icon"></i>�ߺ��� �г������� Ȯ���մϴ�.</span>
                </td>
            </tr>
            <tr>
            	<th>�̸�</th>
                <td>
                	<input type="text" name="name" id="name" style="width:120px;" value="" maxlength="10" /required>
                	<p>��ݽ�û�� �Ǹ�� �����ؾ��ϹǷ� �ݵ�� �Ǹ��� �Է� �� �ּ���.</p>
                </td>
            </tr>
            <tr>
            	<th>�������̹������</th>
                <td><input type="file" name="photo" id="photo" /> <p>115*115�� ����ȭ�Ǿ� �ֽ��ϴ�.</p></td>
            </tr>
           	<tr>
            	<th>�޴�����ȣ</th>
                <td>
                	<div class="no-request">
                		<input type="hidden" name="hp_yn" value="N">
                		<input type="hidden" name="hp_auth" value="N">
						<select name="hp1" required>
							<option value=""> ����</option>
							<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
						</select>
						- <input type="text" name="hp2" style="width:60px;ime-mode:disabled" maxlength="4" required/> - <input type="text" name="hp3" style="width:60px;ime-mode:disabled" maxlength="4" required/>
						<div class="btn green request" style="padding: 5px 12px; font-size:9pt !important; line-height:10pt !important; margin:0;">���� ��û</div>
					</div>
					<div class="layer-request" style="display:none;">
						<input type="text" name="requestnum" style="font-size: 9pt !important; line-height: 12pt !important;width:200px; text-align:center;" placeholder="������ȣ�� 3�� �̳��� �Է��� �ּ���.">
						<div class="btn green req-check" style="padding: 5px 12px; font-size:9pt !important; line-height:10pt !important; margin:0;">������ȣ Ȯ��</div>
					</div>
                    <span class="font small"><i style="margin:0;" class="check circle outline icon"></i>�ֹ� ������Ʈ ���� �� �޽��� �˸��� ���ڷ� �˷��帳�ϴ�.</span> <span class="timer" style="display:none;">3:00</span>
                </td>
            </tr>
            <tr>