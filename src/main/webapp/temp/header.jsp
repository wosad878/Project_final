<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('.lnb_inner ul li').hover(function(){
		$(this).children('ul').stop().fadeToggle(100);
	});
	$(".logo").mouseenter(function(){
		$('.logoImg').attr("src","<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/logo2.png");
	});
	$(".logo").mouseleave(function(){
		$('.logoImg').attr("src","<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/logo1.png");
	});
});
</script>
<link rel="stylesheet" type="text/css" href="<%=pageContext.getServletContext().getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style type="text/css">
.bar{
	width: 100%;
	height: 40px;
	border-bottom: 1px solid #e8e8e8;
    border-bottom-color: rgba(0,0,0,.09);
    position: fixed;
}
.inner{
	margin-left: 15%;
	margin-right: 15%;
}
.left{
	width: 50%;
	float: left;
}
.bar div{
	height: 40px;
}
.header_ul{
	height: inherit;
}
.header_ul li{
	display: inline-block;
	height: inherit;
	box-sizing: border-box;
	padding-top: 10px;
}
.header_ul li a{
	padding: 0 10px 0 0;
	font-size: 12px;
}
.right{
	widows: 50%;
	padding-top: 10px;
	box-sizing: border-box;
	float: right;
}
.find{
	float: right;
}
.lnb{
	height: 50px;
	border-bottom: 1px solid #e8e8e8;
	}
.lnb_inner{
	width:auto; 
	height: inherit;
}
.lnb_inner ul{
	text-align: center;
	height: inherit;
}
.lnb_inner ul li{
	display: inline-block;
	margin-right: 70px;
	position: relative;
	top: 15px;
	font-size: 13px;
}
.lnb_inner ul li ul{
	display:none;
	width: 140px;
	position: absolute;
	top: 33px;
	left: -40px;
	padding: 10px 0 10px 0;
	border: 1px solid #ddd;
	background-color: white;
}
.lnb_inner ul li ul li{
	text-align: left;
	position:relative;
	top:0.5px;
	width: 120px;
	height: 25px;
	padding: 0;
	margin: 0;
}
.lnb_inner ul li ul li a{
	font-size: 13px;
	padding
}

</style>
</head>
<body>
<div class="bar">
	<div class="inner">
		<div class="left">
			<ul class="header_ul">
				<li><a href="">로그인</a></li>
				<li><a href="">회원가입</a></li>
				<li><a href="">장바구니</a></li>
				<li><a href="">마이페이지</a></li>
				<li><a href="">커뮤니티</a></li>
				<li><a href="">문의게시판</a></li>
				<li><a href="">후기</a></li>
			</ul>
		</div>
		<div class="right">
			<form>
				<input style="float: left;" type="text" class="find" name="search">
				<a class="searchbutton" style="float: right;margin-left: 5px; margin-top: 3px" href=""><i class="fa fa-search"></i></a>
			</form>
		</div>
	</div>
</div>
<div style="border-bottom: 1px solid black;">
	<div class="spot" style="padding-top: 40px;margin:0 auto; width:50%; height: 150px;">
		<div class="inner" style="width: 500px;height: inherit;margin: 0 auto;">
			<a class="logo" href="" style="height: 150px;"><img class="logoImg" style="padding-top: 25px;box-sizing: border-box;" src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/logo1.png"></a>
		</div>
	</div>
</div>
<div class="lnb">
	<div class="lnb_inner">
		<ul>
			<li><a href="">브랜드 스토리</a></li>
			<li><a href="">전체상품</a>
				<ul>
					<li><a href="">세트상품</a></li>
					<li><a href="">천연비누</a></li>
					<li><a href="">스킨/로션/미스트</a></li>
					<li><a href="">에센스/세럼/크림</a></li>
					<li><a href="">선케어/메이크업</a></li>
					<li><a href="">팩/필링젤/클렌징</a></li>
					<li><a href="">바디/헤어</a></li>
					<li><a href="">미용도구</a></li>
				</ul>
			</li>
			<li><a href="">피부고민별</a>
				<ul>
					<li><a href="">트러블/모공</a></li>
					<li><a href="">미백/흔적</a></li>
					<li><a href="">수분/보습</a></li>
					<li><a href="">민감/진정</a></li>				
				</ul>
			</li>
			<li><a href="">제품별</a>
				<ul>
					<li><a href="">신상품</a></li>
					<li><a href="">베스트셀러</a></li>
					<li><a href="">이벤트상품</a></li>
				</ul>
			</li>
			<li><a href="">이벤트상품</a></li>
			<li><a href="">이벤트</a>
				<ul>
					<li><a href="">진행중 이벤트</a></li>
					<li><a href="">종료된 이벤트</a></li>
				</ul>
			</li>
			<li><a href="">상품후기</a></li>
			<li><a href="">커뮤니티</a>
				<ul>
					<li><a href="">성분자료실</a></li>
					<li><a href="">아이사드 실험실</a></li>
				</ul>
			</li>
			<li><a href="">고객센터</a>
				<ul>
					<li><a href="">공지사항</a></li>
					<li><a href="">회원혜택</a></li>
					<li><a href="">자주묻는 질문</a></li>
					<li><a href="">문의게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
</body>
</html>