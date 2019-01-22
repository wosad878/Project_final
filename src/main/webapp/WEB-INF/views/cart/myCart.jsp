<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp" />
<c:import url="/WEB-INF/views/temp/header.jsp" />
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


.proCategory{
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 12px;
	font-weight: bold;
}
.cartList{
	width: 100%;
}
.cartList tr{
    border-top: 1px solid #e7e7e7;
}
.cartList tr td{
	display:table-cell;
    padding: 15px 0;
}
.cartList thead tr td{
	font-size: 12px;
}
</style>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > Cart</h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name">CART</h3>
			</div>
		</div>
		<div class="orderArea">
			<div class="proCategory">
				<h3>일반상품 (${fn:length(cartList)}) </h3>
			</div>
			<table class="cartList">
				<thead>
					<tr>
						<td><input type="checkbox"></td>
						<td>이미지</td>
						<td>상품정보</td>
						<td>판매가</td>
						<td>수량</td>
						<td>적립금</td>
						<td>배송구분</td>
						<td>배송비</td>
						<td>합계</td>
						<td>선택</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${cartList}" var="cartList">
					<tr>
						<td><input type="checkbox"></td>
						<td><img src="/Project_final/resources/photoUpload/${cartList.image}" style="width:80px;height: 80px;"></td>
						<td>상품정보</td>
						<td>판매가</td>
						<td>수량</td>
						<td>적립금</td>
						<td>배송구분</td>
						<td>배송비</td>
						<td>합계</td>
						<td>선택</td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
					
				</tfoot>
			</table>
		</div>
	</div>
</div>
</body>
</html>