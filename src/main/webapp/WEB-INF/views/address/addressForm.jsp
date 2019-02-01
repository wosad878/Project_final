<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp" />
<style type="text/css">
.content{
	width: 760px;
	padding: 20px 20px 80px;
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
    font-weight: normal;
    background: #fbfafa;
    vertical-align: top;
}
table th:first-child {
	border-left: 0;
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
				<c:forEach items="${list}" var="list">
					<tr>
						<td><input type="checkbox" id="checkOne"></td>
						<td></td>
						<td>
							<c:choose>
								<c:when test="${list.adrname eq null}">미지정</c:when>
								<c:otherwise>${list.adrname}</c:otherwise>
							</c:choose>
						</td>
						<td>${list.receiver}</td>
						<td>${list.tel}</td>
						<td>${list.phone}</td>
						<td>${list.address}</td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>