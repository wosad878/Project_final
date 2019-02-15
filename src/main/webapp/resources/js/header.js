$(function(){
	
	$('.lnb_inner ul li').hover(function(){
		$(this).children('ul').stop().fadeToggle(100);
	});
	$(".logo").mouseenter(function(){
		$('.logoImg').attr("src","/Project_final/resources/images/logo/logo2.png");
	});
	$(".logo").mouseleave(function(){
		$('.logoImg').attr("src","/Project_final/resources/images/logo/logo1.png");
	});
	$(".fa-search").click(function(){
		$('#searchFrm').submit();
	});
	$(window).bind('scroll', function() {
		if ($(window).scrollTop() > 150) {
			$('.lnb').css('position','fixed');
			$('.lnb').css('top','39px');
			$('html').css('padding-top','50px');
			$('.lnb').css('border-top','1px solid #e8e8e8');
			$('.logoImg').css('display','none');
		}
		else if ($(window).scrollTop() < 150) {
			$('.lnb').css('border-top','1px solid black');
			$('.lnb').css('position','relative');
			$('html').css('padding-top','0');
			$('.logoImg').css('display','inline');
			$('.lnb').css('top','0');
		}	
	});
	
});
