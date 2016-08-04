//개인회원가입 폼 체크
function joinCheck(mode){
	var obj=document.member;

	// if($("#c1").is(":checked")==false){
	// 	alert("이용약관과 개인정보 취급방침에 동의해 주세요.");
	// 	return false;
	// }
	$('[name=hp1]').removeAttr("disabled");

	if(!inputChk(obj.email1, "이메일을 입력해 주세요.")) return false;
	if(!inputChk(obj.email2, "이메일을 입력해 주세요.")) return false;

	if(!inputChk(obj.passwd, "비밀번호를 입력해 주세요.")) return false;

	if(obj.hp_auth.value == "N") {
		alert("휴대폰 번호 인증 해주세요.");
		return false;
	}

	if(obj.passwd.value.length>0){
		if (/^[a-z0-9_-]{4,12}$/.test($("#pwd").val()) != true) {
			alert('비밀번호는 공백이나 특수문자, 한글을 제외한 4~12자로 입력해 주세요.');
			$("#pwd").focus();
			return false;
		}
		if(!inputChk(obj.repasswd, "비밀번호 확인을 위해 한번 더 입력해 주세요.")) return false;
		if(obj.passwd.value != obj.repasswd.value){
			alert('비밀번호가 서로 일치하지 않습니다.');
			return false;
		}
	}

	if(!inputChk(obj.userid, "닉네임을 입력해 주세요.")) return false;
	if(!inputChk(obj.name, "이름을 입력해 주세요.")) return false;
	// if(!inputChk(obj.hp1, "휴대폰번호를 입력해 주세요.")) return false;
	// if(!inputChk(obj.hp2, "휴대폰번호를 입력해 주세요.")) return false;
	// if(!inputChk(obj.hp3, "휴대폰번호를 입력해 주세요.")) return false;
	
	if(!$("#chk1").is(":checked") || !$("#chk2").is(":checked")){
		alert("이용약관과 개인정보 취급방침에 동의해 주세요.");
		return false;
	}

	//아이디, 이메일 중복체크
	$.ajax(
	{
		type: "post",
		dataType: "html",  //xml,html,jeon,jsonp,script,text
		url: "/member/member_pro.php",
		data: {
			mode:"uniq",
			userid:obj.userid.value,
			email:obj.email1.value+"@"+obj.email2.value
		},
		async: true,
		cache: false,
		success: function(data){
			if(data=="Succ"){
				document.member.submit();
			}else{
				alert(data);
				return false;
			}
		},
		error: function(data){
			return false;
		}
	});

	return false;


}




//회원가입하기
$(function(){
	$("#join_link").on("click",function(){
		if($("#join_layer").is(":visible")){
			$("#join_layer").hide();
		}else{
			$("#join_layer").show();
			$("#login_layer").hide();
		}
	});

/*
	$("#join_link").on("blur",function(){
		if($("#join_layer").is(":visible")){
			setTimeout('$("#join_layer").hide();','200');
		}
	});
*/

	$("#login_link").on("click",function(){
		if($("#login_layer").is(":visible")){
			$("#login_layer").hide();
		}else{
			$("#login_layer").show();
			$("#join_layer").hide();
		}
	});

/*
	$("#login_link").on("blur",function(){
		if($("#login_layer").is(":visible")){
			setTimeout('$("#login_layer").hide();','200');
		}
	});
*/
	$("#join_button").on("click",function(){
		var obj=document.join_form;
		if(!inputChk(obj.email, "이메일을 입력해 주세요.")) return false;
		if (obj.email.value.indexOf('@')==-1 || obj.email.value.indexOf('.')==-1) {
			alert('유효한 이메일 주소를 입력해 주세요.');
			obj.email.focus();
			return false;
		}
		if(!inputChk(obj.passwd, "비밀번호를 입력해 주세요.")) return false;
		if (/^[a-z0-9_-]{6,12}$/.test(obj.passwd.value) != true) {
			alert('6~12자의 영문 소문자, 숫자만 사용 가능');
			obj.passwd.focus();
			return false;
		}

		if($("#cfm1").is(":checked")==false || $("#cfm2").is(":checked")==false){
			alert("이용약관과 개인정보 취급방침에 동의해 주세요.");
			return false;
		}

		$.ajax(
		{
			type: "post",
			dataType: "html",  //xml,html,jeon,jsonp,script,text
			url: "../member/member_pro.php",
			data: {
				mode:"join",
				email:obj.email.value,
				passwd:obj.passwd.value
			},
			async: true,
			cache: false,
			success: function(data){
				if(data=="Succ"){
					location.href="../main/main.php";
				}else{
					alert(data);
					return false;
				}
			},
			error: function(data){
				return false;
			}
		});
		return false;
	});

	$("#login_button").on("click",function(){
		var obj=document.login_form;
		if(!inputChk(obj.email, "이메일을 입력해 주세요.")) return false;
		if(!inputChk(obj.passwd, "비밀번호를 입력해 주세요.")) return false;

		//아이디, 이메일 중복체크
		$.ajax(
		{
			type: "post",
			dataType: "html",  //xml,html,jeon,jsonp,script,text
			url: "../member/member_pro.php",
			data: {
				mode:"login",
				email:obj.email.value,
				passwd:obj.passwd.value,
				SaveID:$("#SaveID").is(":checked") ? "Y":"N"
			},
			async: true,
			cache: false,
			success: function(data){
				if(data=="Succ" || data=='<script>location.href="../main/main.php"</script>'){
					location.href="../main/main.php";
				}else{
					alert("로그인 정보가 일치하지 않습니다.");
					return false;
				}
			},
			error: function(data){
				return false;
			}
		});

		return false;
	});

	//비밀번호 찾기
	$(".search_button").on("click",function(){
		if($("#searchtab").is(":visible")){
			$("#searchtab").slideUp('fast');
			// $("#logintab").show();
		}else{
			$("#searchtab").slideDown('fast');
			// $("#logintab").hide();
		}
	});

	//임시 비밀번호 발송
	$(function(){
		$("#mailsend_button").on("click",function(){

			if(!inputChk(document.search_form.email, "이메일을 입력해 주세요.")) return false;

			//아이디, 이메일 중복체크
			$.ajax(
			{
				type: "post",
				dataType: "html",  //xml,html,jeon,jsonp,script,text
				url: "../member/member_pro.php",
				data: {
					mode:"tempemail",
					email:document.search_form.email.value
				},
				async: true,
				cache: false,
				success: function(data){
					if(data=="Succ"){
						alert("입력하신 메일로 임시비밀번호가 발송되었습니다.");
						return false;
					}else{
						alert("입력하신 이메일 계정을 찾을 수 없습니다.");
						return false;
					}
				},
				error: function(data){
					return false;
				}
			});

			return false;
		});
	});

	//마이페이지 레이어
	$("#user_link").click(function(){
		if($("#drop_layer").is(":visible")){
			$("#drop_layer").slideUp(300);
		}else{
			$("#drop_layer").slideDown(300);
		}
	})

	$("#user_link").on("blur",function(){
		if($("#drop_layer").is(":visible")){
			setTimeout('$("#drop_layer").hide();','200');
		}
	});

	//알림 레이어
	$("#alarm_link").click(function(){
		if($("#notice_layer").is(":visible")){
			$("#notice_layer").slideUp(300);
		}else{
			$("#notice_layer").slideDown(300);
		}
	})

	$("#alarm_link").on("blur",function(){
		if($("#notice_layer").is(":visible")){
			setTimeout('$("#notice_layer").hide();','200');
		}
	});
});