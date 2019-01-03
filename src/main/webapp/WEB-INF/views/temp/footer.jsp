<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="./bootstrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(".tag li").mouseenter(function(){
			$(this).css("background","#ccc");
			$(this).find("i").css("display","none");
			$(this).find("span").css("display","table-cell");
			$(this).css('top',"-8px")
		});
		$(".tag li").mouseleave(function(){
			$(this).css("background","white");
			$(this).find("i").css("display","table-cell");
			$(this).find("span").css("display","none");
			$(this).css('top',"0")
		});
	});
	
</script>
<style type="text/css">
.footer{
	height: 448px;
	border-top: 1px solid black;
}
.toparea{
	height: 51px;
	border-bottom: 1px solid #ddd;
	padding:10px 0;
	box-sizing: border-box;
}
.toparea_inner{
	width: 1251px;
	margin: 0 auto;
}
.toparea ul {
	padding: 3px 0;
	box-sizing: border-box;
}
.toparea ul li {
	display: inline-block;
	margin-right: 14px;
}
.toparea ul li a span {
	font-size: 13px;
}
.toparea ul li::before{
	width: 1px;
	height: 9px;
	content: "";
	margin: 5px 14px 0 0;
	background: #ddd;
	float: left;
}
.toparea ul li:first-child::before{
	width: 0;
	height: 0;
	background: none;
	margin: 0;
}
.middlearea{
	height: 229px;
	border-bottom: 1px solid #ddd;
	box-sizing: border-box;
	padding: 45px 0;
}
.middle_inner{
	width: 1251px;
	margin: 0 auto;
	min-width: 100px;
}
.middle_inner ul{
	height: 138px;
	min-width: 100px;
}
.middle_inner ul li{
	display: inline-table;
}
.middle_inner ul li::before{
	width: 1px;
	height: 115px;
	background: #ddd;
	margin-right: 30px;
	content: "";
	float: left;
}
.middle_inner ul li:first-child::before{
	width: 0;
	height: 0;
	margin: 0;
}
.middle_inner ul li h3{
	font-weight: bold;
	font-size: 11px;
	margin-bottom: 17px;
}
.customer{
	margin:0 10px;
	
}
.tel{
	font-size: 30px;
	font-weight: bold;
}
.cstime{
	font-size: 11px;
	color: #888;
	margin-top: 17px;
}
.account{
	box-sizing: border-box;
}

.account ul {
	height: auto;
	
}
.account ul li {
	width: 227px;
	display: block;
	line-height: 20px;
	font-size: 11px;
	color: #888;
	margin-right: 30px;
}
.account ul li::before {
	width: 0;
	height: 0;
	margin: 0;
}
.fnb {
	width: 227px;
}
.fnb ul li{
	display: block;
}
.fnb ul li::before{
	width: 0;
	height: 0;
	margin: 0;
}
.fnb ul li a{
	font-size: 12px;
	color: #888;
	line-height: 20px;
}
.return {
	width: 415px;
}
.return p {
	font-size: 11px;
	color: #888;
	line-height: 15px;
}
.return ul li::before {
	width: 0;
	height: 0;
	margin: 0;
}
.tag li{
	width: 50px;
	height: 50px;
	position:relative;
	border: 1px solid #ddd;
	border-radius: 50%;
	margin-top: 15px;
}

.tag li a i {
	width: 50px;
	height: 50px;
    display: table-cell;
    position:relative;
    right: -13px;
    vertical-align: middle;
    font-size: 22px;
    color: #ccc;
    padding-left: 1px;
}
.tag li a span{
	width: 50px;
	height: 50px;
	display: none;
	font-size: 11px;
	color: white;
    vertical-align: middle;
    padding-left: 2px;
}
.bottomarea{
	height: 167px;
	background: #fafafa;
	margin-top: 46px;
}
.bottom_inner{
	width: 1251px;
	margin: 0 auto;
	padding-top: 50px;
	min-width: 100px;
}
.left{
	float: left;
}
.left ul{
	display: table;
}
.left ul li{
	margin-right: 20px;
	font-size: 11px;
	line-height: 20px;
	display: inline;
	color: #888;
	font-weight: bold;
}
.left ul li span {
	color: #5a5a5a;
	font-weight: bold;
}
.right{
	float: right;
}
.right ul{
	margin-top: 15px;
	position: relative;
	left: -25px;
}
.right ul li{
	display: inline;
}

