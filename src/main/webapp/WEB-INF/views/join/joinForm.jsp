<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp"/>
<c:import url="/WEB-INF/views/temp/header.jsp"/>
<link href="<%=pageContext.getServletContext().getContextPath()%>/resources/css/joinForm.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
		var checkId = false;
		var checkPw = false;
		var checkName = false;
		var checkAddr = false;
		var checkPhone = false;
		var checkEmail = false;
		var checkBirth = false;
		var checkAgree = false;
		
		$('.positive').click(function(){
			if($('.name').val() != null && $('.name').val() != ""){
				checkName = true;
			}else{
				checkName = false;
			}
			if($('#location1').val() != null && $('#location1').val() != ""){
				checkAddr = true;
			}else{
				checkAddr = false;
			}
			if($('.phone_first').val() != null && $('.phone_first').val() != "" && $('.phone_middle').val() != null && 
					$('.phone_middle').val() != "" && $('.phone_last').val() != null && $('.phone_last').val() != ""){
				checkPhone = true;
			}else{
				checkPhone = false;
			}
			if($('.email_first').val() != null && $('.email_first').val() != "" && $('.email_last').val() != null && $('.email_last').val() != ""){
				checkEmail = true;
			}else{
				checkEmail = false;
			}
			if($('.year').val() != null && $('.year').val() != "" && $('.month').val() != null && $('.month').val() != "" &&
					$('.date').val() != null && $('.date').val() != ""){
				checkBirth = true;
			}else{
				checkBirth = false;
			}
			if($('#allcheck').is(':checked')){
				checkAgree = true;
			}else{
				checkAgree = false;
			}
			alert(checkId);
			alert(checkPw);
			alert(checkName);
			alert(checkAddr);
			alert(checkPhone);
			alert(checkEmail);
			alert(checkBirth);
			alert(checkAgree);
		});

		
		
		$('.checkE').click(function(){
			if($('.agree1').is(':checked') && $('.agree2').is(':checked')){
				$('#allcheck').prop('checked','checked');
			}else{
				$('#allcheck').removeAttr('checked');
			}
		});
		
		$('#allcheck').click(function(){
			if($("#allcheck").is(':checked')){
				$(".checkE").prop('checked','checked');
			}else{
				$(".checkE").removeAttr('checked');
			}
		});

		$("input:text[numberOnly]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$('#selectEmail').change(function(){
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
		
		$('#phone_first_select').change(function(){
			var phoneNo = $('#phone_first_select option:selected').val();
			$('.phone_first').val(phoneNo);
		});
		
		$('.tel_first_select').change(function(){
			var telNo = $('.tel_first_select option:selected').val();
			$('.tel_first').val(telNo);
		});
		
		$('.password').change(function(){
			var message = "";
			if($('.password2').val() != null && $('.password').val() != ""){
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
			}
			$('.checkPw').html(message);
		});
		
		$('.password2').change(function(){
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
		
		$('.id').change(function(){
			var id = $(this).val();
			$.ajax({
				url:'/Project_final/ajax/checkId',
				type:'post',
				data:{id:id},
				success:function(data){
					var message ="";
					if(data == 1){
						message ="사용 가능 한 아이디 입니다";
						checkId = true;
					}else if(data == 2){
						message ="사용 불가능 한 아이디 입니다";
						checkId = false;
					}else if(data == 3){
						message ="아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.";
						checkId = false;
					}
					$('.idInfo').css('display','block');
					$('.idInfo').children('span').html(message);
				}
			});
		});
		
		$('.adrbutton').click(function(){
			$('adrbutton').removeAttr('href');
		});
		
		$('input:radio[name="member_type1"]').change(function(){
			var check = $('input:radio[name="member_type1"]:checked').val();
			if(check == 1){
				$('.email_inner').css('display','none');
				$('.phone_inner').css('display','block');
			}else if(check == 2){
				$('.email_inner').css('display','block');
				$('.phone_inner').css('display','none');
			}
		});
		
	});
	
	function checkingPw(pw){
		var pattern = new RegExp("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,16}$");
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
		document.getElementById("location2").value = roadAddrPart1;
		document.getElementById("location3").value = addrDetail;
		document.getElementById("location1").value = zipNo;
	}
</script>

</head>
<body>
<div class="container">
	<div class="contents">
		<form action="">
			<div class="product_name">
				<div class="page_location">
					<h6>Home > 회원가입</h6>
				</div>
				<div class="name_inner">
					<h3 class="pro_name">회원가입</h3>
				</div>
			</div>
			<div class="typeWrite t1">
				<table>
					<tr>
						<th>회원구분 <img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/icon/ico_required.png"></th>
						<td><input class="member_type" type="radio" name="member_type" checked="checked" value="normal"><label>개인회원</label></td>
					</tr>
					<tr>
						<th>회원인증 <img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/icon/ico_required.png"></th>
						<td>
							<input class="phone" type="radio" name="member_type1" checked="checked"><label>휴대폰 인증</label>
							<input class="email" type="radio" name="member_type1"><label>이메일 인증</label><br>
							<div class ="phone_inner member_type1_inner">
								<a href=""><img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/btn_certification_mobile.gif"></a>
								<span style="padding-top: 5px;">본인 명의의 휴대폰으로 인증을 진행합니다.</span>
							</div>
							<div class="email_inner member_type1_inner" style="line-height: 20px;">
								기본정보 > 이메일 항목에 입력하신 정보로 본인인증을 진행합니다.<br>
								회원가입 후에 입력하신 이메일 주소로 인증 메일이 발송되오니, 확인해 주시기 바랍니다.
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div style="margin-bottom: 5px; height: 20px;"> 
				<h3 style="float:left;font-size: 13px;font-weight:bold;">기본정보</h3>
				<span style="float:right;font-size: 13px;"><img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"> 필수입력사항</span>
			</div>
			<div class="typeWrite t2">
				<table>
					<tr>
						<th>아이디 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="id" type="text" name="id" style="width: 134px;"><span>(영문소문자/숫자, 4~16자)</span>
							<div class="idInfo"><span></span></div></td>
						
					</tr>
					<tr>
						<th>비밀번호 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="password" type="password" name="password" style="width: 134px;"><span>(영문 대소문자/숫자/특수문자 각 1개 이상 조합, 8~16자)</span></td>
					</tr>
					<tr>
						<th>비밀번호 확인 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="password2" type="password" name="password2" style="width: 134px;"><span class="checkPw"></span></td>
					</tr>
					<tr>
						<th>이름 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="name" type="text" name="name" style="width: 134px;"></td>
					</tr>
					<tr>
						<th>주소 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input id="location1" type="text" name="zip" readonly="readonly" style="width: 90px;margin-bottom: 5px;">
							<a class="adrbutton" onclick="goPopup()" style="cursor:pointer;"><i class="fa fa-map-o" aria-hidden="true" style=" margin-right:5px;"></i>주소검색</a><br>
							<input id="location2" type="text" name="road" readonly="readonly" style="width: 300px;margin-bottom: 5px;"><span>기본주소</span><br>
							<input id="location3" type="text" name="detail" style="width: 300px;"><span>나머지주소</span></td>
					</tr>
					<tr>
						<th>일반전화</th>
						<td><select class="tel_first_select" name="tel_first_select" style="width:80px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;">
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
								<option value="070">070</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
							<input class="tel_first" name="tel_first" type="hidden">
							<input class="tel_middle" numberOnly name ="tel_middle" type="text" style="width:70px;margin-right:10px;margin-left:5px;">-
							<input class="tel_last" numberOnly name ="tel_last" type="text" style="width:70px;margin-left:5px;"></td>
					</tr>
					<tr>
						<th>휴대전화 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><select id="phone_first_select" name="phone_first_select" style="width: 80px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
								<input class="phone_first" name="phone_first" type="hidden" value="010">
								<input class="phone_middle" numberOnly name="phone_middle" type="text" style="width:70px;margin-right:10px;margin-left:5px;">-
								<input class="phone_last" numberOnly name="phone_last" type="text" style="width:70px;margin-left:5px;"></td>
					</tr>
					<tr>
						<th>이메일 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="email_first" name="email_first" type="text" style="margin-right:10px;">@
							<input class="email_last" name="email_last" type="text" readonly="readonly" style="margin-right:10px;margin-left:5px;">
							<select id="selectEmail" style="width:120px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;">
								<option value="" selected="selected">- 이메일 선택 -</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="empas.com">empas.com</option>
								<option value="korea.com">korea.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select></td>
					</tr>
				</table>
			</div>
			<div style="margin-bottom: 5px; height: 20px;"> 
				<h3 style="float:left;font-size: 13px;font-weight:bold;">추가정보</h3>
			</div>
			<div class="typeWrite t3">
				<table>
					<tr>
						<th>생년월일 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="year" numberOnly name="year" type="text" name="">년
							<input class="month" numberOnly name="month" type="text" name="">월
							<input class="date" numberOnly name="date" type="text" name="">일
							<span style="margin-left: 5px;">( xxxx-xx-xx )</span></td>
					</tr>
				</table>
			</div>
			<div style="margin-bottom: 5px; height: 20px;"> 
				<h3 style="float:left;font-size: 13px;font-weight:bold;">전체 동의</h3>
			</div>
			<div class="allCheckArea">
				<input type="checkbox" id="allcheck" name="allcheck"><label for="allcheck"></label>
				<strong>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong>
			</div>
			<div class="agreearea1">
				<div class="agree_left">
					<h3>[필수] 이용약관 동의</h3>
					<div class="content">
						<c:import url="/WEB-INF/views/text/agree1.jsp" />
					</div>
					<p class="agreeCheck">
						<span>이용약관에 동의하십니까?</span> <input id="agreem1" class="agree1 checkE" name="agree1" type="checkbox" /><label for="agreem1">동의함</label>
					</p>
				</div>
				<div class="agree_right">
					<h3>[필수] 개인정보 수집 및 이용 동의</h3>
					<div class="content">
						<c:import url="/WEB-INF/views/text/agree2.jsp" />
					</div>
					<p class="agreeCheck">
						<span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="agreem2" class="agree2 checkE" name="agree2" type="checkbox" /><label for="agreem2">동의함</label>
					</p>
				</div>
			</div>
			<div class="agreearea2">
				<h3>[선택] 쇼핑정보 수신 동의</h3>
				<div class="content">
					<c:import url="/WEB-INF/views/text/agree3.jsp" />
				</div>
				<span>SMS 수신을 동의하십니까? </span> <input id="smscheck" class="smscheck" name="smscheck" type="checkbox" value="check"/><label for="smscheck">동의함</label><br>
				<span>이메일 수신을 동의하십니까?</span> <input id="emailcheck" class="emailcheck" name="emailcheck" type="checkbox"  value="check"/><label for="emailcheck">동의함</label>
			</div>
			<div class="selectButton">
				<a class="positive"><i class="fa fa-check" aria-hidden="true"></i><span>회원가입</span></a>
				<a class="negative"><span>취소</span></a>
			</div>
		</form>
	</div>
</div>
<div class="footer">
	<c:import url="/WEB-INF/views/temp/footer.jsp" />
</div>
</body>
</html>