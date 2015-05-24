$(window).ready(function() {
  if (Modernizr.mq('only screen and (min-width: 768px)')) {
    
    var fix_left_panel = 292;

    $(window).scroll(function() {
      if ($(window).scrollTop() >= fix_left_panel) {
        $('.left-panel').css({
          'position': 'fixed',
          'margin-top': '-300px',
        });
      } else {
        $('.left-panel').css({
          'position': 'relative',
          'margin-top': '0',
        });
      }
    });
  }
});