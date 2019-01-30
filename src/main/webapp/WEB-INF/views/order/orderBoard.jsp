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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>
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
	color: #e30d15;
}
.orderTable tfoot strong{
	color: #e30d15;
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
    font-size: 12px;
    border-right:1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
}
.table table td{
	text-align: left;
    font-weight: normal;
    vertical-align: middle;
	background-color: white; 
	padding: 12px 10px 11px;
    font-size: 11px;
    border-right:1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
}
.table_info{
	padding-top: 30px;
	padding-bottom: 10px;
}
.table input{
	height: 22px;
	border:1px solid #e7e7e7;
	margin-right: 10px;
	padding-left: 7px;
}
.adrbutton{
	display: inline-block;
	color: #666;
    border: 1px solid #e3e3e3;
    border-bottom-color: #c7c7c7;
    box-shadow: 0 1px 2px rgba(0,0,0,0.04);
    padding: 0 .95em;
    height: 28px;
    line-height: 27px;
    font-weight: normal;
    border-radius: 4px;
}
#phone_first_select{
	padding-left: 10px;
}
textarea:focus {
	outline: none;
}
.table .table3{
	width: 100%;
    color: #353535;
    margin-bottom: 15px;
    border-left:0;
    border-right:0;
}
.table .table3 th, .table .table3 td{
	border-right: 0;
	border-bottom: 0;
	text-align: center;
}
.table .table3 th{
	font-weight: bold;
	padding-left: 0;
	border-bottom: 1px solid #e7e7e7;
}
.table .table3 td{
	font-size: 15px;
	font-weight: bold;
	padding: 20px 0;
	border-bottom: 1px solid #e7e7e7;
}
.table3 span{
	font-size: 22px;
}
.method{
	padding: 17px 20px 15px;
    font-weight: bold;
    font-size: 0.75em;
    border-bottom: 1px solid #e7e7e7;
    line-height: 1.5;
}
.method > span{
	margin: 0 20px 0 0;
}
.method > span > input{
	width: 13px;
    height: 13px;
    border: 0;
    margin: 0 3px 0 0;
    position: relative;
    top: 3px;
}
.payArea{
    overflow: hidden;
    position: relative;
    padding: 0 241px 0 0;
    border: 1px solid #e7e7e7;
    color: #353535;
    line-height: 1.5;
}
.base-table{
	padding: 20px 20px;
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
		console.log(price);
		console.log(tprice);
		$(this).children('.price').find('#oPrice').val(price);
		$(this).children('.total').find('#tprice').val(tprice);
		totalPrice = totalPrice + tprice; 
		tprice = numberWithCommas(tprice);
		price = numberWithCommas(price);
		$(this).children('.price').html(price+'원');
		$(this).children('.total').html(tprice+"원");
	});
	var tp = numberWithCommas(totalPrice);
	$('.sPrice span').html(tp);
	var discount = (totalPrice -2500)/10;
	if(0<(discount%10)<6){
		discount = discount - (discount%10);
	}else{
		discount = discount + (10 - discount%10);
	}
	tp = numberWithCommas(discount);
	$('.discount span').html(tp);
	var lp = totalPrice-discount;
	tp = numberWithCommas(lp);
	$('.finalPrice span').html(tp);
	
	deliverPrice(totalPrice);
	
	$('.btn_delete').click(function(){
		var check = 0;
		var count = 0;
		var name = new Array();
		
		$('.list').each(function(){
			if($(this).find('#oneCheck').is(':checked')){
				name[count] = $(this).find('.name').html();
				check++;
				count++;
				console.log("name"+name[count-1]);
			}
		});
		if(check == 0){
			alert('선택하신 상품이 없습니다.');
		}else{
			var con = confirm('선택하신 상품을 삭제하시겠습니까?');
			if(con == true){
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url:"/Project_final/ajax/cartDelete",
					type:'post',
					data:{
						name:name,
					},success:function(data){
						if(data == 1){
							$('.list').each(function(){
								if($(this).find('#oneCheck').is(':checked')){
									$(this).remove();
									location.reload();
								}
								if($('.list').length == 0){
									location.href="../cart/myCart";
								}
							})
						}
					}
				});
			}
		}
	});
});

