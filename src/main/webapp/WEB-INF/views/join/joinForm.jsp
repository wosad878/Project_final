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
<script type="text/javascript">
	$(document).ready(function(){
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
</script>
<style type="text/css">
	.contents{
		margin: 0 auto;
		min-width: 1100px;
		max-width: 1200px;
	}
	.product_name{
		height: 60px;
	}
	.page_location{
		height: 30px;
	}
	.page_location h6{
		font-size: 11px;
		float:right;
		color: #757575;
		padding-top: 10px;
		box-sizing: border-box;
	}
	.name_inner{
		height: 30px;
	}	
	.pro_name{
		font-weight:bold;
		box-sizing: border-box;
		padding-top: 10px;
	}
	.typeWrite{
		margin-top: 30px;
		font-size: 11px;
	}
	.typeWrite table {
		width: 100%;
		border: 1px solid #e7e7e7;
	    border-bottom-width: 0;
	    color: #353535;
	    margin-bottom: 40px;
	}
	.typeWrite table th{
		width: 151px;
	    padding: 12px 0 11px 18px;
	    text-align: left;
	    font-weight: normal;
	    vertical-align: middle;
	    background-color: #fbfbfb;
	    border-right:1px solid #e7e7e7;
	    border-bottom: 1px solid #e7e7e7;
	}
	.typeWrite table td{
		text-align: left;
	    font-weight: normal;
	    vertical-align: middle;
		background-color: white; 
		padding: 12px 10px 11px;
		border-right:1px solid #e7e7e7;
	    border-bottom: 1px solid #e7e7e7;
	}
	.typeWrite table td label {
		position:relative;
		top:-3px;
	}
	.member_type1_inner{
		margin: 10px 0 0 5px;
	}
	.phone_inner a {
		
	}
	.phone_inner a img{
		display: block;
		margin-bottom: 10px;
	}
	.email_inner{
		display: none;
	}
	.t2 input{
		height: 22px;
		border:1px solid #e7e7e7;
		margin-right: 10px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="contents">
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
					<td><input class="member_type" type="radio" name="member_type" checked="checked"><label>개인회원</label></td>
				</tr>
				<tr>
					<th>회원인증 <img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/icon/ico_required.png"></th>
					<td>
						<input class="phone" type="radio" name="member_type1" value="1" checked="checked"><label>휴대폰 인증</label>
						<input class="email" type="radio" name="member_type1" value="2"><label>이메일 인증</label><br>
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
			<form action="">
				<table>
					<tr>
						<th>아이디 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input type="text" name="id" style="width: 134px;"><span>(영문소문자/숫자, 4~16자)</span></td>
					</tr>
					<tr>
						<th>비밀번호 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input type="text" name="password" style="width: 134px;"><span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</span></td>
					</tr>
					<tr>
						<th>비밀번호 확인 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input type="text" name="password2" style="width: 134px;"></td>
					</tr>
					<tr>
						<th>이름 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td><input type="text" name="name" style="width: 134px;"></td>
					</tr>
					<tr>
						<th>주소 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td></td>
					</tr>
					<tr>
						<th>일반전화</th>
						<td></td>
					</tr>
					<tr>
						<th>휴대전화 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td></td>
					</tr>
					<tr>
						<th>이메일 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
		<div style="margin-bottom: 5px; height: 20px;"> 
			<h3 style="float:left;font-size: 13px;font-weight:bold;">추가정보</h3>
		</div>
		<div class="typeWrite t3">
			<table>
				<tr>
					<th>생년월일 <img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
			</table>
		
		</div>
		
	</div>
</div>
</body>
</html>