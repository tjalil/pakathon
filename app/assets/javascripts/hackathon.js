$(window).ready(function() {

  // fixing left-panel on scroll
  if (Modernizr.mq('only screen and (min-width: 768px)')) {
    
    var fix_left_panel = 20;

    $(window).scroll(function() {
      //highlight active sidenav item on scroll
      $.each(['#mini-events-', "#orientation-", "#hackathon-", "#global-finals-", "#partnerships-and-funding-"], function(i, step) {
        if ($(window).scrollTop() + 105 > $(step + 'panel').offset().top) {
          $(step + 'node').addClass('active');
        } else {
          $(step + 'node').not('#mini-events-node').removeClass('active');
        }
      });

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
  };
  
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

  // making green color persist on selected sidenav item
  $('.smooth-scroll').click(function() {
    $('.smooth-scroll').removeClass('active');
    if (Modernizr.mq('only screen and (min-width: 768px)')) {
      $(this).parent().prevAll().children('a').addClass('active');
    }
    $(this).addClass('active');
  });

  // 
  $('#page-nav-btn').click(function() {
    if ($('.program-nav').hasClass('active')) {
      $('.program-nav').removeClass('active');
    } else {
      $('.program-nav').addClass('active');
    }
  });
});