function deliverPrice(totalPrice){
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
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var openId;
function goPopup(id){
    var pop = window.open("/Project_final/juso/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    openId = id;
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById(id+1).value = zipNo;
	document.getElementById(id+2).value = roadAddrPart1;
	document.getElementById(id+3).value = addrDetail;
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
							<td class="checkBox"><input type="checkbox" id="oneCheck" name="select"></td>
							<td class="image"><img src="/Project_final/resources/photoUpload/${cart.productDTO.fname}" style="width: 72px; height: 72px;"></td>
							<td class="name">${cart.productDTO.name}</td>
							<td class="price">
								<input type="hidden" id="price" value="${cart.productDTO.price}">
								<input type="hidden" id="oPrice">
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
					<a class="btn_back" href="../cart/myCart">장바구니 이동</a>
				</div>
			</div>
		</div>
		<div class="table">
			<div class="table_info">
				<p style="display: inline-block;font-size: 13px;">주문 정보</p>
				<span style="float:right;font-size: 13px;"><img src="/Project_final/resources/images/icon/ico_required.png"> 필수입력사항</span>
			</div>
			<table class="table1">
				<tr>
					<th>주문하시는 분 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><input id="name" type="text" name="name"></td>
				</tr>
				<tr>
					<th>주소 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><input id="location1" type="text" name="zip" readonly="readonly" style="width: 90px;margin-bottom: 5px;">
							<a class="adrbutton" onclick="goPopup('location')" style="cursor:pointer;">주소검색</a><br>
							<input id="location2" type="text" name="road" readonly="readonly" style="width: 300px;margin-bottom: 5px;"><span>기본주소</span><br>
							<input id="location3" type="text" name="detail" style="width: 300px;"><span>나머지주소(선택입력가능)</span>
							<input id="address" type="hidden" name ="address"></td>
				</tr>
				<tr>
					<th>휴대전화 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><select id="phone_first_select" name="phone_first_select" style="width: 60px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
								<input class="phone_first" name="phone_first" type="hidden" value="010">
								<input class="phone_middle" numberOnly name="phone_middle" type="text" style="width:70px;margin-right:10px;margin-left:5px;">-
								<input class="phone_last" numberOnly name="phone_last" type="text" style="width:70px;margin-left:5px;">
								<input id="phone" type="hidden" name ="phone"></td>
				</tr>
				<tr>
					<th>이메일 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><input class="email_first" name="email_first" type="text" style="margin-right:10px;">@
							<input class="email_last" name="email_last" type="text" readonly="readonly" style="margin-right:10px;margin-left:5px;">
							<input id="email" type="hidden" name ="email">
							<select id="selectEmail" style="width:120px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;">
								<option value="" selected="selected">- 이메일 선택 -</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="empas.com">empas.com</option>
								<option value="korea.com">korea.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select></td>
				</tr>
			</table>
			<div class="table_info">
				<p style="display: inline-block;font-size: 13px;">배송 정보</p>
				<span style="float:right;font-size: 13px;"><img src="/Project_final/resources/images/icon/ico_required.png"> 필수입력사항</span>
			</div>
			<table class="table2">
				<tr>
					<th>배송지 선택</th>
					<td></td>
				</tr>
				<tr>
					<th>받으시는 분 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><input id="receiver" type="text" name="receiver"></td>
				</tr>
				<tr>
					<th>주소 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><input id="locat1" type="text" name="zip" readonly="readonly" style="width: 90px;margin-bottom: 5px;">
							<a class="adrbutton" onclick="goPopup('locat')" style="cursor:pointer;">주소검색</a><br>
							<input id="locat2" type="text" name="road" readonly="readonly" style="width: 300px;margin-bottom: 5px;"><span>기본주소</span><br>
							<input id="locat3" type="text" name="detail" style="width: 300px;"><span>나머지주소(선택입력가능)</span>
							<input id="destination" type="hidden" name ="destination"></td>
				</tr>
				<tr>
					<th>휴대전화 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
					<td><select id="phone_fs" name="phone_fs" style="width: 60px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;padding-left: 10px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
								<input class="phone_f" name="phone_f" type="hidden" value="010">
								<input class="phone_m" numberOnly name="phone_m" type="text" style="width:70px;margin-right:10px;margin-left:5px;">-
								<input class="phone_l" numberOnly name="phone_l" type="text" style="width:70px;margin-left:5px;">
								<input id="rPhone" type="hidden" name ="rPhone"></td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td><textarea id="msg" name="message" cols="155" rows="3" style="resize: none;border:1px solid #e7e7e7;"></textarea></td>
				</tr>
			</table>
			<div class="table_info">
				<p style="display: inline-block;font-size: 13px;">결제 예정 금액</p>
			</div>
			<table class="table3">
				<thead>
					<tr>
						<th>총 주문금액</th><th>총 할인 + 부가결제 금액</th><th>총 결제예정 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="sPrice"><span></span>원</td><td class="discount"><span></span>원</td><td class="finalPrice" style="color:#e30d15;"><span></span>원</td>
					</tr>
				</tbody>
			</table>
			<div class="table_info">
				<p style="display: inline-block;font-size: 13px;">결제수단</p>
			</div>
			<div class="payArea">
				<div class="payment">
					<div class="method">
						<span><input id="pay1" type="radio" name="payment"><label for="pay1">무통장 입금</label></span>
						<span><input id="pay2" type="radio" name="payment"><label for="pay2">카드 결제</label></span>
						<span><input id="pay3" type="radio" name="payment"><label for="pay3">에스크로(실시간 계좌이체)</label></span>
					</div>
					<div class="base-table">
						<!-- 무통장 입금 -->
						<table>
							<tbody>
								<tr>
									<th>입금자명</th>
									<td><input id="user" type="text"></td>
								</tr>
								<tr>
									<th>입금은행</th>
									<td><select>
											<option></option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 카드 결제 -->
						
						<!-- 에스크로 -->
					</div>
					<div></div>
				</div>
				<div class="total"></div>
			</div>
		</div>
	</div>
</div>
<div class="footer">
<%-- 	<c:import url="../temp/footer.jsp" /> --%>
</div>
</body>
</html>