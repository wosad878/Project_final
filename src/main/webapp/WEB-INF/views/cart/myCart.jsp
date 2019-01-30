<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp" />
<c:import url="/WEB-INF/views/temp/header.jsp" />
<script type="text/javascript">
$(document).on("pageload",function(){
	window.location.reload(true);
});
$(function(){

	$('.btn_orderAll').click(function(){
		if($('.list').length == 0){
			alert('선택된 상품이 없습니다.');
		}else{
			location.href="../order/orderBoard";
		}
	});
	
	$('.btn_orderSelect').click(function(){
		var ary ='';
		$('.oneCheck').each(function(index){
			if($(this).is(':checked')){
				var proname = $(this).parent().siblings('.name').html();
				alert(proname);
				ary = ary+'ary='+proname+"&";
			}
		});
		if(ary.length > 0){
			location.href="../order/orderBoard?"+ary;
		}else{
			alert('선택된 상품이 없습니다');
		}
	});
	
	$('.btn_deleteOne').click(function(){
		var ary = new Array();
		$('.oneCheck').each(function(index){
			if($(this).is(':checked')){
				var proname = $(this).parent().siblings('.name').html();
				ary[index] = proname;
			}
		});
		if(ary.length > 0){
			location.href="./cartDeleteSelect?ary="+ary;
		}else{
			alert('선택된 상품이 없습니다');
		}
	});
	
	$('#allCheck').click(function(){
		var check = $('input:checkbox[id="allCheck"]').is(':checked');
		$('.oneCheck').prop('checked',check);
		
	});	
	var prices = 0;
	$('.list').each(function(){
		
		
		$(this).find('.btn_order').click(function(){
			var proname = $(this).parents().siblings('.name').html();
			var quantity = $(this).parents().siblings('.quantity').find('#quantity').val();
			$('#frm').attr('action','../order/orderBoard');
			$('#frm').attr('method','get');
			$('#frm').append('<input type="hidden" name="proname" value="'+proname+'">');
			$('#frm').append('<input type="hidden" name="quantity" value="'+quantity+'">');
			$('#frm').submit();
		});
		
		$(this).find('.btn_change').click(function(){
			var name = $(this).parents().siblings('.name').html();
			var count = $(this).siblings().children('#quantity').val();
			
			$('#frm').attr('action','./cartUpdate');
			$('#frm').attr('method','post');
			$('#frm').append('<input type="hidden" name="proname" value="'+name+'">');
			$('#frm').append('<input type="hidden" name="quantity" value="'+count+'">');
			$('#frm').submit();
		});
		
		$(this).find('.btn_top_button').click(function(){
			var count = parseInt($(this).siblings('#quantity').val());
			$(this).siblings('#quantity').val(count+1);
		});
		
		$(this).find('.btn_bottom_button').click(function(){
			var count = parseInt($(this).siblings('#quantity').val());
			if(count > 1){
				$(this).siblings('#quantity').val(count-1);
			}
		});
		
		var price = parseInt($(this).find('.p').html());
		$(this).find('.p').html(priceText(price, 1))
		var count = parseInt($(this).find('#quantity').val());
		$(this).find('.tprice').html(priceText(price, count));
		prices = parseInt(prices + (price * count));
		$('.prices').html(priceText(prices,1));
		$('.sPrice').html(priceText(prices,1));
	});
	var discount = prices * 0.01;
	if(discount%10 > 0){
		if(discount%10 > 5){
			discount = discount + (10 - discount%10);
		}else{
			discount = discount - (discount%10);
		}
	}
	if(prices >= 30000){
		$('.delevery_Endprice').html('0 (무료)');
		$('.dPrice').html('무료');
		$('.totalPrice').html(priceText(prices, 1));
		$('.orderPrice').html(priceText(prices-discount, 1));
	}else{
		$('.delevery_Endprice').html('2,500');
		$('.dPrice').html('2,500원 조건');
		$('.totalPrice').html(priceText(prices+2500, 1));
		$('.orderPrice').html(priceText(prices-discount+2500, 1));
	}
	$('.totalDiscount').html(priceText(discount, 1));
});
function priceText(price,count){
	var tprice = String(price * count);
	var s = tprice.length-3;
	var string = tprice.substring(s);
	var string2;
	var string3;
	var text;
	if(s < 1){
		text = tprice+'원';
	}else if(s < 4){
		string2 = tprice.substring(0,s);
		text = string2+','+string+'원';
	}else{
		string2 = tprice.substr(tprice.length-6,3);
		string3 = tprice.substring(0,tprice.length-6);
		text = string3+','+string2+','+string+'원';
	}
	return text;
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
.cart_empty{
	margin-top:50px;
	border-top: 1px solid #e7e7e7;
	border-bottom: 1px solid #e7e7e7;
	padding: 150px 0 140px;
	text-align: center;
}
.cart_empty p{
    text-align: center;
    font-weight: 500;
    color: #757575;
    font-size: 11px;
    letter-spacing: 0.5px;
}
.s{
	margin: 0 0 23px;
    display: block;
    font-size: 37px;
    color: #999;
}
.orderArea{}
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
.cartList thead tr td{
	display:table-cell;
    padding: 10px 0;
    vertical-align: middle;
    text-align: center;
	font-size: 12px;
}
.cartList tbody tr td{
	display:table-cell;
    padding: 10px 0;
    vertical-align: middle;
}
.cartList tbody tr td:not(.name){
	text-align: center;
	font-size: 12px;
}
.check{
	width: 30px;
}
.image{
	text-align: center;
	width: 100px;
}
.name{
	width: 500px;
	font-size: 12px;
}
tbody .name{
	clear: inherit;
	text-align: left;
}
.quantity{
	width: 120px;
}
.quantity_inner{
    width: 100px;
    display: inline-block;
}
.count{
    position: relative;
    width: 55px;
    display: inline-block;
    margin: 0 1px 0 0;
    text-align: left;
}
.count #quantity{
	width: 22px;
    height: 23px;
    padding: 0 0 0 5px;
    line-height: 25px;
    border: 1px solid #d4d8d9;
    border-radius: 3px 0 0 3px;
    float: left;
}
.btn_top{
	position: relative;
	top: 0;
	left: -1px;
}
.btn_bottom{
	position: relative;
	top: -2px;
	left: -1px;
}
.btn_change{
	display: inline-block;
	width: 40px;
	height: 22px;
	border: 1px solid #e7e7e7;
	position:relative;
	line-height: 20px;
	float:right;
	text-align: center;
	border-radius: 3px;
	font-size: 12px;
}
.select{
	width: 100px;
}
.btn_select{
	display: block;
	width: 100px;
	height: 26px;
	margin-top: 5px;
	box-sizing: border-box;
	border-radius: 3px;
	line-height: 20px;
	font-size: 12px;
	border: 1px solid #e3e3e3;
    border-bottom-color: #c7c7c7;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);

}
.btn_select:first-child {
	margin-top: 0;
	color: #fff;
    border: 1px solid #373737;
    border-bottom-color: #2f2f2f;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #393939;
}
tfoot tr td{
	border-bottom: 1px solid #e7e7e7;
    padding: 13px 10px;
    background: #fafafa;
    text-align: right;
    font-size: 12px;
}
.btn_cart{
	margin-top:10px;
	margin-bottom: 40px;
	display: block;
}
.btn_cart a{
	display:inline-block;
	height: 30px;
	font-size: 12px;
	border-radius: 3px;
	text-align: center;
	line-height: 28px;
}
.btn_deleteOne{
	width: 70px;
	color: #fff;
    border: 1px solid #939393;
    border-bottom-color: #818181;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #9b9b9b;
}
.btn_deleteAll:visited,.btn_deleteAll:active,.btn_deleteAll:link,.btn_wish:visited,.btn_wish:active,.btn_wish:link{
	color: #666;
}
.btn_deleteOne:visited,.btn_deleteOne:active,.btn_deleteOne:link{
	color: #fff;
}
.btn_deleteAll, .btn_wish{
	width: 100px;
	color: #666;
    border: 1px solid #e3e3e3;
    border-bottom-color: #c7c7c7;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #fff;
}
.total_table table{
	width: 100%;
	border-right:1px solid #e7e7e7;
	border-bottom:1px solid #e7e7e7;
}
.total_table thead tr{
	border-top: 1px solid #e7e7e7;
}
.total_table th{
	height: 40px;
    border-left: 1px solid #e7e7e7;
    line-height: 40px;
    background: #fafafa;
    font-size: 13px;
}
.total_table td{
	height: 50px;
    border-top: 1px solid #e7e7e7;
    border-left: 1px solid #e7e7e7;
    line-height: 50px;
    text-align: center;
    font-size: 15px;
}
.buttons_order{
	text-align: center;
	margin-top: 30px;
	margin-bottom: 50px;
	margin-left: 154px;
}
.buttons_order a{
	width: 151px;
	height: 41px;
	border-radius: 4px;
	line-height: 35px;
	font-size: 13px;
	font-weight: bold;
	display: inline-block;
}
.btn_orderAll{
	color: #fff;
    border: 1px solid #373737;
    border-bottom-color: #2f2f2f;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #393939;
}
.btn_orderSelect{
	color: #fff;
    border: 1px solid #939393;
    border-bottom-color: #818181;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #9b9b9b;
}
.btn_productList{
    color: #666;
    float: right;
    border: 1px solid #e3e3e3;
    border-bottom-color: #c7c7c7;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    background: #fff;
}
.btn_orderAll:visited,.btn_orderAll:link,.btn_orderAll:active,.btn_orderSelect:visited,.btn_orderSelect:link,.btn_orderSelect:active{
	color: #fff;
}
.btn_productList:visited,.btn_productList:link,.btn_productList:active {
	color: #666;
}
.help{
    margin: 20px 0 50px 0;
    border: 1px solid #e7e7e7;
    line-height: 18px;
}
.help h3{
    padding: 10px 0 8px 12px;
    border-bottom: 1px solid #e7e7e7;
    color: #101010;
    font-size: 11px;
    font-weight: bold;
    background: #fafafa;
}
.help_inner{
    padding: 5px 17px 23px;
}
.help_inner h4{
    margin-top: 20px;
    margin: 22px 0 -4px;
    color: #404040;
    font-size: 12px;
    font-weight: bold;
}
.help_inner ol{
    margin: 15px 0 0 0;
    font-size: 11px;
}
.help_inner ol li{
    color: #707070;
    margin: 2px 0 0;
    padding: 0 0 0 23px;
    
}
.item1{
	background: url(/Project_final/resources/images/icon/ico_number.png) no-repeat;
	background-position: -484px 0;
}
.item2{
	background: url(/Project_final/resources/images/icon/ico_number.png) no-repeat;
    background-position: -434px -100px;
}
.item3{
	background: url(/Project_final/resources/images/icon/ico_number.png) no-repeat;
    background-position: -384px -200px;
}
.item4{
	background: url(/Project_final/resources/images/icon/ico_number.png) no-repeat;
    background-position: -334px -300px;
}
.item5{
	background: url(/Project_final/resources/images/icon/ico_number.png) no-repeat;
	background-position: -284px -400px;
}
.item6{
	background: url(/Project_final/resources/images/icon/ico_number.png) no-repeat;
    background-position: -234px -500px;
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
		<c:choose>
			<c:when test="${empty cartList}">
				<div class="cart_empty">
					<p><i class="fa fa-search s" aria-hidden="true"></i>장바구니가 비어 있습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="orderArea">
					<div class="proCategory">
						<h3>일반상품 (${fn:length(cartList)}) </h3>
					</div>
					<table class="cartList">
						<thead>
							<tr>
								<td class="check"><input id="allCheck" type="checkbox"></td>
								<td class="image">이미지</td>
								<td class="name">상품정보</td>
								<td class="price">판매가</td>
								<td class="quantity">수량</td>
								<td class="point">적립금</td>
								<td class="deliver">배송구분</td>
								<td class="delever_price">배송비</td>
								<td class="total">합계</td>
								<td class="select">선택</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${cartList}" var="cartList">
							<tr class="list">
								<td class="check"><input class="oneCheck" type="checkbox"></td>
								<td class="image"><img src="/Project_final/resources/photoUpload/${cartList.productDTO.fname}" style="width:80px;height: 80px;"></td>
								<td class="name">${cartList.productDTO.name}</td>
								<td class="price p">${cartList.productDTO.price}</td>
								<td class="quantity">
									<div class="quantity_inner">
										<span class="count">
							    			<input id="quantity" class="q" type="text" name="quantity" value="${cartList.quantity}">
						    				<a class="btn_top_button" href="#none"><img class="btn_top" src="/Project_final/resources/images/icon/btn_count_up.gif"></a>
						    				<a class="btn_bottom_button" href="#none"><img class="btn_bottom" src="/Project_final/resources/images/icon/btn_count_down.gif"></a>
					    				</span>
					    				<a class="btn_change" href="#none">변경</a>
									</div>
								</td>
								<td class="point">-</td>
								<td class="deliver">기본배송</td>
								<td class="delever_price dPrice">배송비</td>
								<td class="total tprice">합계</td>
								<td class="select">
									<a class="btn_order btn_select" href="#none">주문하기</a>
									<a class="btn_delete btn_select" href="./cartDeleteOne?proname=${cartList.productDTO.name}">삭제</a>
								</td>
							</tr>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="10">
									<strong style="float: left;">[기본배송]</strong>
									상품구매금액 <span class="prices" style="font-weight: bold;"></span>
									 + 배송비 <span class="delevery_Endprice"></span>
									  = 합계:<span class="totalPrice" style="font-weight: bold; font-size: 14px;padding-left: 5px;"></span> 
								</td>
							</tr>
						</tfoot>
						</tbody>
					</table>
					<form id="frm">
						
					</form>
				</div>
				<div class="btn_cart">
					<a class="btn_deleteOne" href="#none">삭제하기</a>
					<a class="btn_deleteAll" href="./cartDeleteAll">장바구니비우기</a>
				</div>
				<div class="total_table">
					<table>
						<thead>
							<tr>
								<th>
									<span>총 상품금액</span>
								</th>
								<th>
									<span>총 배송비</span>
								</th>
								<th>
									<span>총 할인금액</span>
								</th>
								<th>
									<span>결제예정금액</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="sPrice"></td>
								<td class="dPrice"></td>
								<td class="totalDiscount"></td>
								<td class="orderPrice"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="buttons_order">
			<a class="btn_orderAll" href="#none">전체상품주문</a>
			<a class="btn_orderSelect" href="#none">선택상품주문</a>
			<a class="btn_productList" href="/Project_final/product/product_list">쇼핑계속하기</a>
		</div>
		<div>
		
		</div>
		<div class="help"><h3>이용안내</h3>
			<div class="help_inner">
		        <h4>장바구니 이용안내</h4>
		        <ol>
					<li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
		            <li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
		            <li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
		            <li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
		            <li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
		            <li class="item6">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
		        </ol>
				<h4>무이자할부 이용안내</h4>
		        <ol>
					<li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
		            <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
		            <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
		        </ol>
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<c:import url="/WEB-INF/views/temp/footer.jsp" />
</div>
</body>
</html>