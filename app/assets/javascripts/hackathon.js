$(window).ready(function() {

  // fixing left-panel on scroll
  if (Modernizr.mq('only screen and (min-width: 768px)')) {
    
    var fix_left_panel = 20;

    $(window).scroll(function() {
      if ($(window).scrollTop() >= 1) {
        $('.left-panel').css({
          'position': 'fixed',
          // 'margin-top': '-10px',
        });
      } else {
        $('.left-panel').css({
          'position': 'relative',
          'margin-top': '0',
        });
      }
    });
  }

  // smooth scroll to anchor links
  $(function() {
    $('.smooth-scroll').click(function(e) {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') 
          || location.hostname == this.hostname) {

          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
             if (target.length) {
        e.preventDefault();
      $('html,body').stop().animate({
         scrollTop: target.offset().top - 100
      }, 1200);
          }
      }
    });
  });
});