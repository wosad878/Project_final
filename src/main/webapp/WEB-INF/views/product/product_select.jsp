<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/temp/link.jsp" />
<c:import url="/WEB-INF/views/temp/swiperCss.jsp" />
<c:import url="/WEB-INF/views/temp/header.jsp" />
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<script type="text/javascript">
$(function(){
	var q = $('#quantity').val();
	var pText = priceText(q);
	$('.sprice').html(pText);
	$('#tprice').html(pText);
	
	$('#productName').val('${product.name}');
	$('#productPrice').val('${product.price}');
	$('#productImage').val('${product.fname}');
	$('#productTPrice').val('${product.price}');
	$('#productQuantity').val(1);
	
	$('.btn_top_button').click(function(){
		var q = $('#quantity').val();
		q = parseInt(q)+1;
		$('#quantity').val(q);
		$('#productTPrice').val(q*'${product.price}');
		$('#productQuantity').val(q);
		$('#count').html(q+"<p>(개)</p>");
		var text = priceText(q);
		$('#tprice').html(text);
	});
	$('.btn_bottom_button').click(function(){
		var q = $('#quantity').val();
		if($('#quantity').val() > 1){
			q = parseInt(q)-1;
			$('#quantity').val(q);
			$('#productTPrice').val(q*'${product.price}');
			$('#productQuantity').val(q);
			$('#count').html(q+"<p>(개)</p>");
		}
		var text = priceText(q);
		$('#tprice').html(text);
	});
	
	$('#quantity').change(function(){
		var count = $('#quantity').val();
		var price = '${product.price}';
		$('#tprice').val(price);
	});
	
	$('.btn_order').click(function(){
		var id = '${member.id}';
		if(id == ""){
			alert('로그인 후 이용 가능합니다');
			location.href="/Project_final/member/loginForm";
		}else{
			$('#frm').attr('action','../order/orderBoard');
			$('#frm').submit();
		}
	});
	$('.btn_cart').click(function(){
		var id = '${member.id}';
		if(id == ""){
			alert('로그인 후 이용 가능합니다');
			location.href="/Project_final/member/loginForm";
		}else{
			$('#frm').attr('action','../cart/cartInsert');
			$('#frm').submit();
		}
	});
	
	$('.slider-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: true,
	  asNavFor: '.slider-nav'
	});
	$('.slider-nav').slick({
 	  slidesToShow: 7,
	  slidesToScroll: 1,
	  asNavFor: '.slider-for',
	  dots: false,
	  centerMode: false,
	  focusOnSelect: true
	});
	
});


