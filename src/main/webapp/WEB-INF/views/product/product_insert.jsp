<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/link.jsp" />
<c:import url="/WEB-INF/views/temp/header.jsp" />
<script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function() {
	var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함. 
	
	// Editor Setting 
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
		elPlaceHolder : "smarteditor",	// 에디터가 그려질 textarea ID 값과 동일 해야 함. 
		sSkinURI : "<%=pageContext.getServletContext().getContextPath()%>/resources/editor/SmartEditor2Skin.html", // Editor HTML 
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
		htParams : { 
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseToolbar : true, 
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseVerticalResizer : true, 
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseModeChanger : true, 
		} 
	}); 
	// 전송버튼 클릭이벤트 
	$("#savebutton").click(function(){
		//if(confirm("저장하시겠습니까?")) { 
		// id가 smarteditor인 textarea에 에디터에서 대입 
		oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []); 
		
		// 이부분에 에디터 validation 검증 
		if(validation()) { 
			$("#frm").submit(); 
			} 
		//} 
		}) 
	}); 
// 필수값 Check 
function validation(){ 
	var contents = $.trim(oEditors[0].getContents()); 
	if(contents === '<p>&bnsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
		
		alert("내용을 입력하세요."); 
		oEditors.getById['smarteditor'].exec('FOCUS'); 
		return false; 
	} 
	
	return true; 
}

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}

//textArea에 이미지 첨부
<%-- function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/path에서 설정했던 경로/'+filepath+'">';
    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
} --%>
</script>
<script type="text/javascript">
$(function(){
	
	$('.cancel').click(function(){
		var path = "/Project_final/product/product_insert";
		$.ajax({
			url:"/Project_final/product/product_insert",
			type:'post',
			data:{path:path},
			success:function(data){
				console.log(data);
			}
		});
	});
});
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
.inputText{
	width: 100%;
	display: inline-block;
	margin-top: 50px;
}
.inputbuttons{
	margin-bottom:100px;
}
</style>
</head>
<body>
<div class="container">
	<div class="contents">
		<div class="product_name">
			<div class="page_location">
				<h6>Home > 상품등록</h6>
			</div>
			<div class="name_inner">
				<h3 class="pro_name">상품등록</h3>
			</div>
		</div>
		<div class="inputText">
			<form action="./product_insert" method="post" id="frm" enctype="multipart/form-data">
				<table>
				<tr>
					<th><span>상품 이름</span></th>
					<td><input type="text" name="name"><br></td>
				</tr>
				<tr>
					<th><span>카테고리1</span></th>
					<td><select>
							<option value="1">전체</option>
							<option value="2">피부고민별</option>
						</select>
						<input id="hiddenCate1" type="hidden" name="category1">
					</td>
				</tr>	
				<tr>
					<th><span>카테고리2</span></th>
					<td><select>
							<option value="3">세트</option>
							<option value="4">천연비누</option>
							<option value="5">스킨/로션/미스트</option>
							<option value="6">에센스/세럼/크림</option>
							<option value="7">신커에/메이크업</option>
							<option value="8">팩/필링젤/클렌징</option>
							<option value="9">바디/헤어</option>
							<option value="10">미용도구</option>
						</select>
						<input id="hiddenCate2" type="hidden" name="category2">
					</td>
				</tr>
				<tr>
					<th><span>가격</span></th>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<th><span>중량</span></th>
					<td><input type="text" name="weight"></td>
				</tr>
				<tr>
					<th><span>유통기한</span></th>
					<td><input type="text" name="life"></td>
				</tr>
				<tr>
					<th><span>이벤트 내용</span></th>
					<td><input type="text" name="event"></td>
				</tr>
				<tr>
					<th><span>태크</span></th>
					<td><input type="text" name="tag"></td>
				</tr>
				<tr>
					<th><span>메모</span></th>
					<td><input type="text" name="memo"></td>
				</tr>
				<tr>
					<th><span>묶음상품 이름</span></th>
					<td><input type="text" name="bindname"></td>
				</tr>
				<tr>
					<th><span>재고</span></th>
					<td><input type="text" name="stock"></td>
				</tr>
				</table>
				<textarea name="contents" id="smarteditor" rows="10" cols="100" style="width:100%; height:600px;"></textarea>
			</form>
		</div>
		<div class="inputbuttons">
			<a class="insert" href="#none">등록</a>
			<a class="cancel" href="#none">취소</a>
		</div>
	</div>
</div>
</body>
</html>