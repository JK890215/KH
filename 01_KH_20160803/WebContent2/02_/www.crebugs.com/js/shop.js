/* ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	┃ 기타 공통																																			   ┃
	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/

//메인비주얼
$(function(){
	$(".bannerIcon").on("click",function(){
		$(".bannerIcon").removeClass("on");
		$(this).addClass("on");

		var index=$(".bannerIcon").index(this);

		$(".mainVisualBox").hide();
		$(".mainVisualBox").eq(index).show();

		//$(".mainVisualBox").css("background-image","url('"+$(this).attr("title")+"')");
		//$(".mainVisualBox").animate("slow");
	});
});


//메인 공지사항 다음, 이전글 보기
$(function(){
	$("#notice_right, #notice_left").on("click",function(){

		$.getJSON("notice.php", {mode:"notice", idx:$("#notice_title").attr("var"), type:$(this).attr("var")}, function(json){
			idx=json.content[0].idx;
			title=json.content[0].title;

			if(idx!=""){
				if(json.content[0].prev_cnt<1){
					$("#notice_right").css("opacity","0.4");
				}else{
					$("#notice_right").css("opacity","1");
				}

				if(json.content[0].next_cnt<1){
					$("#notice_left").css("opacity","0.4");
				}else{
					$("#notice_left").css("opacity","1");
				}

				$("#notice_title").html('<a href="/customer/notice.php?b_id=001&idx='+idx+'&mode=view">'+title+'</a>');
				$("#notice_title").attr("var",idx);
			}

		});
		return false;
	});
});

//카테고리보기
$(function(){

	$(".categoryBtn").on("click",function(){
		if($(".cateDepth_2").is(":visible")){
			$(".cateDepth_2").hide();
		}else{
			$(".cateDepth_2").show();
		}
	});
});

//카테고리닫기
$(function(){
	$(".categoryBtn").on("blur",function(){
		if($(".cateDepth_2").is(":visible")){
			setTimeout('$(".cateDepth_2").hide();','200');
		}
	});
});

//검색하기 타입 클릭
$(function(){
	$("#searchSel").click(function(){
		if($("#keyword_list").is(":visible")){
			$('#keyword_list').hide();
		}else{
			$('#keyword_list').show();
		}
	});
});


//카테고리보기
$(function(){
	$(".cateDepth_2>li").on("mouseover",function(){
		$(".cateDepth_3").hide();
		$(this).children("ol").show();
	});
});

//카테고리 선택 검색
$(function(){
	$("#category_all").on("click",function(){
		if($(this).is(":checked")==true){
			$("input[name='code2[]']").each(function(){
				this.checked=true;
			});
		}else{
			$("input[name='code2[]']").each(function(){
				this.checked=false;
			});
		}
	});

	$("#category_no").on("click",function(){
		$("input[name='code2[]']").each(function(){
			this.checked=false;
		});
	});

	//2차 카테고리 선택시
	$("input[name='code2[]']").click(function(){
		codeArr="";
		for(i = 0; i < $("input[name='code2[]']:checked").size(); i ++){
			codeArr += $("input[name='code2[]']:checked").eq(i).val() + ",";
		}
		$("#kCode").val(codeArr);
	});
});


/* ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	┃ 재능상세																																			   ┃
	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/
//코멘트 아이프레임 리사이즈
function resizeTopIframe(dynheight) {
	document.getElementById("commentFrame").height = parseInt(dynheight);
}

//관심 재능 등록
$(function(){
	$("#wishbtn").click(function(){
		var idx=$(this).attr("var");
		$.post("../product/process.php",{mode:"like", b_idx:idx}, function(data) {
			if(data=="L"){
				alert("로그인 후 이용 가능합니다.");
				////////////
				location.href='../member/login.php';
			}else if(data=="Y"){
				alert("관심상품으로 등록되었습니다.");
			}else{
				alert("이미 관심상품으로 등록하셨습니다.");;
			}
		});
	});
});

//상품 좋아요 등록
$(function(){
	$(".like_button").on("click",function(){
		var idx=$(this).attr("var");
		$.post("../product/process.php",{mode:"like", b_idx:idx}, function(data) {
			if(data=="L"){
				alert("로그인 후 이용 가능합니다.");
				////////////
				location.href='../member/login.php';
			}else if(data=="Y"){
				console.log('y');
				$("#like"+idx).find('.icon.heart').removeClass('outline').addClass('red');
				// $("#like"+idx).attr("src","../images/board/listIcoLike_on.png");
			}else{
				console.log('n');
				$("#like"+idx).find('.icon.heart').addClass('outline').removeClass('red');
				// $("#like"+idx).attr("src","../images/board/listIcoLike.png");
			}
		});
	});
});

/* ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	┃ 재능등록 관련																																		   ┃
	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/

$(function(){
	//사진동영상 추가
	$("#addBtn").click(function(){
		if($("#photoLayer:hidden").size()){
			$("#photoLayer").show();
			$("#chkPhoto").val("Y");

			$("#helpMsg2").css("top","1030px");
			$("#helpMsg3").css("top","1110px");
			$("#helpMsg4").css("top","1180px");
			$("#helpMsg5").css("top","1260px");
		}else{
			$("#photoLayer").hide();
			$("#chkPhoto").val("N");

			$("#helpMsg2").css("top","680px");
			$("#helpMsg3").css("top","760px");
			$("#helpMsg4").css("top","830px");
			$("#helpMsg5").css("top","910px");
		}
	});

	//판매옵션 입력
	$("#chkOpt").click(function(){
		if($(this).is(":checked")){
			$("#optLayer").show();
		}else{
			$("#optLayer").hide();
		}
	});
});


//재능 댓글 답글달기, 삭제
$(function(){
	$(".bt_reply").click(function(){
		$("div.reply_form").hide();
		$(this).parents("li").children("div.reply_form").show();
		return false;
	});
});

function commDel(idx,mode){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.post("./comment_pro.php",{mode:mode, idx:idx}, function(data) {
			if(data=="Y"){
				location.reload();
			}
		});
	}
	return false;
}

//제목 글 수 40자로 제한
$(function(){

	$("#prodTitle1").keyup(function(){
		if($(this).val().length>40) $("#ww").text($(this).val().length);
		if($(this).val().length>40){
			$(this).val($(this).val().substr(0,40));
			return false;
		}
		//$('#titleUse').text($(this).val().length);
	});
});


//글자수 제한
function limitCharacters(textid, limit, limitid){
	var text = $('#'+textid).val();
	// 입력값 길이 저장
	var textlength = text.length;
	if(textlength > limit)        {
		//$('#' + limitid).html('글내용을 '+limit+                '자 이상 쓸수 없습니다!');
		alert(limit+"자 이상 쓸 수 없습니다.")
		// 제한 글자 길이만큼 값 재 저장
		$('#'+textid).val(text.substr(0,limit));
		$('#contents').blur();
		return false;
	}else{
		//$('#' + limitid).html('쓸수 있는 글자가 '+ (limit - textlength) +                ' 자 남았습니다.');
		return true;
	}
}

$(function(){
	$('#tTitle').keyup(function(){
		limitCharacters('tTitle', 40, 'charlimitid');
	})
});


/* ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	┃ 주문 관련																																			   ┃
	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/

//로그인창 이동
function MemberLogin(){
	if(confirm("회원 로그인 후 이용 가능합니다. \n\n지금 바로 로그인 하시겠습니까? ")){
		location.href="../member/login.php?reurl="+$("#reurl").val();
	}
}

//로그인 후 주문페이지 이동
function orderLogin(obj){

	if(!inputChk(obj.userid, "아이디를 입력해 주세요.")) return false;
	if(!inputChk(obj.passwd, "비밀번호를 입력해 주세요.")) return false;

	$.post("../source/shop/login_pro.php",{mode:"login", userid:obj.userid.value, passwd:obj.passwd.value}, function(data) {
		if(data=="Y"){
			obj.action="../order/order.php";
			obj.submit();
		}else{
			alert(data);
			obj.userid.value="";
			obj.passwd.value="";
			obj.userid.focus();
		}
	});
	return false;
}

//재능등록 폼 체크
function talCheck(mode){
	var obj=document.product;

	// console.log(obj.price.value);

	if(mode=="write" || mode=="write_re" || mode=="modify"){
		if(!inputChk(obj.code1, "카테고리를 입력해 주세요.")) return false;
		if($("#code2 option").size()>1){
			if(!inputChk(obj.code2, "2차 카테고리를 입력해 주세요.")) return false;
		}
		if(!inputChk(obj.title, "제목을 입력해 주세요.")) return false;
		if(!inputChk(obj.price, "재능가격을 입력해 주세요.")) return false;
		if(obj.price.value < 5) { alert('재능가격을 5000원 이하로 할 수 없습니다.'); obj.price.focus(); return false; }

		if(!inputChk(obj.period, "작업일을 입력해 주세요.")) return false;
		if(!inputChk(obj.dlv_price, "배송비를 입력해 주세요.")) return false;
		if($("#previmg1").attr("src")=="../images/board/profileIcoConfirm_4.png" && mode!="modify"){
			alert("메인사진을 등록해 주세요.");
			return false;
		}

		if($("#mainimg").size()>1 && mode!="modify"){
			if(!inputChk(obj.mainimg, "메인사진을 등록해 주세요.")) return false;
		}

		if(!inputChk(obj.content, "재능 상세내용을 입력해 주세요.")) return false;
		if(!inputChk(obj.instruction, "구매자 지시사항을 입력해 주세요.")) return false;
		if(!inputChk(obj.call_start, "문의가능시간을 입력해 주세요.")) return false;
		if(!inputChk(obj.call_end, "문의가능시간을 입력해 주세요.")) return false;
	}else if(mode=="del") {
		if(really()) {
			if(really_msg('정말 삭제 하시겠습니까? 다시 한번 확인 해 주세요!\n게시글 복구는 문의 바랍니다.')) {
				obj.mode.value="hidden";
				obj.submit();
				return true;
			}
			else return false;
		} else {
			return false;
		}
	}
	else{
		obj.mode.value="hidden";
	}

	// 그냥 write는 확인용. re가 등록!
	if(mode!="write") {
		if(confirm("정말 등록하시겠습니까?")){
			obj.submit();
			return true;
		}
	} else if(mode=="write") {
		// document.getElementsByClassName('script_layer')[0].style.display = 'block';
		return true;
	}
	return false;
}

//등록 카테고리 선택
$(function(){
	$("#code1").on("change",function(){
		$.getJSON("process.php", {mode:"category",code:$("#code1").val()}, function(json){

			var tlen = json.content.length;
			$("#code2").find("option:gt(0)").remove();

			for(i=0; i<tlen; i++){
				jcode=json.content[i].code;
				jname=json.content[i].category;
				jguide=json.content[i].guide;
				if(jcode!=""){
					$("#code2").find("option").end().append("<option value='"+jcode+"' title='"+jguide+"'>"+jname+"</option>");
				}
			}

		});
	});
});


//등록 카테고리 선택
function selCategory(level){
	if(level==1){
		$.getJSON("process.php", {mode:"category",code:$("#code1").val()}, function(json){
			var tlen = json.content.length;
			$("#code2").find("option:gt(0)").remove();
			for(i=0; i<tlen; i++){
				jcode=json.content[i].code;
				jname=json.content[i].category;
				jguide=json.content[i].guide;
				if(jcode!=""){
					$("#code2").find("option").end().append("<option value='"+jcode+"' title='"+jguide+"'>"+jname+"</option>");
				}
			}
		});
	}else{

		var msg_val=$("#code2 option:selected").attr("title");
		$("#msgtxt6").text((msg_val?msg_val:"준비중"));
		$('#helpMsg6').show();

	}
}

//메인이미지 선택
$(function(){
	$(".mainimg").click(function() {
		prodreg_frm.$("#upload_file").click();
	});
});


//등록페이지 레이어
$(function(){
	$("#insTeBtn").on("mouseover",function(){
		$(".insert_term").show();
	});
	$("#insTeBtn").on("mouseout",function(){
		$(".insert_term").hide();
	});
	$("#tTitle").on("mouseover",function(){
		$(".insert_title").show();
	});
	$("#tTitle").on("mouseout",function(){
		$(".insert_title").hide();
	});
	$("#previmg1").on("mouseover",function(){
		$(".insert_mainImg").show();
	});
	$("#previmg1").on("mouseout",function(){
		$(".insert_mainImg").hide();
	});
	$("#mainDes").on("mouseover",function(){
		$(".insert_des").show();
	});
	$("#mainDes").on("mouseout",function(){
		$(".insert_des").hide();
	});
	$("#buy").on("mouseover",function(){
		$(".insert_buy").show();
	});
	$("#buy").on("mouseout",function(){
		$(".insert_buy").hide();
	});
	$("#hp").on("mouseover",function(){
		$(".insert_hp").show();
	});
	$("#hp").on("mouseout",function(){
		$(".insert_hp").hide();
	});
	$("#time").on("mouseover",function(){
		$(".insert_time").show();
	});
	$("#time").on("mouseout",function(){
		$(".insert_time").hide();
	});
});

//재능구매
$(function(){
	//옵션선택시
	$("input[name='opt[]']").click(function(){

		var optPrice=0;
		var qty=$("#qty").val();

		$("input[name='opt[]']:checked").each(function(){
			optPrice=optPrice+Number($(this).attr("title"));
		});

		var total_price=(optPrice+Number(document.tranMgr.price.value))*qty+Number(document.tranMgr.dlv_price.value);

		$("#optPrice").text(setComma(optPrice)+" 원");
		$("#optQty").text(setComma(qty)+" 개");
		$("#totalPrice").text(setComma(total_price));
	});

	//옵션선택시
	$("#qty").change(function(){
		var optPrice=0;
		var qty=$("#qty").val();

		$("input[name='opt[]']:checked").each(function(){
			optPrice=optPrice+Number($(this).attr("title"));
		});

		var total_price=(optPrice+Number(document.tranMgr.price.value))*qty+Number(document.tranMgr.dlv_price.value);

		$("#optPrice").text(setComma(optPrice)+" 원");
		$("#optQty").text(setComma(qty)+" 개");
		$("#totalPrice").text(setComma(total_price));
	});

	//판매자 연락처 보기
	$("#telBtn").mouseover(function(){
		$(".tel_info").show();
	});

	$("#telBtn").mouseout(function(){
		$(".tel_info").hide();
	});
});

//주문시 회원정보 업데이트
$(function(){
	$("#upbtn").click(function(){
		$.post("../member/member_pro.php",{mode:"update", hp:$("#hp1").val()+"-"+$("#hp2").val()+"-"+$("#hp3").val()}, function(data) {
			if(data=="Succ"){
				alert("회원정보가 변경되었습니다.");
			}
		});
	});
});

//쪽지 보관
function message_storage(form,el){
	if($("input:checkbox[name='"+el+"']:checked").length<1){
		alert("최소 하나 이상의 글을 선택해 주세요."); return;
	}else{
		form.mode.value="storage";
		form.submit();
	}
}

//쪽지 사용자 차단/해제 (true, false)
function message_reject(block_idx, flag) {
	$.post("../mypage/msg_pro.php",{mode:"reject", blockno: block_idx, reject: flag}, function(data) {
		if(data){
			alert(data);
			location.reload();
			window.opener.location.reload();
		}
	});
}

//체크박스 일괄 삭제
function storage_del(form,el){
	if($("input:checkbox[name='"+el+"']:checked").length<1){
		alert("최소 하나 이상의 글을 선택해 주세요."); return;}
	else{
		if(confirm("선택하신 글을 모두 삭제하시겠습니까?")){
			form.mode.value="storage_del";
			form.submit();
		}
	}
}

//제품 판매중지
function sellStop(idx,state){
	$.post("../product/process.php",{mode:"update", idx:idx, state:state}, function(data) {
		if(data=="Succ"){
			alert("판매 상태가 변경되었습니다.");
			document.location.reload();
		}
	});
}


/* ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	┃ 마이페이지 관련																																	   ┃
	┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/

//판매,구매자 메시지 등록
$(function(){

	//주문취소, 문제해결 탭
	$("#buy_msg").click(function(){
		$(".buy_message").show();
		$(".buy_complete").hide();
		$(".buy_cancel").hide();

		$(this).children("img").attr("src","../images/board/mypageBtn_msg_ov.gif");
		$("#buy_com").children("img").attr("src","../images/board/mypageBtn_complete.gif");
		$("#buy_claim").children("img").attr("src","../images/board/mypageBtn_cancel.gif");

		return false;
	});


	//작업완료 탭
	$("#buy_com").click(function(){
		$(".buy_message").hide();
		$(".buy_complete").show();
		$(".buy_cancel").hide();

		$(this).children("img").attr("src","../images/board/mypageBtn_complete_ov.gif");
		$("#buy_msg").children("img").attr("src","../images/board/mypageBtn_msg.gif");
		$("#buy_claim").children("img").attr("src","../images/board/mypageBtn_cancel.gif");

		return false;
	});

	//주문취소, 문제해결 탭
	$("#buy_claim").click(function(){
		$(".buy_message").hide();
		$(".buy_complete").hide();
		$(".buy_cancel").show();

		$(this).children("img").attr("src","../images/board/mypageBtn_cancel_ov.gif");
		$("#buy_msg").children("img").attr("src","../images/board/mypageBtn_msg.gif");
		$("#buy_com").children("img").attr("src","../images/board/mypageBtn_complete.gif");
		return false;
	});

	//메시지보내기,작업배송완료 탭
	$(".all_tab li a").click(function(){
		$(".buy_message").show();
		$(".buy_cancel").hide();

		$(".buy_message").hide();
		$(".all_tab li").removeClass("on");
		$(".buy_message").eq($(".all_tab li a").index(this)).show();
		$(".all_tab li").eq($(".all_tab li a").index(this)).addClass("on");
		return false;
	});
});




$(function(){
	//주문취소, 문제해결
	$("input[name='cancel']").click(function(){
		$(".claim_tab").hide();
		$(".claim_tab").eq($("input[name='cancel']").index(this)).show();
	});
});

//제품 판매중지
function processOrder(mode,order_code,rcvno,state){
	$.post("../mypage/buy_pro.php",{mode:mode, order_code:order_code, rcvno:rcvno, state:state}, function(data) {
		if(data=="Succ"){
			document.location.reload();
		}else{
			alert(data);
			document.location.reload();
		}
	});
}

//제품 판매중지
function processOrder_adm(mode,order_code,rcvno,state){
	$.post("../../mypage/buy_pro.php",{mode:mode, order_code:order_code, rcvno:rcvno, state:state}, function(data) {
		if(data=="Succ"){
			document.location.reload();
		}else{
			alert(data);
			document.location.reload();
		}
	});
}

//구매후기 오버이미지
$(function(){
	$(".right_review").mouseover(function(){
		$(".right_review").removeClass("over");
		$(this).addClass("over");
	});
	$(".right_review").mouseout(function(){
		$(".right_review").removeClass("over");
	});
});

//재능 홍보하기
function clipCopy(str){
	var copiedtext = "";
	var doc = document.body.createTextRange();
	doc.moveToElementText(document.all(str));
	doc.execCommand("copy");
	copiedtext = window.clipboardData.getData("Text");

	alert("클립보드에 복사되었습니다. Ctrl+v 또는 마우스 오른쪽 버튼을 클릭하여 붙여넣기 하시면 됩니다.");
	return false;
}

//최소글자수
function minText(str,len){
	if($('#'+str).val().length<len){
		alert("메시지가 너무 짧습니다.");
		return false;
	}else{
		return true;
	}
}


//쪽지 전송시 차단 키워드 체크
function msgChk(){

	if(!inputChk(document.fo.uid, "받은사람을 입력해 주세요.")) return false;
	if(!inputChk(document.fo.content, "내용을 입력해 주세요.")) return false;

	$.post("./msg_block.php",{uid:$("#uid").val(), content:$('#content').text()}, function(data) {

		if(data=="Succ"){
			document.fo.submit();
		}else{
			if(confirm("연락처나 이메일등 직거래를 유도하는 내용이 포함되어 있을 시 \n이용이 제한될 수 있습니다. 메시지를 보내시겠습니까?")){
				document.fo.submit();
			}else{
				return false;
			}
		}
	});
}

//프로필 지역가져오기
$(function(){
	$("#sido").change(function(){

		$.getJSON("../member/member_pro.php",{mode:"area", sido:$("#sido").val()}, function(json) {

			var tlen = json.content.length;
			var sel_name=document.getElementById("gugun");

			sel_name.options.length=0;

			if(json.content[0].gugun){
				sel_name.options.length=1;
				sel_name.options[0].text= "선택";
				sel_name.options[0].value= "";

				for(i=0; i<tlen; i++){
					gugun=json.content[i].gugun;
					if(gugun!=""){
						sel_name.options.length++;
						sel_name.options[i+1].text= gugun;
						sel_name.options[i+1].value= gugun;
					}
				}
			}
		});

	})
});

//이메일 인증
$(function(){
	$("#mail_button").on("click",function(){
		//아이디, 이메일 중복체크
		$.ajax(
		{
			type: "post",
			dataType: "html",  //xml,html,jeon,jsonp,script,text
			url: "../member/member_pro.php",
			data: {
				mode:"email",
				email:$("#email").val()
			},
			async: true,
			cache: false,
			success: function(data){
					alert(data);
				if(data=="Succ"){
					alert("입력하신 메일로 인증메일이 발송되었습니다.");
					return false;
				}else if(data=="login"){
					alert("세션이 종료되었습니다. 다시 로그인 후 이용해 주세요.");
					location.reload();
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
