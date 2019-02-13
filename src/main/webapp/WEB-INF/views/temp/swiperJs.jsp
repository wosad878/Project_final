<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<script>
$(function(){
	var mySwiper1 = new Swiper ('.swiper1', {
    // Optional parameters
    direction: 'horizontal',
    loop: true,
    speed: 2000,
    autoplay:{delay: 3000,disableOnInteraction: false,},

    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },

    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

    // And if we need scrollbar
   
  })
	var mySwiper2 = new Swiper ('.swiper2', {
	    // Optional parameters
	    direction: 'horizontal',
	    loop: true,
	    speed: 2500,
	    autoplay:{delay: 3000,disableOnInteraction: false,},

	    // If we need pagination
	    pagination: {
	      el: '.swiper-pagination',
	    },

	    // Navigation arrows
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },

	    // And if we need scrollbar
	   
	  })
	var mySwiper3 = new Swiper ('.swiper3', {
	    // Optional parameters
	    direction: 'horizontal',
	    loop: false,
	    centerMode: true,
	    slidesPerView: 5,
	    slidesToShow: 4,
	    slidesToScroll: 4,
	    speed: 1500,
	    autoplay:{delay: 3000,disableOnInteraction: false,},

	    // If we need pagination
// 	    pagination: {
// 	      el: '.swiper-pagination',
// 	    },

	    // Navigation arrows
// 	    navigation: {
// 	      nextEl: '.swiper-button-next',
// 	      prevEl: '.swiper-button-prev',
// 	    },

	    // And if we need scrollbar
	   
	  })
	var mySwiper4 = new Swiper ('.swiper4', {
	    // Optional parameters
	    direction: 'horizontal',
	    loop: true,
	    centerMode: true,
	    slidesPerView: 5,
	    slidesToShow: 4,
	    slidesToScroll: 4,
	    speed: 1500,
	    autoplay:{delay: 3000,disableOnInteraction: false,},

	    // If we need pagination
// 	    pagination: {
// 	      el: '.swiper-pagination',
// 	    },

	    // Navigation arrows
// 	    navigation: {
// 	      nextEl: '.swiper-button-next',
// 	      prevEl: '.swiper-button-prev',
// 	    },

	    // And if we need scrollbar
	   
	  })
});
</script>