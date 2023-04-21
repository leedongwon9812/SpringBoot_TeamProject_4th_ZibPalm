$(document).ready(function () {
    $('.collapse-box1').hover(function () {
      if(!$('.collapse-hover-p1').hasClass("fadeIn")){
        $('.collapse-hover-p1').addClass('fadeIn');
        $('.collapse-hover-p1').fadeIn('slow');
      }else{
        $('.collapse-hover-p1').removeClass('fadeIn');
        $('.collapse-hover-p1').fadeOut('fast'); 
      }
    });
});
$(document).ready(function () {
    $('.collapse-box2').hover(function () {
      if(!$('.collapse-hover-p2').hasClass("fadeIn")){
        $('.collapse-hover-p2').addClass('fadeIn');
        $('.collapse-hover-p2').fadeIn('slow');
      }else{
        $('.collapse-hover-p2').removeClass('fadeIn');
        $('.collapse-hover-p2').fadeOut('fast'); 
      }
    });
});
$(document).ready(function () {
    $('.collapse-box3').hover(function () {
      if(!$('.collapse-hover-p3').hasClass("fadeIn")){
        $('.collapse-hover-p3').addClass('fadeIn');
        $('.collapse-hover-p3').fadeIn('slow');
      }else{
        $('.collapse-hover-p3').removeClass('fadeIn');
        $('.collapse-hover-p3').fadeOut('fast'); 
      }
    });
});