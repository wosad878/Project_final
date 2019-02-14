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
<script type="text/javascript">
$(function(){
		var category1 = '${pager.category1}';
		var category2 = '${pager.category2}';
		var orderBy = '${pager.orderBy}';
		
		if(orderBy != 0){
			$('.menu1').css('display','none');
			$('.menu2').css('display','none');
			$('.menu3').css('display','block');
		}else if(category1 == '' || category1 == 1){
			$('.menu1').css('display','block');
			$('.menu2').css('display','none');
			$('.menu3').css('display','none');
		}else if(category1 == 2){
			$('.menu1').css('display','none');
			$('.menu2').css('display','block');
			$('.menu3').css('display','none');
		}
		if(category2 == ""){
			category2 = '전체보기';
		}
		$('.menu').html(category2);
	
	$('.pPrice').each(function(){
		var price = $(this).find('span').html();
		var s = numberWithCommas(price);
		$(this).find('span').html(s+'원');
	});
	
	$(".pnum").each(function() {
		if($(this).html() == '${pager.curPage}'){
			$(this).css('background-color','#f2f2f2');
		}
	});
	$('.update').each(function(){
		$(this).click(function(){
			var num = $(this).attr('title');
			location.href="../admin/product_update?num="+num;
		});
	});
});
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
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
		display: inline-block;
		font-weight:bold;
		box-sizing: border-box;
		padding-top: 10px;
	}
	.admin{
		display: inline-block;
		width: 90px;
		height: 30px;
		border:1px solid #e5e5e5;
		font-size: 12px;
		text-align: center;
		border-radius: 5px;
		line-height: 27px;
		margin-left: 20px;
		background-color: #9b9b9b;
	}
	.admin:visited{
		color: white;
	}
	.admin:link{
		color: white;
	}
	.sub-menu{
		margin: 30px 0;
		height: auto;
		display: block;
		overflow: hidden;
	}
	.sub-menu .depth{
		margin: 0 -5px 0 -5px;
		width: 100%;
		height: auto;
		overflow: hidden;
	}
	.depth li{
		width: 172.8px;
	    height: 36px;
		display: block;
		position: relative;
		float:left;
		margin-bottom: 15px;
		padding: 0 5px;
	}
	.depth li a{
	    position: relative;
	    display: block;
	    padding-left: 15px;
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
		width: 280px;
		display:inline-block;
		vertical-align:top;
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
	    margin: 0 auto;
	    padding: 25px 0 30px;
	    text-align: center;
	    font-size: 0;
	}
	.Paging a{
		display: table;
		float: left;
		margin: 0;
	}
	ol{
		float:left;
	    display: inline-block;
	}
	ol li{
		float: left;
	    display: inline-block;
	    border: 1px solid #e5e5e5;
	    margin: 0 0 0 -1px;
	    height: 30px;
	}
	ol li a{
	    display: block;
	    width: 31px;
	    height: 28px;
	    font-size: 10px;
	    line-height: 31px;
	}
	.update, .delete{
		margin-top: 8px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > <span class="menu">전체상품</span></h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name menu">전체상품</h3>
				<c:if test="${member.membertype eq 'admin'}">
					<a class="inputProduct admin" href="/Project_final/admin/product_insert">상품등록</a>
				</c:if>
			</div>
		</div>
		<div class="sub-menu">
			<ul class="depth menu1">
				<li><a href="./product_list"><span>전체보기</span></a></li>
				<li><a href="./product_list?category2=세트상품"><span>세트상품</span></a></li>
				<li><a href="./product_list?category2=천연비누"><span>천연비누</span></a></li>
				<li><a href="./product_list?category2=스킨/로션/미스트"><span>스킨/로션/미스트</span></a></li>
				<li><a href="./product_list?category2=에센스/세럼/크림"><span>에센스/세럼/크림</span></a></li>
				<li><a href="./product_list?category2=선케어/메이크업"><span>선케어/메이크업</span></a></li>
				<li><a href="./product_list?category2=팩/필링젤/클렌징"><span>팩/필링젤/클렌징</span></a></li>
				<li><a href="./product_list?category2=바디/헤어"><span>바디/헤어</span></a></li>
				<li><a href="./product_list?category2=미용도구"><span>미용도구</span></a></li>
			</ul>
			<ul class="depth menu2">
				<li><a href="./product_list?category1=2"><span>전체보기</span></a></li>
				<li><a href="./product_list?category1=2&category2=트러블/모공"><span>트러블/모공</span></a></li>
				<li><a href="./product_list?category1=2&category2=미백/흔적"><span>미백/흔적</span></a></li>
				<li><a href="./product_list?category1=2&category2=수분/보습"><span>수분/보습</span></a></li>
				<li><a href="./product_list?category1=2&category2=민감/진정"><span>민감/진정</span></a></li>
			</ul>
			<ul class="depth menu3">
				<li><a href="./product_list_order?category2=신상품&orderBy=1"><span>신상품</span></a></li>
				<li><a href="./product_list_order?category2=베스트셀러&orderBy=5"><span>베스트셀러</span></a></li>
				<li><a href="./product_list_order?category2=이벤트&orderBy=1"><span>이벤트</span></a></li>
			</ul>
		</div>
		<div class="product_list">
			<div class="list_menu">
				<span style="font-size:12px;color:#888;">Total <strong style="color:#333;font-weight:bold;">${totalCount}</strong> items</span>
				<ul class="list_menu_ul">
					<li><a href="./product_list_order?category2=${pager.category2}&orderBy=1">신상품</a></li>
					<li><a href="./product_list_order?category2=${pager.category2}&orderBy=2">상품명</a></li>
					<li><a href="./product_list_order?category2=${pager.category2}&orderBy=3">낮은가격</a></li>
					<li><a href="./product_list_order?category2=${pager.category2}&orderBy=4">높은가격</a></li>
					<li><a href="./product_list_order?category2=${pager.category2}&orderBy=5">사용후기</a></li>
				</ul>
			</div>
			<ul class="product_item">
				<c:forEach items="${list}" var="list">
				<li class="item_li">
					<div class="pImg">
						<a href="/Project_final/product/product_select?num=${list.num}"><img src ="/Project_final/resources/photoUpload/${list.fname}" style="width: 290px; height: 290px;"></a>
					</div>
					<div class="pInfo" title="${list.num}">
						<div class="pName">
							<a href="/Project_final/product/product_select?num=${list.num}"><h3>${list.name}</h3></a>
						</div>
						<div class="pPrice">
							<ul>
								<c:if test="${member.membertype eq 'admin'}">
									<li><a class="update admin" href="#none" title="${list.num}">수정</a>
										<a class="delete admin" href="#none" title="${list.num}">삭제</a></li>
								</c:if>
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
				<c:when test="${pager.curPage == 1}">
					<a href="#none"><img src = "/Project_final/resources/images/icon/btn_pagingFirst.png"></a>
				</c:when>
				<c:otherwise>
					<a href="/Project_final/product/product_list?curPage=1">
						<img src = "/Project_final/resources/images/icon/btn_pagingFirst.png">
					</a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pager.curBlock > 1}">
					<a href="/Project_final/product/product_list?curPage=${pager.startNum-1}">
						<img src = "/Project_final/resources/images/icon/btn_pagingPrev.png">
					</a>
				</c:when>
				<c:otherwise>
				<a href="#none"><img src = "/Project_final/resources/images/icon/btn_pagingPrev.png"></a>
				</c:otherwise>
			</c:choose>
			<ol>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li>
						<a class="pnum" href="/Project_final/product/product_list?curPage=${i}">${i}</a>
					</li>
				</c:forEach>
			</ol>
			<c:choose>
				<c:when test="${pager.curBlock < pager.totalBlock}">
					<a href="/Project_final/product/product_list?curPage=${pager.lastNum+1}">
						<img src = "/Project_final/resources/images/icon/btn_pagingNext.png">
					</a>
				</c:when>
				<c:otherwise>
					<a href="#none"><img src = "/Project_final/resources/images/icon/btn_pagingNext.png"></a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pager.curPage == pager.totalPage}">
					<a href="#none"><img src = "/Project_final/resources/images/icon/btn_pagingLast.png"></a>
				</c:when>
				<c:otherwise>
					<a href="/Project_final/product/product_list?curPage=${pager.totalPage}">
						<img src = "/Project_final/resources/images/icon/btn_pagingLast.png">
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<div class="footer">
	<c:import url="/WEB-INF/views/temp/footer.jsp" />
</div>
</body>
</html>