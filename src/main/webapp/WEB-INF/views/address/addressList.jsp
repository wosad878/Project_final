<%@page import="org.springframework.ui.Model"%>
<%@page import="com.kim.Project_final.address.AddressDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp" />
<script type="text/javascript">
$(function(){
	$('.list').each(function(index){
		$(this).find('.select').click(function(){
			var index = $(this).attr('title');
			var receiver = $('.receiver'+index).html();
			var phone1 = $('.phone_f'+index).html();
			var phone2 = $('.phone_m'+index).html();
			var phone3 = $('.phone_l'+index).html();
			var address1 = $('.address_f'+index).html();
			var address2 = $('.address_m'+index).html();
			var address3 = $('.address_l'+index).html();
			
			opener.document.getElementById('receiver').value= receiver;
			opener.document.getElementById('locat1').value= address1;
			opener.document.getElementById('locat2').value= address2;
			opener.document.getElementById('locat3').value= address3;
			opener.document.getElementById('phone_fs').value= phone1;
			opener.document.getElementById('phone_f').value= phone1;
			opener.document.getElementById('phone_m').value= phone2;
			opener.document.getElementById('phone_l').value= phone3;
			
			window.close();
		});
	});
});
</script>
<style type="text/css">
.content{
	width: 760px;
	padding: 20px 20px 40px;
    min-height: 350px;
}
.header h1{
	width: 785px;
    height: 36px;
    line-height: 36px;
    padding: 0 0 0 15px;
    color: #fff;
    font-size: 12px;
    background: #575757;
}
.info{
    margin: 0 0 20px;
    padding: 12px 15px;
    border: 1px solid #e7e7e7;
}
.info h2{
    margin: 0 0 6px;
    padding: 0 0 8px;
    border-bottom: 1px solid #e7e7e7;
    color: #353535;
    font-size: 11px;
    font-weight: bold;
}
ul li{
    padding: 0 0 0 9px;
    color: #757575;
    font-size: 11px;
    line-height: 1.5;
    background: url(/Project_final/resources/images/icon/ico_grid.gif) no-repeat 0 7px;
}
.addrList{
    border: 1px solid #e7e7e7;
}
table{
    table-layout: fixed;
    color: #353535;
    line-height: 1.5;
    font-size: 11px;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
table th{
	padding: 11px 0 9px;
    border-left: 1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
    font-weight: normal;
    background: #fbfafa;
    vertical-align: top;
}
table th:first-child {
	border-left: 0;
}
table th:nth-child(2){
	width: 85px;
}
table th:nth-child(3){
	width: 85px;
}
table th:nth-child(4){
	width: 85px;
}
table th:nth-child(7){
	width: 150px;
}
table td {
	text-align: center;
	vertical-align: middle;
	padding: 10px 5px;
	font-size: 12px;
}
table td a {
	width: 39px;
	height: 26px;
	box-sizing: border-box;
	padding-top: 2px;
	display: inline-block;
	border: 1px solid black;
	border-radius: 5px;
	text-align: center;
}
table td .save{
    background: #7d7d7d;
    color: #ffffff;
    border: 1px solid #858585;
}
table td .select{
    background: #272727;
    color: #ffffff;
    border: 1px solid #272727;
}
table td .update{
    background: #fff;
    color: #7d7d7d;
    border: 1px solid #ccc;
}
.btnArea{
	position: fixed;
	display: block;
	bottom: 0;
	width: 800px;
	height: 52px;
	border-top: 1px solid #e7e7e7;
	background: #fcfcfc;
	text-align: center;
}
.btnArea a{
	display: inline-block;
	width: 80px;
	height: 31px;
	font-size: 12px;
	font-weight: bold;
	border-radius: 4px;
	margin-top: 10px;
	line-height: 30px;
}
#btn_delete{
    background: #fff;
    color: #7d7d7d;
    border: 1px solid #ccc;
}
#btn_insert{
    background: #272727;
    color: #ffffff;
    border: 1px solid #272727;
}
</style>
</head>
<body>
<div class="header">
	<h1>Address Book</h1>
</div>
<div class="content">
	<div class="info">
		<h2>배송주소록 유의사항</h2>
		<ul>
			<li><span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</span></li>
			<li><span>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</span></li>
		</ul>
	</div>
	<div class="addrList">
		<table>
			<thead>
				<tr>
					<th style="width: 27px;"><input type="checkbox" id="checkAll"></th>
					<th style="whdth: 80px;">주소록 고정</th>
					<th style="whdth: 85px;">배송지명</th>
					<th style="whdth: 85px;">수령인</th>
					<th style="whdth: 110px;">일반전화</th>
					<th style="whdth: 110px;">휴대전화</th>
					<th style="whdth: auto;">주소</th>
					<th style="whdth: 1160px;">배송지관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list" varStatus="i">
					<tr class="list">
						<td><input type="checkbox" id="checkOne"></td>
						<td><a class="save" href="#none">고정</a></td>
						<td class="adrName">
							<c:choose>
								<c:when test="${list.adrName eq null}">미지정</c:when>
								<c:otherwise>${list.adrName}</c:otherwise>
							</c:choose>
						</td>
						<td class="receiver${i.index}" >${list.receiver}</td>
						<td class="tel">${list.tel1}-${list.tel2}-${list.tel3}</td>
						<td class="phone"><span class="phone_f${i.index}">${list.phone1}</span>-
						<span class="phone_m${i.index}">${list.phone2}</span>-<span class="phone_l${i.index}">${list.phone3}</span></td>
						<td class="address">(<span class="address_f${i.index}">${list.address1}</span>)
						<span class="address_m${i.index}">${list.address2}</span><span class="address_l${i.index}">${list.address3}</span></td>
						<td><a class="select" href="#none" title="${i.index}">적용</a>
							<a class="update" href="./addressUpdateForm?num=${list.num}">수정</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="btnArea">
	<a id="btn_delete" href="#none">선택삭제</a>
	<a id="btn_insert" href="./addressForm">등록</a>
</div>
</body>
</html>