
/* ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	┃ 개발자 정의 함수																																									 ┃
	┃ 업데이트:2012.01.10																																								 ┃
	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/

	//폼 필수 입력사항 체크
	function formChk(obj){
		 var res=true;
		$(obj).find(".req:visible").each(function(){
			if($(this).val().replace(/\s+/g,"").length==0){
				alert("필수입력사항("+$(this).attr("title")+")을 모두 기입해 주세요.");
				$(this).focus();
				res=false;
				return false;
			}
		});
		return res;
	}

	//contest폼 필수 입력사항 체크
	function contest(obj){
		 var res=true;
		$(obj).find(".req:visible").each(function(){
			//alert(obj.value);
			if($(this).val().replace(/\s+/g,"").length==0){
				alert("필수입력사항 "+$(this).attr("title")+" 주세요.");
				$(this).focus();
				res=false;
				return false;
			}

		});
		return res;
	}

	//개별 폼 체크
	function inputChk(obj, msg){
		if (obj.value.replace(/\s+/g,'').length == 0){
			alert(msg);
			obj.focus();
			return false;
		}
		return true;
	}

	//라디오버튼 폼 체크 (폼네임,출력 메시지)
	function radioChk(formname, msg){
		if($("input[name='"+formname+"']:checked").length<1){
			alert(msg);
			return false;
		}
		return true;
	}

	//숫자만 입력
	function onlyNumber(el){
		if((event.keyCode<48 && event.keyCode!==13)||(event.keyCode>57)){
			event.returnValue=false;
			alert('숫자만 입력 가능합니다.');
		}
	}

	$(function(){

		$(document).on("keyup", ".onlynum", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	});

	//이메일 선택
	$(function(){
		$(".selMail").change(function(){
			if($(this).val()==""){
				$(this).prev().val("");
				$(this).prev().attr("readonly",false);
				$(this).prev().focus();
			}else{
				$(this).prev().val($(this).val());
				$(this).prev().attr("readonly",true);
			}
		});
	});

	//체크박스 전체 선택
	function check_all(obj, val){
		if($(obj).is(":checked")==true){
			$("input:checkbox[name='"+val+"']").each(function(){
				this.checked=true;
			});
		}else{
			$("input:checkbox[name='"+val+"']").each(function(){
				this.checked=false;
			});
		}
	}

	//체크박스 일괄 삭제
	function check_del(form,el){
		if($("input:checkbox[name='"+el+"']:checked").length<1){
			alert("최소 하나 이상의 글을 선택해 주세요."); return;}
		else{
			if(confirm("선택하신 글을 모두 삭제하시겠습니까?")){
				form.mode.value="check_del";
				form.submit();
			}
		}
	}

	// 정보 삭제시 삭제 여부 확인
	function really(){
		if (confirm("정말로 삭제하시겠습니까?")) return true;
		return false;
	}

	// 메세지 출력 후 실행
	function really_msg(msg){
		if (confirm(msg)) return true;
		return false;
	}

	//첨부파일 다운로드(파일경로,파일명)
	function FileDown(Path, File, Org){
		x=screen.availWidth/2-150
		y=screen.availHeight/2-100
		//window.open("/common/filedown.php?Path="+Path+"&File="+File+"&Org="+Org,'file', 'Left=' + x + ',Top=' + y + ',Width=0, Height=0,menubar=no,directories=no,resizable=no,status=no,scrollbars=no');
		location.href="/common/filedown.php?Path="+Path+"&File="+File+"&Org="+Org;
	}

	//커서자동이동
	function AutoMove(obj,next,cnt){
		if($(obj).val().length==cnt) document.getElementById(next).focus();
	}

	//콤마 붙이기
	function setComma(str){
		str = ""+str+"";
		var retValue = "";

		for(i=0; i<str.length; i++){
			if(i > 0 && (i%3)==0) {
				retValue = str.charAt(str.length - i -1) + "," + retValue;
			}else {
				retValue = str.charAt(str.length - i -1) + retValue;
			}
		}
		return retValue;
	}

	//주민번호 유효성 체크
	function juminChk(jumin1, jumin2) {

		resno = jumin1 + jumin2;

		fmt = /^\d{6}[1234]\d{6}$/;
		if (!fmt.test(resno)) {
			alert("잘못된 주민등록번호입니다.");
			return false;
		}

		// 날짜 유효성 검사
		birthYear = (resno.charAt(7) <= "2") ? "19" : "20";
		birthYear += resno.substr(0, 2);
		birthMonth = resno.substr(2, 2) - 1;
		birthDate = resno.substr(4, 2);
		birth = new Date(birthYear, birthMonth, birthDate);

		if ( birth.getYear() % 100 != resno.substr(0, 2) ||
			birth.getMonth() != birthMonth ||
			birth.getDate() != birthDate)
		{
			alert("잘못된 주민등록번호입니다.");
			return false;
		}

		// Check Sum 코드의 유효성 검사
		buf = new Array(13);
		for (i = 0; i < 13; i++) buf[i] = parseInt(resno.charAt(i));

		multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
		for (i = 0, sum = 0; i < 12; i++) sum += (buf[i] *= multipliers[i]);

		if ((11 - (sum % 11)) % 10 != buf[12])
		{
			alert("잘못된 주민등록번호입니다.");
			return false;
		}
		return true;
	}

	//팝업관련
	function getCookie(name) {
		var Found = false
		var start, end
		var i = 0

		// cookie 문자열 전체를 검색
		while(i <= document.cookie.length) {
			 start = i
			 end = start + name.length
			 // name과 동일한 문자가 있다면
			 if(document.cookie.substring(start, end) == name) {
				 Found = true
				 break
			 }
			 i++
		}

		// name 문자열을 cookie에서 찾았다면
		if(Found == true) {
			start = end + 1
			end = document.cookie.indexOf(";", start) 			// 마지막 부분이라는 것을 의미(마지막에는 ";"가 없다)
			if(end < start)
				end = document.cookie.length 			// name에 해당하는 value값을 추출하여 리턴한다.
			return document.cookie.substring(start, end)
		}
		// 찾지 못했다면
		return ""
	}

	function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}

	//클립보드 복사하기
	function Clip_copy(str){
		if(window.clipboardData.setData("Text",str)){
			alert("주소가 복사되었습니다.");
		}
	}

	function newsform(){
		if($("#newsemail").val()=="" || $("#newsemail").val()=="이메일 주소를 입력하세요."){
			alert("이메일 주소를 입력하세요.");
			return false;
		}
		if ($("#newsemail").val().indexOf('@')==-1 || $("#newsemail").val().indexOf('.')==-1) {
			alert('유효한 이메일 주소를 입력해 주세요.');
			return false;
		}
		$.post("../member/member_pro.php",{mode:"newsletter", email:$("#newsemail").val()}, function(data) {
			if(data=="Succ"){
				alert("뉴스레터 구독신청 되었습니다.");
			}else{
				alert("이미 구독신청을 하셨습니다.");
			}
		});
		return false;

	}

	//푸터

$(function(){
	$("#cateFooter").click(function(){
		if($("#cateFooter").is(".open")){
			$(this).removeClass("open");
			$("#cateFooter").text("카테고리 닫기");
			$(".footerCateWrap").show();
		}else{
			$(this).addClass("open");
			$("#cateFooter").text("카테고리 열기");
			$(".footerCateWrap").hide();
		}
		return false;
	});
});

//메인 리스트 오버
$(function(){
	$("#listWrapper .item").mouseover(function(){
		$(this).children('.info').show();
	});
	$("#listWrapper .item").mouseout(function(){
		$(this).children('.info').hide();
	});
});
