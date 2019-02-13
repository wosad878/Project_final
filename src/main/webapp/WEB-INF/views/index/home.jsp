<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/temp/link.jsp"></c:import>
<c:import url="/WEB-INF/views/temp/swiperCss.jsp"></c:import>
<link href="<%=pageContext.getServletContext().getContextPath()%>/resources/css/home.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
<div class="container1">
	<!-- Slider main container -->
	<div class="swiper-container swiper1">
		<!-- Additional required wrapper -->
	    <div class="swiper-wrapper">
	        <!-- Slides -->
	        <div class="swiper-slide s1"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide1.jpg"></a></div>
	        <div class="swiper-slide s1"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide2.jpg"></a></div>
	        <div class="swiper-slide s1"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide3.jpg"></a></div>
	        <div class="swiper-slide s1"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide4.jpg"></a></div>
	        <div class="swiper-slide s1"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide5.jpg"></a></div>
	    </div>
	    <!-- If we need pagination -->
	    <div class="swiper-pagination"></div>
	
	    <!-- If we need navigation buttons -->
	    <div class="swiper-button-prev" style="top:410px;"></div>
	    <div class="swiper-button-next" style="top:410px;"></div>
	
	    <!-- If we need scrollbar -->
	</div>
	<div class="container2">
		<ul class="ad1">
			<li><div class="membership"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/membership.jpg"></a></div></li>
			<li><div class="prise"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/prise.jpg"></a></div></li>
			<li><div class="event"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/event.jpg"></a></div></li>
			<li><div class="notice"><h3><a href=""><span>공지사항</span><span>+</span></a></h3>
				</div>
				<div class="notice_contents">
					<p>d</p>
					<p>s</p>
					<p>d</p>
					<p>d</p>
					<p>뭐라고쓸까</p>
					<p>d</p>
				</div>
			</li>
		</ul>
		<div class="banner_left">
			<div class="swiper-container swiper2">
				<!-- Additional required wrapper -->
			    <div class="swiper-wrapper">
			        <!-- Slides -->
			        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage2/3f64b8aa5fef648d4e516b3ccb522a6a.jpg"></a></div>
			        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage2/ca205f775f79b2591fe1ec109f9249b0.jpg"></a></div>
			        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage2/f3e80e88ac35414879418364e0d9cf48.jpg"></a></div>
			    </div>
			    <!-- If we need pagination -->
			    <div class="swiper-pagination"></div>
			
			    <!-- If we need navigation buttons -->
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-button-next"></div>
			
			    <!-- If we need scrollbar -->
			</div>
		</div>
		<div class="banner_right">
			<ul>
				<li class="ad_left">
					<a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/aa22f302f99e53cf943cf309233fb432.jpg"></a>
				</li>
				<li class="ad_right">
					<a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/62511981406d43b52af4c89870a69b44.jpg"></a>
				</li>
				<li class="ad_bottom">
					<a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/9281b75119a342058343ded70d0e0285.jpg"></a>
				</li>
			</ul>
		</div>
	</div>
	<div class="bestItem">
		<h3>베스트아이템</h3>
		<span>아이샤드 고객님이 선택한 베스트 제품</span>
		<div class="swiper-container swiper3">
			<!-- Additional required wrapper -->
		    <div class="swiper-wrapper">
		        <!-- Slides -->
		        <c:forEach items="${best}" var="best">
		        <div class="swiper-slide" style=""><a href="../product/product_select?num=${best.num}">
		        	<img src="/Project_final/resources/photoUpload/${best.fname}"></a></div>
		        </c:forEach>
		    </div>
		    <!-- If we need pagination -->
		    <div class="swiper-pagination"></div>
		
		    <!-- If we need navigation buttons -->
<!-- 		    <div class="swiper-button-prev"></div> -->
<!-- 		    <div class="swiper-button-next"></div> -->
		
		    <!-- If we need scrollbar -->
		</div>
	</div>
		<div class="newItem">
		<h3>신상품</h3>
		<span>아이샤드의 신상품을 가장 먼저 만나보세요</span>
		<div class="swiper-container swiper4">
			<!-- Additional required wrapper -->
		    <div class="swiper-wrapper">
		        <!-- Slides -->
		        <c:forEach items="${newItem}" var="newItem">
		        <div class="swiper-slide" style=""><a href="../product/product_select?num=${newItem.num}">
		        	<img src="/Project_final/resources/photoUpload/${newItem.fname}"></a></div>
		        </c:forEach>
		    </div>
		    <!-- If we need pagination -->
		    <div class="swiper-pagination"></div>
		
		    <!-- If we need navigation buttons -->
<!-- 		    <div class="swiper-button-prev"></div> -->
<!-- 		    <div class="swiper-button-next"></div> -->
		
		    <!-- If we need scrollbar -->
		</div>
	</div>
	<c:import url="/WEB-INF/views/temp/swiperJs.jsp"></c:import>
</div>
<div class="footer">
		<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>