</style>
</head>
<body>
<div class="footer">
	<div class="toparea">
		<div class="toparea_inner">
			<ul>
				<li><a href=""><span>회사소개</span></a></li>
				<li><a href=""><span>이용약관</span></a></li>
				<li><a href=""><span>개인정보취급방침</span></a></li>
				<li><a href=""><span>이용안내</span></a></li>
				<li><a href=""><span>제휴문의</span></a></li>
			</ul>
		</div>
	</div>
	<div class="middlearea">
		<div class="middle_inner">
			<ul>
				<li class="customer">
					<h3>CUSTOMER CENTER</h3>
					<p class="tel">
						<i class="fa fa-microphone" aria-hidden="true"></i>
						1670-7454
					</p>
					<p class="cstime">
						평일 오전 10:00 ~ 오후 5:00 / 점심시간 오후 12:00 ~ 오후 1:00<br>
						 토 / 일 / 공휴일 휴무
					</p>
				</li>
				<li class="account">
					<h3>ACCOUNT INFO</h3>
					<ul>
						<li>국민은행 810101-04-267951</li>
						<li>예금주: (주)엠에스네츄럴</li>
					</ul>
				</li>
				<li class="fnb">
					<h3>FAVORITE MENU</h3>
					<ul>
						<li><a href="">로그인/회원가입</a></li>
						<li><a href="">장바구니</a></li>
						<li><a href="">주문조회</a></li>
						<li><a href="">마이페이지</a></li>
					</ul>
				</li>
				<li class="return">
					<h3>RETURN / EXCHANGE</h3>
					<p>서울시 송파구 가락로 142, 3층 아이샤드</p>
					<p>자세한 교환·반품절차 안내는 문의란 및 공지사항을 참고해주세요</p>
					<ul class="tag">
						<li class="ico-notice"><a href=""><i class="fa fa-microphone" aria-hidden="true"></i><span>공지사항</span></a></li>
						<li class="ico-qna"><a href=""><i class="fa fa-comments" aria-hidden="true"></i><span>상품문의</span></a></li>
						<li class="ico-review"><a href=""><i class="fa fa-camera" aria-hidden="true"></i><span>구매후기</span></a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="bottomarea">
			<div class="bottom_inner">
				<div class="left">
					<ul>
						<li>COMPANY : <span class="value">(주)엠에스네츄럴</span></li>
						<li>OWNER : <span class="value">윤재웅</span></li>
						<li>BUSINESS LICENSE : <span class="value">836-86-00062</span></li>
						<li>MALL-ORDER LICENSE : <span class="value">2015-서울송파-0849</span></li>
					</ul>
					<ul>
						<li>ADDRESS : <span class="value">05676 서울특별시 송파구 가락로 142 (송파동) </span></li>
						<li>TEL : <span class="value">1670-7454</span></li>
					</ul>
					<ul>
						<li>CPO : <a href="mailto:ishardcs@naver.com"><span class="value">이가영 (ishardcs@naver.com)</span></a></li>
						<li>CONTACT US : <a href="mailto:onepeck@naver.com"><span class="value"><i class="fa fa-envelope-o" aria-hidden="true"></i>onepeck@naver.com</span></a></li>
					</ul>
				</div>
				<div class="right">
					<img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/mark_escrow.png" alt="escrow" class="img_on" style="cursor:pointer">
					<ul>
						<li class="ico-privacy"><a href=""><img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/mark_connect_privacy01.png" class="img_on" alt="privacy policy"></a></li>
						<li class="ico-ftc"><a href=""><img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/mark_connect_ftc01.png" class="img_on" alt="fair trade"></a></li>
						<li class="ico-ssl"><img src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/mark_connect_ssl01.png" class="img_on" alt="security"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>