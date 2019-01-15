<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp"></c:import>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<style type="text/css">
	.contents{
		margin: 0 auto;
		min-width: 1100px;
		max-width: 1280px;
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
	.sub-menu{
		height:96px;
		margin: 30px 0;
	}
	.depth{
		
		margin: 0 -5px 0 -5px;
	}
	.depth li{
		width: 16.666%;
		position: relative;
		float:left;
	}
	.depth li a{
	    position: relative;
	    margin: 5px;
	    padding: 0 12px;
	    display: block;
	    height: 36px;
	    line-height: 36px;
	    border: 1px solid #e4e4e4;
	    font-size: 12px;
	    color: #444;
	}
	.product_list{
		margin-bottom: 40px;
		box-sizing: border-box;
	}
	.list_menu{
		border-bottom: 1px solid #e7e7e7;
		height: 30px;
		margin-bottom: 30px;
	}
	.list_menu_ul {
		float:right;
	}
	.list_menu_ul li{
		height: auto;
		display:inline;
		box-sizing: border-box;
	}
	.list_menu_ul li a{
		font-size: 12px;
		color:#888;
	}
	.item_li{
		width: 290px;
		float:left;
		margin-left: 30px;
		margin-top: 25px;
	
	}
	.product_item{
		height: 100%;
		display: inline-block;
	}
	.product_item img{
		width: 100%;
	}
	.pName{
		border-bottom: 1px solid #e8e8e8;
	}
	.pName h3{
		font-size: 15px;
		font-weight: bold;
		display: inline-block;
		margin-bottom: 10px;
	}
	.product_item li span {
		width: 100%;
		height: 100%;
		
	}
	.pPrice span {
		color: #6aa47b;
		font-size: 14px;
		display:inline-block;
		margin:10px 0 10px 0;
	}
	.pPrice p{
		font-size: 13px;
	}
	.Paging{
		display: table;
		margin: 0 auto 50px auto;
	}
</style>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > 전체상품</h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name">전체상품</h3>
			</div>
		</div>
		<div class="sub-menu">
			<ul class="depth">
				<li><a href=""><span>전체보기<p></p></span></a></li>
				<li><a href=""><span>세트상품<p></p></span></a></li>
				<li><a href=""><span>천연비누<p></p></span></a></li>
				<li><a href=""><span>스킨/로션/미스트<p></p></span></a></li>
				<li><a href=""><span>에센스/세럼/크림<p></p></span></a></li>
				<li><a href=""><span>선케어/메이크업<p></p></span></a></li>
				<li><a href=""><span>팩/필링젤/클렌징<p></p></span></a></li>
				<li><a href=""><span>바디/헤어<p></p></span></a></li>
				<li><a href=""><span>미용도구<p></p></span></a></li>
			</ul>
		</div>
		<div class="product_list">
			<div class="list_menu">
				<span style="font-size:12px;color:#888;">Total <strong style="color:#333;font-weight:bold;">${totalCount}</strong> items</span>
				<ul class="list_menu_ul">
					<li><a href="">신상품</a></li>
					<li><a href="">상품명</a></li>
					<li><a href="">낮은가격</a></li>
					<li><a href="">높은가격</a></li>
					<li><a href="">사용후기</a></li>
				</ul>
			</div>
			<ul class="product_item">
				<c:forEach items="${list}" var="list">
				<li class="item_li">
					<div class="pImg">
						<img src ="/Project_final/resources/images/1.jpg">
					</div>
					<div class="pInfo">
						<div class="pName">
							<h3>${list.name}</h3>
						</div>
						<div class="pPrice">
							<ul>
								<li><span>${list.price}</span></li>
								<li><p>${list.event}</p></li>
							</ul>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="Paging">
			<c:choose>
				<c:when test="${pager.curBlock > 1}">
					<a href="/Project_final/product/product_list?curPage=${pager.startNum-1}">[이전]</a>
				</c:when>
				<c:otherwise>
					<a>[이전]</a>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="/Project_final/product/product_list?curPage=${i}">${i}</a>
			</c:forEach>
			<c:choose>
				<c:when test="${pager.curBlock < pager.totalBlock}">
					<a href="/Project_final/product/product_list?curPage=${pager.lastNum+1}">[다음]</a>
				</c:when>
				<c:otherwise>
					<a>[다음]</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/temp/footer.jsp" />
	</div>
</div>
</body>
</html>