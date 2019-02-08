$(document).ready(function(){
	var checkId = false;
	var checkPw = false;
	var message = "";
	var flag = false;
	
	$('.negative').click(function(){
		history.back();
	});
	
	$('.positive').click(function(){
		
		if(flag == false){
			if(checkPw){
				flag = true;
			}else{
				message = "비밀번호를 확인해 주세요.";
				flag = false;
				$('.password').focus();
			}
		}
		
		if(flag){
			if($('#location1').val() != "" && $('#location2').val() != ""){
				flag = true;
			}else{
				message = "주소가 입력되지 않았습니다.";
				flag = false;
				$('#location1').focus();
			}
		}
		if(flag){
			if($('#phone_first').val() != "" && $('.phone_middle').val() != "" && $('.phone_last').val() != ""){
				flag = true;
			}else{
				message = "휴대폰번호를 입력해 주세요.";
				flag = false;
				$('.phone_middle').focus();
			}
		}
		if(flag){
			if($('.email_first').val() != "" && $('.email_last').val() !=""){
				$('#email').val($('.email_first').val()+"@"+$('.email_last').val());
				flag = true;
			}else{
				message = "이메일을 입력해 주세요.";
				flag = false;
				$('.email_first').focus();
			}
		}
		if(flag){
			if($('.year').val() != "" && $('.month').val() != "" && $('.date').val() != ""){
				$('#birth').val($('.year').val()+"-"+$('.month').val()+"-"+$('.date').val());
				flag = true;
			}else{
				message = "생년월일을 입력해 주세요.";
				flag = false;
				$('.year').focus();
			}
		}
		
		if(flag){
			if($('.tel_last').val() == "" || $('.tel_middle').val() == ""){
				$('#tel').removeAttr('name');
			}
			
			if($('#smscheckOn').is(':checked')){
				$('#smscheck1').val('check');
			}else{
				$('#smscheck1').val('notCheck');
			};
			if($('#emailcheckOn').is(':checked')){
				$('#emailcheck1').val('check');
			}else{
				$('#emailcheck1').val('notCheck');
			};
			$('#memberData').submit();
		}else{
			alert(message);
		}
	});
	
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$('#selectEmail').blur(function(){
		var email = $('#selectEmail option:selected').val();
		
		if(email != 'etc'){
			$('.email_last').val(email);
			$('.email_last').attr('readonly','readonly');
		} else{
			$(".email_last").removeAttr('readonly');
			$('.email_last').val("");
			$('.email_last').focus();
		}
	});
	
	$('#phone_first_select').blur(function(){
		var phoneNo = $('#phone_first_select option:selected').val();
		$('.phone_first').val(phoneNo);
	});
	
	$('.tel_first_select').blur(function(){
		var telNo = $('.tel_first_select option:selected').val();
		$('.tel_first').val(telNo);
	});
	
	$('.password').blur(function(){
		var message = "";
		if($('.password2').val() != null && $('.password2').val() != ""){
			var pw = $('.password').val();
			var check = checkingPw(pw);
			if(check == 1){
				if($('.password').val() == $('.password2').val()){
					message = "";
					checkPw = true;
				}else {
					message = "비밀번호가 일치하지 않습니다.";
					checkPw = false;
				}
			}else{
				message = "비밀번호를 확인 해 주세요.";
				checkPw = false;
			}
			$('.checkPw').html(message);
		}
	});
	
	$('.password2').blur(function(){
		var message = "";
		var pw = $('.password2').val();
		if($('.password2').val() != $('.password').val()){
			message = "비밀번호가 일치하지 않습니다.";
			checkPw = false;
		}else{
			var check = checkingPw(pw);
			if(check == 1){
				message = "";
				checkPw = true;
			}else{
				message = "비밀번호를 확인 해 주세요.";
				checkPw = false;
			}
		}
		$('.checkPw').html(message);
	});
	
});

function checkingPw(pw){
	var pattern = new RegExp("^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$");
	var check = pattern.test(pw);
	var result = 0;
	if(check){
		result = 1;
	}
	return result;
}
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";


function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/Project_final/juso/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById("location1").value = zipNo;
	document.getElementById("location2").value = roadAddrPart1;
	document.getElementById("location3").value = addrDetail;
}
