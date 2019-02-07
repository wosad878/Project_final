<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/link.jsp" />
<script type="text/javascript">
$(function(){
	$('#phone_first_select').blur(function(){
		$('.phone_first').val($('#phone_first_select option:selected').val());
	});
});

function checkForm(){
	if($('#adrName').val() == ""){
		alert("배송지명은 필수 입력사항 입니다.");
		$('#adrName').focus();
	}else{
		if($('#receiver').val() == ""){
			alert("이름은 필수 입력사항 입니다.");
			$('#receiver').focus();
		}else{
			if($('#location1').val() == ""){
				alert("주소는 필수 입력사항 입니다.");	
				$('#location1').focus();
			}else{
				$('#address').val($('#location1').val() + "||" + $("#location2").val() + "||" + $('#location3').val());
				if($('.phone_middle').val == ""){
					alert("주소는 필수 입력사항 입니다.");	
					$('.phone_middle').focus();
				}else{
					
				}
			}
		}
	}
		
}
function goPopup(){
    var pop = window.open("/Project_final/juso/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById('location1').value = zipNo;
	document.getElementById('location2').value = roadAddrPart1;
	document.getElementById('location3').value = addrDetail;
}
</script>


<style type="text/css">
.content{
	width: 760px;
	padding: 20px 20px 40px;
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
	width: 100%;
	border-right: 1px solid #e7e7e7;
	border-left: 1px solid #e7e7e7;
	border-bottom: 1px solid #e7e7e7;
}
table th{
	width: 100px;
	height: 40px;
	border-top: 1px solid #e7e7e7;
	border-right: 1px solid #e7e7e7;
	vertical-align: middle;
    background: #fbfafa;
    font-size: 11px;
    text-align: left;
    padding-left: 20px;
}
table tr:nth-child(3) span{
	margin-left: 10px;
}

table td{
	vertical-align: middle;
	text-align: left;
	border-top: 1px solid #e7e7e7;
	padding: 5px 0 5px 10px;
	font-size: 12px;
	color: #757575;
	font-size: 11px;
}
table td input{
	border:1px solid #e7e7e7;
	height: 22px;
	padding-left: 10px;
	font-size: 12px;
}
table tr select{
	font-size: 11px;
}
table td a{
	border: 1px solid #d3d3d3;
	border-radius: 6px;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	line-height: 22px;
	width: 60px;
	height: 24px;
    margin-bottom: 2px;
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
#btn_insert{
    background: #272727;
    color: #ffffff;
    border: 1px solid #272727;
}
#btn_cancel{
    background: #fff;
    color: #7d7d7d;
    border: 1px solid #ccc;
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
	<table class="table">
		<tr>
			<th>배송지명 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
			<td><input id="adrName" type="text" name="adrName"></td>
		</tr>
		<tr>
			<th>성명 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
			<td><input id="receiver" type="text" name="receiver"></td>
		</tr>
		<tr>
			<th>주소 <img src="/Project_final/resources/images/icon/ico_required.png"></th>
			<td><input id="location1" type="text" name="zip" readonly="readonly" style="width: 90px;margin-bottom: 5px;">
					<a class="adrbutton" onclick="goPopup('location')" style="cursor:pointer;">우편번호</a><br>
					<input id="location2" type="text" name="road" readonly="readonly" style="width: 450px;margin-bottom: 5px;"><span>기본주소</span><br>
					<input id="location3" type="text" name="detail" style="width: 450px;"><span>나머지주소(선택입력가능)</span>
					<input id="address" type="hidden" name ="address"></td>
		</tr>
		<tr>
			<th>일반전화</th>
			<td><select class="tel_first_select" name="tel_first_select" style="width:60px;height: 26px;border:1px solid #e7e7e7;margin-right: 10px;">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
					<option value="0502">0502</option>
					<option value="0503">0503</option>
					<option value="0504">0504</option>
					<option value="0505">0505</option>
					<option value="0506">0506</option>
					<option value="0507">0507</option>
					<option value="070">070</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>-
				<input class="tel_first" name="tel_first" type="hidden" value="02">
				<input class="tel_middle" numberOnly name ="tel_middle" type="text" style="width:70px;margin-right:10px;margin-left:5px;">-
				<input class="tel_last" numberOnly name ="tel_last" type="text" style="width:70px;margin-left:5px;">
				<input id="tel" type="hidden" name ="tel"></td>
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
	</table>
</div>
<div class="btnArea">
	<a id="btn_insert" href="#none" onclick="checkForm()">등록</a>
	<a id="btn_cancel" href=./addressList>취소</a>
</div>
</body>
</html>