<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/temp/link.jsp"></c:import>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
<c:import url="/WEB-INF/views/temp/swiperCss.jsp"></c:import>
<style type="text/css">
.swiper-container {
    width: 100%;
    height: 517px;
}
.swiper-slide a img{
	position: relative;
	top: -244px;
}
</style>
<title>Insert title here</title>
<div class="container">
	<!-- Slider main container -->
	<div class="swiper-container">
		<!-- Additional required wrapper -->
	    <div class="swiper-wrapper">
	        <!-- Slides -->
	        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide1.jpg"></a></div>
	        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide2.jpg"></a></div>
	        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide3.jpg"></a></div>
	        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide4.jpg"></a></div>
	        <div class="swiper-slide"><a href=""><img src="<%=pageContext.getServletContext().getContextPath() %>/resources/images/indexImages/slideImage/slide5.jpg"></a></div>
	    </div>
	    <!-- If we need pagination -->
	    <div class="swiper-pagination"></div>
	
	    <!-- If we need navigation buttons -->
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-button-next"></div>
	
	    <!-- If we need scrollbar -->
</div>
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
<c:import url="/WEB-INF/views/temp/swiperJs.jsp"></c:import>
</head>
<body>



</body>
</html>