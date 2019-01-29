<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/link.jsp" />
<c:import url="../temp/header.jsp" />
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
.orderList{
	margin-top: 20px;
}
.title{
	display: block;
	padding: 20px 0;
}
.title h3{
	font-size: 12px;
	font-weight: bold;
}
.orderTable table{
	width: 100%;
}
.orderTable table th{
	height: 40px;
	border-top: 1px solid #e7e7e7;
	vertical-align: middle;
	font-size: 13px;
}
.orderTable table th:nth-child(1){
	width: 30px;
}
.orderTable table th:nth-child(2){
	width: 90px;
	text-align:center;
}
.orderTable table th:nth-child(3){
	width: 590px;
}
.orderTable table td{
	vertical-align: middle;
	text-align: center;
	border-top: 1px solid #e7e7e7;
	padding: 10px 0;
	font-size: 12px;
}
.orderTable table td:nth-child(3){
	text-align: left;
	padding-left: 30px;
	font-weight: bold;
}
.orderTable table td:nth-child(4){
	font-weight: bold;
}
.orderTable table tfoot{
}
.orderTable table tfoot tr{
	width: 100%;
	text-align: right;
	vertical-align: middle;
	background: #fbfbfb;
	border-bottom: 1px solid #e7e7e7;
}
.orderTable table tfoot tr td{
	padding: 15px 10px 15px 0;
	text-align: right;
}
.orderTable tfoot span{
	display: inline-block;
	float: left;
}
.orderTable tfoot p, .orderTable tfoot h4,.orderTable tfoot h5, .orderTable tfoot h6{
	display: inline-block;
}
.orderTable tfoot h6{
	font-size:19px;
	font-weight: bold;
	color:red;
}
.orderTable tfoot strong{
	color: red;
	font-weight: bold;
}
.info{
	height: 42px;
	line-height: 38px;
	border-bottom: 1px solid #e8e5e4;
	padding-left: 5px;
}
.info img{
	display: inline-block;
	padding-right: 10px;
	position:relative;
	top: 4px;
}
.info span{
	vertical-align: middle;
	display: inline-block;
	font-size: 12px;
}
.selectBox{
	padding: 8px 0 40px;
	border-bottom: 1px solid #e7e7e7;
}
.selectBox strong{
	font-size: 12px;
}
.selectBox a{
	display: inline-block;
    padding: 0 .95em;
    min-width: 49px;
    font-size: 13px;
    height: 28px;
    line-height: 27px;
    font-weight: normal;
}
.btn_delete{
    color: #fff;
    border: 1px solid #939393;
    border-bottom-color: #818181;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #9b9b9b;
    border-radius: 3px;
}
.btn_delete:link,.btn_delete:visited{
	color: #fff;
}
.btn_back{
	display: inline-block;
	float: right;
	color: #666;
    border: 1px solid #e3e3e3;
    border-bottom-color: #c7c7c7;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    border-radius: 3px;
}
.btn_back:link,.btn_back:visited{
	color: #666;
}
.table table{
	width: 100%;
	border: 1px solid #e7e7e7;
    border-bottom-width: 0;
    color: #353535;
    margin-bottom: 15px;
}
.table table th{
	width: 151px;
    padding: 12px 0 11px 18px;
    text-align: left;
    font-weight: normal;
    vertical-align: middle;
    background-color: #fbfbfb;
    border-right:1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
    font-size: 12px;
}
.table table td{
	text-align: left;
    font-weight: normal;
    vertical-align: middle;
	background-color: white; 
	padding: 12px 10px 11px;
	border-right:1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
}
.table_info{
	padding-top: 30px;
	padding-bottom: 10px;
}

</style>
<script type="text/javascript">
$(function(){
	var totalPrice = 0;
	$('.list').each(function(){
		var tprice = 0;
		var price = parseInt($(this).children('.price').find('#price').val());
		var quantity = parseInt($(this).children('.quantity').html());
		tprice = tprice + (price*quantity);
		$('#tprice').val(tprice);
		totalPrice = totalPrice + tprice; 
		tprice = numberWithCommas(tprice);
		price = numberWithCommas(price);
		$(this).children('.price').html(price+'원');
		$(this).children('.total').html(tprice+"원");
	});
	if(totalPrice >= 30000){
		$('.tfoot').find('h5').html('[무료]');
		var tp = numberWithCommas(totalPrice);
		$('.tfoot').find('p').html(tp);
		$('.tfoot').find('h6').html(tp);
	}else{
		$('.tfoot').find('h5').html('2500');
		var tp = numberWithCommas(totalPrice);
		$('.tfoot').find('p').html(tp);
		tp = numberWithCommas(totalPrice+2500);
		$('.tfoot').find('h6').html(tp);
	}
	
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > 주문서작성</h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name">주문서작성</h3>
			</div>
		</div>
		<div class="orderList">
			<div class="title"> 
				<h3>국내배송상품 주문내역</h3>
			</div>
			<div class="orderTable">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>적립금</th>
							<th>배송구분</th>
							<th>배송비</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartList}" var="cart">
						<tr class="list">
							<td class="checkBox"><input type="checkbox"></td>
							<td class="image"><img src="/Project_final/resources/photoUpload/${cart.productDTO.fname}" style="width: 72px; height: 72px;"></td>
							<td class="name">${cart.productDTO.name}</td>
							<td class="price">
								<input type="hidden" id="price" value="${cart.productDTO.price}">
							</td>
							<td class="quantity">${cart.quantity}</td>
							<td class="point">-</td>
							<td class="deliver">기본배송</td>
							<td class="deleverPrice">[조건]</td>
							<td class="total">
								<input type="hidden" id="tprice" name="tprice">
							</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td></td>
							<td colspan="8"><span>[기본배송]</span>상품구매금액 <p></p> + 배송비 <h5></h5> = 합계 : <h4></h4><h6></h6><strong>원</strong></td>
						</tr>
					</tfoot>
				</table>
				<div class="info">
					<img src="/Project_final/resources/images/icon/ico_info.gif"><span>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
				</div>
				<div class="selectBox">
					<span><strong>선택상품을</strong> <a class="btn_delete" href="#none">삭제하기</a></span>
					<a class="btn_back" href="#none">이전페이지</a>
				</div>
			</div>
		</div>
		<div class="table">
			<div class="table_info">
				<p style="display: inline-block;font-size: 13px;">주문 정보</p>
				<span style="float:right;font-size: 13px;"><img src="/Project_final/resources/images/icon/ico_required.png"> 필수입력사항</span>
			</div>
			<table>
				<tr>
					<th>주문하시는 분 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
				<tr>
					<th>주소 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
				<tr>
					<th>휴대전화 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
				<tr>
					<th>이메일 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
			</table>
			<div class="table_info">
				<p style="display: inline-block;font-size: 13px;">배송 정보</p>
				<span style="float:right;font-size: 13px;"><img src="/Project_final/resources/images/icon/ico_required.png"> 필수입력사항</span>
			</div>
			<table>
				<tr>
					<th>배송지 선택</th>
					<td></td>
				</tr>
				<tr>
					<th>받으시는 분 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
				<tr>
					<th>주소 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
				<tr>
					<th>휴대전화 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td></td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div class="footer">
<%-- 	<c:import url="../temp/footer.jsp" /> --%>
</div>
</body>
</html>