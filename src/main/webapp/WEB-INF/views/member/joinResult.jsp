<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp"/>
<c:import url="/WEB-INF/views/temp/header.jsp"/>

<script type="text/javascript">
	$(function(){
		$('.mainButton').click(function(){
			location.href="/Project_final/index/home";
		});
	});
</script>

<style type="text/css">
.contents{
	margin: 0 auto 80px auto;
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
	width:350px;
	height: 362px;
	text-align: center;
	margin: 0px auto 0 auto;
	
}
.completeInner h3{
	margin-bottom: 20px;
}
.text{
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 20px;
}
.memberInfo{
	border: 1px solid #e7e7e7;
	height: 140px;
}
.info{
	background : #fcfcfc url("<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_warning.gif") no-repeat 12px center;
	border-bottom: 1px solid #e7e7e7;
	padding: 10px 0 10px 32px;
	font-size: 12px;
	text-align: left;
}
.memberInfo ul {
	float: left;
    margin-left: 4px;
    width: 318px;
    padding: 13px 0 14px 12px;
}
.memberInfo ul li {
	margin: 0 0 4px;
	text-align: left;
}
.memberInfo ul li strong {
	padding: 0 0 0 10px;
    width: 60px;
    color: #2e2e2e;
    font-weight: normal;
    font-size: 12px;
    display: inline-block;
    background: url(<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_login2.gif) no-repeat 0 3px;
}
.memberInfo ul li span {
	font-size: 12px;
    width: 248px;
    color: #333;
}
.selectButton {
	width: 350px;
	height: 44px;
	margin: 30px auto 100px auto;
}
.loginButton {
	width: 151px;
	height: 44px;
	padding: 10.5px 55px;
	border-radius: 5px;
	background: #363636;
	cursor: pointer;
}
.loginButton span {
	margin-left: 5px;
	color: white;
	font-weight:bold;
	font-size: 12px;
}
.mainButton {
	width: 151px;
	height: 44px;
	padding: 10.5px 52px;
	border-radius: 5px;
	background: #9b9b9b;
	cursor: pointer;
}
.mainButton span {
	color: white;
	font-weight:bold;
	font-size: 12px;
}
</style>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > WELCOME</h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name">WELCOME</h3>
			</div>
		</div>
		<div class="joinComplete">
			<div class="completeInner">
				<h3><img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/icon/ico_guide_result.png"></h3>
				<p class="text">회원가입이 완료 되었습니다.</p>
				<div class="memberInfo">
					<p class="info">저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
					<ul>
						<li><strong>아이디</strong>
							<span class="userId">${member.id}</span>
						</li>
						<li>
							<strong>이름</strong>
							<span class="userName">${member.name}</span>
						</li>
						<li>
							<strong>이메일</strong>
							<span class="userEmail">${member.email}</span>
						</li>
					</ul>
				</div>
				<div class="selectButton">
					<a class="loginButton"><span>로그인</span></a>
					<a class="mainButton"><span>메인화면</span></a>
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