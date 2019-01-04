<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=pageContext.getServletContext().getContextPath()%>/resources/css/header.css">
<script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/resources/js/header.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div class="logoImage">
	<div class="spot" style="padding-top: 40px;margin:0 auto; width:50%; height: 150px; min-width: 500px;">
		<div class="spot_inner" style="width: inherit;height: inherit;margin: 0 auto;min-width: 500px;">
			<a class="logo" href="" style="height: 150px; margin: 0 auto;display: inline-block;"><img class="logoImg" style="padding-top: 25px;box-sizing: border-box;" src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/logo/logo1.png"></a>
		</div>
	</div>
</div>
<div class="lnb">
	<div class="lnb_inner">
		<ul>
			<li><a href=""><span>브랜드 스토리</span></a></li>
			<li><a href=""><span>전체상품</span></a>
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
			<li><a href=""><span>피부고민별</span></a>
				<ul>
					<li><a href="">트러블/모공</a></li>
					<li><a href="">미백/흔적</a></li>
					<li><a href="">수분/보습</a></li>
					<li><a href="">민감/진정</a></li>				
				</ul>
			</li>
			<li><a href=""><span>제품별</span></a>
				<ul>
					<li><a href="">신상품</a></li>
					<li><a href="">베스트셀러</a></li>
					<li><a href="">이벤트상품</a></li>
				</ul>
			</li>
			<li><a href=""><span>이벤트상품</span></a></li>
			<li><a href=""><span>이벤트</span></a>
				<ul>
					<li><a href="">진행중 이벤트</a></li>
					<li><a href="">종료된 이벤트</a></li>
				</ul>
			</li>
			<li><a href=""><span>상품후기</span></a></li>
			<li><a href=""><span>커뮤니티</span></a>
				<ul>
					<li><a href="">성분자료실</a></li>
					<li><a href="">아이사드 실험실</a></li>
				</ul>
			</li>
			<li><a href=""><span>고객센터</span></a>
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