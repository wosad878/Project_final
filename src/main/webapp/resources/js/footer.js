	$(function(){
		$(".tag li").mouseenter(function(){
			$(this).css("background","#ccc");
			$(this).find("i").css("display","none");
			$(this).find("span").css("display","table-cell");
			$(this).css('top',"-8px")
		});
		$(".tag li").mouseleave(function(){
			$(this).css("background","white");
			$(this).find("i").css("display","table-cell");
			$(this).find("span").css("display","none");
			$(this).css('top',"0")
		});
	});