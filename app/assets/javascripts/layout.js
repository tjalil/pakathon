$(document).ready(function() {

  // header-transition
  $(window).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll >= 30) {
      if (!$("header.global").hasClass('headerTransition')) {
        $("header.global").addClass("headerTransition");
      }
    } else {
      if ($("header.global").hasClass('headerTransition')) {
        $("header.global").removeClass("headerTransition");
      }
    }
  });

  $('.video-action').mouseenter(function(){
    $(this).hide();
    $('.video-action-on-hover').show();
  });

  $('.video-action-on-hover').mouseleave(function(){
    $(this).hide();
    $('.video-action').show();
  });

  $('.video-action-on-hover').click(function(){
    $('.hero-text').hide();
    $('.video-action-on-click').fadeIn();
  });
  
});