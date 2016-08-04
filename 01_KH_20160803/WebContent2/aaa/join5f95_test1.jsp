<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


	<div class="main_content">
		<!-- 컨텐츠 컨테이너 시작 -->
		<section class="container">
<section class="left_menu list">
	<div class="title">회원가입</div>
	<div class="sub_title">HOME  <i class="angle right icon"></i>회원가입</div>
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
            	<th>이메일</th>
                <td>
                	<input type="text" name="email1" type="text" style="width:120px;" autofocus required> 
                	@ 
                	<input type="text" name="email2" style="width:150px;" required/>
                    <select name="email3">
						<option value="">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
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
                    </select><br>
                    <span style="line-height: 15pt !important;" class="font small"><i style="margin:0;" class="check circle outline icon"></i>실제 사용중인 메일을 입력해 주세요.</span>
                </td>
            </tr>
            <tr>
            	<th>비밀번호</th>
            	<td>
            		<input type="password" name="passwd" id="pwd" style="width:120px;" value="" required/>
            		<span class="font small"><i style="margin:0;" class="check circle outline icon"></i>비밀번호를 최소 6자리 이상 입력해 주세요.</span>
            	</td>
            </tr>
            <tr>
            	<th>비밀번호확인</th>
            	<td>
            		<input type="password" name="repasswd" style="width:120px;" value="" required />
            		<span class="font small"><i style="margin:0;" class="check circle outline icon"></i>위에 입력한 비밀번호와 동일하게 입력해 주세요.</span>
            	</td>
            </tr>
            <tr>
            	<th>닉네임</th>
                <td>
                	<input type="text" name="userid" id="uid" style="width:120px;" value="" maxlength="12" required/>
                	<span class="font small"><i style="margin:0;" class="check circle outline icon"></i>중복된 닉네임인지 확인합니다.</span>
                </td>
            </tr>
            <tr>
            	<th>이름</th>
                <td>
                	<input type="text" name="name" id="name" style="width:120px;" value="" maxlength="10" /required>
                	<p>출금신청시 실명과 동일해야하므로 반드시 실명을 입력 해 주세요.</p>
                </td>
            </tr>
            <tr>
            	<th>프로필이미지등록</th>
                <td><input type="file" name="photo" id="photo" /> <p>115*115에 최적화되어 있습니다.</p></td>
            </tr>
           	<tr>
            	<th>휴대폰번호</th>
                <td>
                	<div class="no-request">
                		<input type="hidden" name="hp_yn" value="N">
                		<input type="hidden" name="hp_auth" value="N">
						<select name="hp1" required>
							<option value=""> 선택</option>
							<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
						</select>
						- <input type="text" name="hp2" style="width:60px;ime-mode:disabled" maxlength="4" required/> - <input type="text" name="hp3" style="width:60px;ime-mode:disabled" maxlength="4" required/>
						<div class="btn green request" style="padding: 5px 12px; font-size:9pt !important; line-height:10pt !important; margin:0;">인증 요청</div>
					</div>
					<div class="layer-request" style="display:none;">
						<input type="text" name="requestnum" style="font-size: 9pt !important; line-height: 12pt !important;width:200px; text-align:center;" placeholder="인증번호를 3분 이내에 입력해 주세요.">
						<div class="btn green req-check" style="padding: 5px 12px; font-size:9pt !important; line-height:10pt !important; margin:0;">인증번호 확인</div>
					</div>
                    <span class="font small"><i style="margin:0;" class="check circle outline icon"></i>주문 업데이트 정보 및 메시지 알림을 문자로 알려드립니다.</span> <span class="timer" style="display:none;">3:00</span>
                </td>
            </tr>
            <tr>