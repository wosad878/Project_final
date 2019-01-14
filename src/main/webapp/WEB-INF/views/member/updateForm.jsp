<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp" />
<c:import url="/WEB-INF/views/temp/header.jsp" />
<link href="<%=pageContext.getServletContext().getContextPath()%>/resources/css/updateForm.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/resources/js/updateForm.js"></script>
<script type="text/javascript">
	$(function(){
		
		if('${message}' != ""){
			alert('${message}');
		}
		
		$(".tel_first_select option[value='${tel[0]}']").attr('selected','ture');
		$("#phone_first_select option[value='${phone[0]}']").attr('selected','ture');
		$("#selectEmail option[value='${email[1]}']").attr('selected','ture');
		
		if('${member.smscheck}' =="check"){
			$("#smscheckOn").attr('checked','true');
		}else{
			$("#smscheckOff").attr('checked','true');
		}
		if('${member.emailcheck}' =="check"){
			$("#emailcheckOn").attr('checked','true');
		}else{
			$("#emailcheckOff").attr('checked','true');
		}
	});
</script>
</head>
<body>
<div class="container">
	<div class="contents">
		<form id="memberData" action="./updateForm" method="post" >
			<div class="product_name">
				<div class="page_location">
					<h6>Home > My Profile</h6>
				</div>
				<div class="name_inner">
					<h3 class="pro_name">내 프로필</h3>
				</div>
			</div>
			<div class="typeWrite t1">
				<table>
					<tr>
						<th>회원구분 <img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/icon/ico_required.png"></th>
						<td><input class="member_type" type="radio" name="membertype" checked="checked" value="normal"><label>개인회원</label></td>
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
						<td><input class="id" type="text" name="id" style="width: 134px;" value="${member.id}" readonly="readonly"><span>(영문소문자/숫자, 4~16자)</span>
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
						<td><input class="name" type="text" name="name" style="width: 134px;" readonly="readonly" value="${member.name}"></td>
					</tr>
					<tr>
						<th>주소 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input id="location1" type="text" name="zip" readonly="readonly" style="width: 90px;margin-bottom: 5px;" value="${addr[0]}">
							<a class="adrbutton" onclick="goPopup()" style="cursor:pointer;"><i class="fa fa-map-o" aria-hidden="true" style=" margin-right:5px;"></i>주소검색</a><br>
							<input id="location2" type="text" name="road" readonly="readonly" style="width: 300px;margin-bottom: 5px;" value="${addr[1]}"><span>기본주소</span><br>
							<input id="location3" type="text" name="detail" style="width: 300px;" value="${addr[2]}"><span>나머지주소</span>
							<input id="address" type="hidden" name ="address"></td>
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
							<input class="tel_first" name="tel_first" type="hidden" value="${tel[0]}">
							<input class="tel_middle" numberOnly name ="tel_middle" type="text" style="width:70px;margin-right:10px;margin-left:5px;" value="${tel[1]}">-
							<input class="tel_last" numberOnly name ="tel_last" type="text" style="width:70px;margin-left:5px;" value="${tel[2]}">
							<input id="tel" type="hidden" name ="tel"></td>
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
								<input class="phone_first" name="phone_first" type="hidden" value="${phone[1]}">
								<input class="phone_middle" numberOnly name="phone_middle" type="text" style="width:70px;margin-right:10px;margin-left:5px;" value="${phone[1]}">-
								<input class="phone_last" numberOnly name="phone_last" type="text" style="width:70px;margin-left:5px;" value="${phone[2]}">
								<input id="phone" type="hidden" name ="phone"></td>
					</tr>
					<tr>
						<th>SMS 수신여부 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input id="smscheckOn" class="smscheck" type="radio" name="smscheck1" value="check"/><label for="smscheckOn">수신함</label>
							<input id="smscheckOff" class="smscheck" type="radio" name="smscheck1" value="notCheck"/><label for="smscheckOff">수신안함</label>
							<input id="smscheck1" type="hidden" name="smscheck">
							<br><span style="display:inline-block;margin-top:10px;">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</span></td>
					</tr>
					<tr>
						<th>이메일 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input class="email_first" name="email_first" type="text" style="margin-right:10px;" value="${email[0]}">@
							<input class="email_last" name="email_last" type="text" readonly="readonly" style="margin-right:10px;margin-left:5px;" value="${email[1]}">
							<input id="email" type="hidden" name ="email">
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
					<tr>
						<th>이메일 수신여부 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input id="emailcheckOn" class="emailcheck" type="radio" name="emailcheck1" value="check"/><label for="emailcheckOn">수신함</label>
							<input id="emailcheckOff" class="emailcheck" type="radio" name="emailcheck1" value="notCheck"/><label for="emailcheckOff">수신안함</label>
							<input id="emailcheck1" type="hidden" name="emailcheck">
							<br><span style="display:inline-block;margin-top:10px;">쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</span></td>
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
						<td><input class="year" numberOnly name="year" type="text" value="${birth[0]}">년
							<input class="month" numberOnly name="month" type="text" value="${birth[1]}">월
							<input class="date" numberOnly name="date" type="text" value="${birth[2]}">일
							<input id="birth" type="hidden" name ="birth">
							<span style="margin-left: 5px;">( xxxx-xx-xx )</span></td>
					</tr>
				</table>
			</div>
			<div class="selectButton">
				<a class="positive"><i class="fa fa-check" aria-hidden="true"></i><span>회원정보수정</span></a>
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