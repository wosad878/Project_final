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
	$(window).bind('scroll', function() {
		if ($(window).scrollTop() > 190) {
			$('.lnb').css('position','fixed');
			$('.lnb').css('top','41px');
		}
		else if ($(window).scrollTop() < 190) {
			$('.lnb').css('position','relative');
			$('.lnb').css('top','0');
		}	
	});
	
	
	
});