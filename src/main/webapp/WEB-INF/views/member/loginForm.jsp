<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- RSA 자바스크립트 라이브러리 -->
<script type="text/javascript" src="/Project_final/resources/js/RSA/jsbn.js"></script>
<script type="text/javascript" src="/Project_final/resources/js/RSA/rsa.js"></script>
<script type="text/javascript" src="/Project_final/resources/js/RSA/prng4.js"></script>
<script type="text/javascript" src="/Project_final/resources/js/RSA/rng.js"></script>	

<!-- RSA 암호화 처리 스크립트 -->

<c:import url="/WEB-INF/views/temp/link.jsp"/>
<c:import url="/WEB-INF/views/temp/header.jsp"/>

<script type="text/javascript">
	$(function(){
		
		$('.loginButton').click(function(){
			check();
		});
		if('${message}' != ""){
			alert('${message}');
		}
	});
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             check();
        }
	}

	function check(){
		var check = false;
		var message = "";
		var uid = $('#id').val();
		var pwd = $('#password').val();
		if(uid != "" && pwd != ""){
			//RSA 암호화 생성
			var rsa = new RSAKey();
			rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
			
			//사용자 계정정보를 암호화 처리
			uid = rsa.encrypt(uid);
			pwd = rsa.encrypt(pwd);
			$.ajax({
				type:"POST",
				url:"../ajax/login_proc",
				data:{user_id:uid, user_pwd:pwd},	//사용자 암호화된 계정정보를 서버로 전송
				dataType:"json",
				success:function(msg){
					if(msg.state == "true"){
			 			$('#logincheck').submit();
// 						location.href = "./";
					}else if(msg.state == "false"){
						alert("로그인에 실패하였습니다. 아이디 패스워드를 확인하여주세요.");
					}else{
						alert("잘못된 경로로 접근하였습니다. 암호화 인증에 실패하였습니다."); 
					}
				}
			})
			
			
		}else{
			if($('#id').val() == "") {
				message = "아이디 항목은 필수 입력값입니다.";
				$('#id').focus();
			}else if($('#password').val() == "") {
				message = "패스워드 항목은 필수 입력값입니다.";
				$('#password').focus();
			}
			alert(message);
		}
	}
</script>

<style type="text/css">
.contents{
	margin: 0 auto 150px auto;
	min-width: 1100px;
	max-width: 1200px;
	min-height: 100%;
}
.product_name{
	height: 60px;
	margin-bottom: 20px;
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
.joinComplete{
	padding-top: 40px;
}
.completeInner{
	width:430px;
	height: 373px;
	padding: 30px 0;
	box-sizing: border-box;
	text-align: center;
	margin: 0px auto 0 auto;
	border: 1px solid #e8e8e8;
	border-radius: 20px;
}
.loginInfo{
	margin-bottom: 20px;
}
.loginInfo h3{
	position: relative;
	letter-spacing: 1px;
	bottom: 0;
}
.loginInner{
	width: 330px;
	margin: 0 auto;
}
.idbox{
	border: 1px solid #e7e7e7;
	text-align: left;
}
.idbox span{
	float: left;
    width: 90px;
    height: 34px;
    line-height: 34px;
    font-size: 9px;
    letter-spacing: 1px;
    padding: 0 0 0 10px;
    font-weight: 400;
    color: #111;
}
.pwbox span{
	float: left;
    width: 90px;
    height: 34px;
    line-height: 34px;
    font-size: 9px;
    letter-spacing: 1px;
    padding: 0 0 0 10px;
    font-weight: 400;
    color: #111;
}
#id{
	width:220px;
	height:34px;
	padding: 0;
	border: 0;
}
#id:focus {
	outline: 0;
}
.pwbox{
	border: 1px solid #e7e7e7;
	text-align: left;
	margin-top: 5px;
}
#password{
	width:220px;
	height:34px;
	padding: 0;
	border: 0;
}
#password:focus {
	outline: 0;
}
.seq{
	margin: 10px 0;
	height: 12px;
}
.seq span{
	font-size: 12px;
	float: left;
}
.seq img{
	float: left;
}
.loginButton{
	display: block;
    border-radius: 0;
    width: 100%;
    height: 54px;
    line-height: 54px;
    border: 1px solid #111;
    background: #222;
    color: #fff;
    font-size: 13px;
    font-weight: 500;
    letter-spacing: 1px;
}
.loginButton:visited {
	color:#fff;
}
.loginButton:link {
	color:#fff;
}
.findmember{
	overflow: hidden;
    padding: 13px 0 12px;
    margin: 0 0 15px 0;
    border-bottom: 1px solid #eaeaea;
}
.findmember li{
	float:left;
	padding-right: 5px;
}
.findmember li a{
	letter-spacing: 0;
	font-size:11px;
}
.joinButton{
	display: block;
    border-radius: 0;
    width: 100%;
    height: 54px;
    line-height: 54px;
    border: 1px solid #8f8f8f;
    background: #8f8f8f;
    color: #fff;
    font-size: 13px;
    font-weight: 500;
    letter-spacing: 1px;
}
.joinButton:link {
	color:#fff;
}
.joinButton:visited{
	color:#fff;
}

</style>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > Login</h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name"></h3>
			</div>
		</div>
		<div class="joinComplete">
			<div class="completeInner">
				<div class="loginInfo">
					<h3>MEMBER LOGIN</h3>
				</div>
				<div class="loginInner">
					<form id="logincheck" action="./loginForm" method="post" >
						<c:if test="${not empty cartDTO}">
							<input type="hidden" name="proname" value="${cartDTO.proname}">
							<input type="hidden" name="quantity" value="${cartDTO.quantity}">
						</c:if>
					</form>
						<input type="hidden" id="RSAModulus" value="${RSAModulus}">
						<input type="hidden" id="RSAExponent" value="${RSAExponent}">
						<div class="idbox">
							<span>ID</span>
							<input id="id" type="text" name="id">
						</div>
						<div class="pwbox">
							<span>PASSWORD</span>
							<input id="password" type="password" name="password" onkeyup="enterkey()">
						</div>
					<div class="seq">
						<p>
							<img src="/Project_final/resources/images/icon/ico_security.png">
							<span>보안접속</span>
						</p>
					</div>
					<a class="loginButton" href="#none">로그인</a>
					<ul class="findmember">
						<li><a href="/Project_final/member/findId">아이디찾기</a></li>
						<li><a href="/Project_final/member/findPw">비밀번호찾기</a></li>
					</ul>
					<a class="joinButton" href="/Project_final/member/joinForm">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/temp/footer.jsp"/>
	</div>
</div>
</body>
</html>