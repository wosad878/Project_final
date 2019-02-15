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
<%-- <script type="text/javascript" src="<%=pageContext.getServletContext().getContextPath()%>/resources/editor/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script> --%>
<script type="text/javascript">
$(document).ready(function() {
	$('#cate1').change(function(){
		var cate1 = $('#cate1 option:selected').val();
		if(cate1 == 1){
			$('.category2-1').css('display','table-row');
			$('.category2-2').css('display','none');
			$('#category2-1').attr('name','category2');
			$('#category2-2').removeAttr('name');
		}else{
			$('.category2-1').css('display','none');
			$('.category2-2').css('display','table-row');
			$('#category2-2').attr('name','category2');
			$('#category2-1').removeAttr('name');
		}
	});
	
	
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
	
	$('.cancel').click(function(){
		location.href="/Project_final/product/imageDelete";
	});
	
	$('.insert').click(function(){

 		if($('#name').val() == ""){
 			alert("상품이름은 필수입력 사항 입니다");
 			$('#name').focus();
 		}else{
 			if($('#price').val() == ""){
 				alert("가격은 필수입력 사항 입니다");
 				$('#price').focus();
 			}else{
 				if($('#mainImage').val() == ""){
 					alert("대표 이미지는 필수입력 사항 입니다");
 					$('#mainImage').focus();
 				}else{
					if($('.subImage').val() == ""){
	 					alert("상세 이미지는 필수입력 사항 입니다");
	 					$('#mainImage').focus();
 					}else{
 					saveText();
 					}
				}
 			}
 		}
	});
	
	// 전송버튼 클릭이벤트 
	function saveText(){
		oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []); 
	
        var ir1 = $("#smarteditor").val();

        if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
             alert("내용을 입력하세요.");
             oEditors.getById["smarteditor"].exec("FOCUS"); //포커싱
             return;
        }else{
			$("#frm").submit(); 
        }
	}
	
	$('#imageAdd').click(function(){
		var count;
		$('.subImage').each(function(index){
			count = index;
		});
		if(count > 8){
			alert('사진첨부는 10개까지 가능합니다');
		}else{
			var code = '<div class="subIname_div">';
			code = code + '<input id="subImage" class="subImage" type="file" name="subImage" style="margin-top: 10px;">';
			code = code +'<span class="removeImage"><i class="fa fa-minus" style="font-size:24px"></i></span></div>';
			$('#subImage_td').append(code);
		}
		$('.removeImage').click(function(){
			$(this).parent('div').remove();
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
.pro_table{
	width: 100%;
	border: 1px solid #e7e7e7;
    border-bottom-width: 0;
    color: #353535;
    margin-bottom: 40px;
}
.pro_table th{
	width: 151px;
    padding: 12px 0 11px 18px;
    text-align: left;
    font-weight: normal;
    vertical-align: middle;
    background-color: #fbfbfb;
    border-right:1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
}
.pro_table td {
	text-align: left;
    font-weight: normal;
    vertical-align: middle;
	background-color: white; 
	padding: 10px 10px 10px;
	border-right:1px solid #e7e7e7;
    border-bottom: 1px solid #e7e7e7;
}
#name,#oPrice,#price,#weight,#life,#deliver,#event,#tag,#memo,#bindname,#stock,#minorder{
	height: 20px;
	border:1px solid #e7e7e7;
	display: inline-block;
}
select{
	width: 180px;
	height: 22px;
	border: 1px solid #e7e7e7;
}
th span{
	font-size: 12px;
	font-weight: bold;
}
.mainImage,.subImage{
	width: 500px;
	height: 22px;
	border:1px solid #e7e7e7;
	display: inline-block;
	font-size: 12px;
}
.fa-plus{
	display: inline-block;
	position: relative;
	top:5px;
	margin-left: 10px;
	cursor: pointer;
}
.fa-minus{
	display: inline-block;
	position: relative;
	top:5px;
	margin-left: 16px;
	cursor: pointer;
}
.inputbuttons{
	display: block;
	text-align: center;
	box-sizing: border-box;
	padding-top: 80px;
}
.buttonsInner{
	display: inline-block;
	margin: 0 auto;
	border-spacing: 0;
}
.inputbuttons a{
	display: inline-block;
	width: 180px;
	height: 50px;
	border: 1px solid #e7e7e7;
	border-radius: 5px;
	line-height: 50px;
	font-weight: bold;
	color: white;
}
.insert{
	margin-right: 5px;
	background-color:#363636;
	cursor:pointer;
}


.cancel{
	margin-left: 5px;
	background-color:#9b9b9b;
	cursor: pointer;
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
				<table class="pro_table">
				<tr>
					<th><span>상품 이름</span></th>
					<td><input id="name" type="text" name="name" style="width: 500px;"><br></td>
				</tr>
				<tr>
					<th><span>카테고리1</span></th>
					<td><select id="cate1" name="category1">
							<option value="1" selected="selected">전체</option>
							<option value="2">피부고민별</option>
						</select>
					</td>
				</tr>	
				<tr class="category2-1">
					<th><span>카테고리2</span></th>
					<td><select id="category2-1" class="category2" name="category2">
							<option value="세트상품" selected="selected">세트상품</option>
							<option value="천연비누">천연비누</option>
							<option value="스킨/로션/미스트">스킨/로션/미스트</option>
							<option value="에센스/세럼/크림">에센스/세럼/크림</option>
							<option value="선케어/메이크업">선케어/메이크업</option>
							<option value="팩/필링젤/클렌징">팩/필링젤/클렌징</option>
							<option value="바디/헤어">바디/헤어</option>
							<option value="미용도구">미용도구</option>
						</select>
					</td>
				</tr>
				<tr class="category2-2" style="display: none;">
					<th><span>카테고리2</span></th>
					<td><select id="category2-2"  class="category2">
							<option value="트러블/모공" selected="selected">트러블/모공</option>
							<option value="미백/흔적">미백/흔적</option>
							<option value="수분/보습">수분/보습</option>
							<option value="민감/진정">민감/진정</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><span>기본 가격(할인하지 않을 땐 공란)</span></th>
					<td><input id="oPrice" type="text" name="oPrice" style="width: 200px;"></td>
				</tr>
				<tr>
					<th><span>할인된 가격(할인하지 않을 땐 기본가격 입력)</span></th>
					<td><input id="price" type="text" name="price" style="width: 200px;"></td>
				</tr>
				<tr>
					<th><span>중량</span></th>
					<td><input id="weight" type="text" name="weight" style="width: 200px;"></td>
				</tr>
				<tr>
					<th><span>유통기한</span></th>
					<td><input id="life" type="text" name="life" style="width: 200px;"></td>
				</tr>
				<tr>
					<th><span>최소주문수량</span></th>
					<td><input id="minorder" type="text" name="minorder" style="width: 200px;"></td>
				</tr>
				<tr>
					<th><span>이벤트 내용</span></th>
					<td><input id="event" type="text" name="event" style="width: 700px;"></td>
				</tr>
				<tr>
					<th><span>태그</span></th>
					<td><input id="tag" type="text" name="tag" style="width: 700px;"></td>
				</tr>
				<tr>
					<th><span>설명</span></th>
					<td><input id="memo" type="text" name="memo" style="width: 100%;"></td>
				</tr>
				<tr>
					<th><span>재고</span></th>
					<td><input id="stock" type="text" name="stock" style="width: 200px;"></td>
				</tr>
				<tr>
					<th><span>배송안내</span></th>
					<td><input id="deliver" type="text" name="deliver" style="width: 200px;"></td>
				</tr>
				
				<tr>
					<th><span>대표이미지</span></th>
					<td><input id="mainImage" class="mainImage" type="file" name="mainImage"></td>
				</tr>
				<tr>
					<th><span>상세이미지</span></th>
					<td id="subImage_td">
						<div class="subIname_div">
							<input id="subImage" class="subImage" type="file" name="subImage">
							<i id="imageAdd" class="fa fa-plus" style="font-size:24px"></i>
						</div>
					</td>
				</tr>
				</table>
				
				<div class="product_name">
					<div class="name_inner">
						<h3 class="pro_name">게시글 상세내용</h3>
					</div>
				</div>
				
				<textarea name="contents" id="smarteditor" rows="10" cols="100" style="width:100%; height:800px;"></textarea>
			</form>
		</div>
		<div class="inputbuttons">
			<div class="buttonsInner">
				<a class="insert">등록</a>
				<a class="cancel">취소</a>
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<c:import url="/WEB-INF/views/temp/footer.jsp" />
</div>
</body>
</html>