function priceText(q){
	var price = ${product.price};
	var tprice = String(price * q);
	var string = tprice.substring(tprice.length-3);
	var string2;
	var string3;
	var text;
	var s = tprice.length-3;
	if(s < 4){
		string2 = tprice.substring(0,s);
		text = string2+'.'+string+'원';
	}else{
		string2 = tprice.substr(tprice.length-6,3);
		string3 = tprice.substring(0,tprice.length-6);
		text = string3+'.'+string2+'.'+string+'원';
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
.proImage{
	width: 700px;
	display: inline-block;
}
.slider-for img{
	margin: 0 auto;
	width: 500px;
	height: 500px;
}
.slider-nav img{
	width: 90px;
	height: 90px;
	float: left;
	display: inline-block;
}

.proInfo{
	display: inline-block;
	width: 450px;
	float: right;
}
.proInfo_inner{}
.proInfo_name{
	border-top: 2px solid black;
	border-bottom: 1px solid #e7e7e7;
	height: 50px;
	box-sizing: border-box;
	padding: 15px 0 15px 10px;
}
.proInfo_tag{
	height: 45px;
	border-bottom: 1px solid #e7e7e7;
	box-sizing: border-box;
	padding: 15px 0 15px 10px;
	color: #727272;
	font-size: 12px;
}
.proInfo_detail{
	border-bottom: 1px solid #e7e7e7;
}
.proInfo_detail tr{
	height: 30px;
	
}
.proInfo_detail tr:first-child td{
	padding-top: 20px;
	box-sizing: border-box;
}
.proInfo_detail td{
	box-sizing: border-box;
	padding: 10px 0 10px 10px;
}
.proInfo_detail tr:last-child td{
	padding-bottom: 25px;
}
.proInfo_detail span{
	font-size: 13px;
	display: inline-block;
	width: 150px;
	color: #555 !important;
}
.proInfo_detail p{
	display:inline-block;
	font-size: 12px;
}
.proInfo_memo{
	height: 40px;
	padding: 15px;
	border-bottom: 1px solid #e7e7e7;
	font-size: 11px;
	color: #454545;
	line-height: 15px;
	position:relative;
	top:0;
}
.proInfo_minorder{
	height: 25px;
	font-size: 12px;
	color: #757575;
	padding-top: 10px;
	padding-bottom: 5px;
}
.pro_order{
	width: 100%;
	border-top: 1px solid #9c9c9c;
}
.pro_order th{
	height: 38px;
	box-sizing: border-box;
	padding: 10px;
	font-size: 12px;
	border: 1px solid #e7e7e7;
	border-top: 0;
}
.pro_order table{
	width: 100%;
	border-bottom: 1px solid #e7e7e7;
}
.pro_order th:first-child {
	width: 60%;
}
.pro_order th:last-child{
	width: 20%;
}
.pro_order td{
	padding-top: 15px;
}
.pro_order td:first-child{
	padding-left: 10px;
	font-size: 12px;
	float: left;
}
.pro_order td:last-child{
	font-size: 13px;
	padding-right: 10px;
	float:right;
}
.quantity{
   width: 54px !important;
   display: inline-block;
   position: relative;
   vertical-align: top;
   top: -4px;
   left: 20px;
}
#quantity{
    float: left;
    width: 22px;
    height: 23px;
    padding: 0 2px 0 3px;
    line-height: 23px;
    border: 1px solid #d4d8d9;
    border-radius: 3px 0 0 3px;
}
.quantity a{
    text-decoration: none;
    color: #000;
    outline: none;
    position: relative;
    left: -1px;
}
.btn_top{
	position: relative;
	top: -1px;
}
.btn_bottom{
	position: relative;
	top: -5px;
}
.totalPrice{
    font-size: 11px;
    padding: 19px 6px 10px;
    color: #353535;
    vertical-align: middle;
    text-align: right;
    border-bottom: 1px solid #d4d8d9;
}
.totalPrice strong{
	font-weight: bold;
	padding-right: 5px;
}
.totalPrice em{
    font-style: normal;
    font-size: 19px;
    font-weight: bold;
   	padding-right: 5px;
}
.totalPrice span{
}
.totalPrice p{
	display: inline-block;
}
.orderButton{
    padding: 10px 0;
    
}
.orderButton a{
	height: 52px;
	display: inline-block;
    border: 2px solid #e7e7e7;
    color: #6f6f6f;
    text-align: center;
    letter-spacing: 1px;
    line-height: 50px;
}
.btn_order{
	width: 165px;
}
.btn_cart{
	width: 130px;
}
.btn_wish{
	width: 131px;
}
.btn_kakao{
	width: 100%;
    background: #fce41d;
    border: 1px solid #f5d818;
    border-bottom: 1px solid #eed818;
    color: #323232;
	display:block;
	height: 44px;
	font-size: 13px;
    text-align: center;
    letter-spacing: 0.5px;
    line-height: 42px;
    border-radius: 2px;
}
.btn_kakao img{
	display:inline-block;
	position: relative;
	top: 8px;
	padding-right: 10px; 
}
.pro_board{
	padding-top: 150px;
}
.pro_board img{
	display:block;
	margin: 0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">

	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > 전체상품</h6>
			</div>
			<div class="name_inner">
			</div>
		</div>
		<div class="proImage">
			<div class="s-box">
			    <div class="slider slider-for">
			    	<c:forEach items="${images}" var="images">
				    	<div class="swiper-slide"><img src="/Project_final/resources/photoUpload/${images.fname}"></div>
			    	</c:forEach>
			    </div>
			    <div class="slider slider-nav">
			    	<c:forEach items="${images}" var="images">
				    	<div class="swiper-slide"><img src="/Project_final/resources/photoUpload/${images.fname}"></div>
			    	</c:forEach>
			    </div>
			    
			 </div>
		</div>
		<div class="proInfo">
			<div class="proInfo_inner">
				<div class="proInfo_name">
					<h3>${product.name}</h3>
				</div>
				<div class="proInfo_tag">
					<h3>${product.tag}</h3>
				</div>
				<div class="proInfo_detail">
					<table>
						<tr>
							<td><span>판매가격</span><p class="sprice"></p></td>
						</tr>
						<c:if test="${product.weight ne null}">
							<tr>
								<td><span>중량</span><p>${product.weight}</p></td>
							</tr>
						</c:if>
						<c:if test="${product.life ne null}">
							<tr>
								<td><span>유통기한</span><p>${product.life}</p></td>
							</tr>
						</c:if>
						<c:if test="${product.deliver ne null}">
							<tr>
								<td><span>배송안내</span><p>${product.deliver}</p></td>
							</tr>
						</c:if>
					</table>
				</div>
				<c:if test="${product.memo ne null}">
					<div class="proInfo_memo">
						${product.memo}
					</div>
				</c:if>
				<c:if test="${product.minorder > 0}">
					<div class="proInfo_minorder">
				    	<p>최소주문수량 ${product.minorder}개 이상</p>
				    </div>
				</c:if>
			    <div class="pro_order">
			    	<table>
			    		<thead>
			    			<tr>
				    			<th>상품명</th>
				    			<th>상품수</th>
				    			<th>가격</th>
			    			</tr>
			    		</thead>
			    		<tbody>
			    			<tr>
				    			<td>${product.name}</td>
				    			<td>
				    				<span class="quantity">
						    			<input id="quantity" type="text" name="quantity" value="1">
					    				<a class="btn_top_button" href="#none"><img class="btn_top" src="/Project_final/resources/images/icon/btn_count_up.gif"></a>
					    				<a class="btn_bottom_button" href="#none"><img class="btn_bottom" src="/Project_final/resources/images/icon/btn_count_down.gif"></a>
					    				
				    				</span>
				    			</td>
				    			<td><p class="sprice"></p></td>
			    			</tr>
			    		</tbody>
			    	</table>
			    </div>
			    <div class="totalPrice">
			    	<strong>TOTAL:</strong><em id="tprice"></em><span id="count">1<p>(개)</p></span>
			    </div>
			    <div class="orderButton">
			    	<a class="btn_order" href="#none"><span>바로구매</span></a>
			    	<a class="btn_cart" href="#none"><span>장바구니</span></a>
			    	<a class="btn_wish" href=""><span>관심상품</span></a>
			    	<form id="frm" method="post">
				    	<input id="productName" type="hidden" name="proname">
				    	<input id="productImage" type="hidden" name="image">
				    	<input id="productPrice" type="hidden" name="price">
				    	<input id="productQuantity" type="hidden" name="quantity">
				    	<input id="productTPrice" type="hidden" name="totalPrice">
			    	</form>
			    	
			    </div>
			    <div class="kakao">
			    	<a class="btn_kakao" href="">
			    		<span><img src="/Project_final/resources/images/icon/btn_svc_kakaotalk.png" style="width:21px;">카카오톡 상담 @아이샤드</span>
			    	</a>
			    </div>
			</div>
		</div>
    <div class="pro_board">
    	${product.productBoardDTO.contents}
    </div>
	</div>
</div>
<div class="footer">
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</div>
</body>
</html>