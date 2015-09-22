$(window).ready(function() {
  
  if (Modernizr.mq('only screen and (min-width: 768px)')) {
    $(window).scroll(function() {

      var hero_height = $('.single-city-hero').height();

      if ($(window).scrollTop() >= hero_height ) {
        $('.sticky-nav').show();
      } else {
        $('.sticky-nav').hide();
      }
    });
  }
});