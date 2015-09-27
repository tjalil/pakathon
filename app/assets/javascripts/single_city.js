$(window).ready(function() {
  
  var hero_height = $('.single-city-hero').height();
  var sections = $('.menu-target');
  var status = $('#current-section p').text();

  $(window).scroll(function() {
    activateStickyMenu();

    for(i = 0; i < sections.length; i++) {
      updateStatus(sections[i]);
    }
  });

  showStickyMenu();

  function activateStickyMenu() {
    if ($(window).scrollTop() >= hero_height ) {
      $('.sticky-nav').show();
    } else {
      $('.sticky-nav').hide();
    }
  };

  function showStickyMenu() {
    $('.menu-items').hide().removeClass('active');

    $('#sticky-nav-menu-btn').click(function() {
      if ($('.menu-items').hasClass('active')) {
        $('.menu-button').removeClass('icon-close').addClass('icon-drawer');
        $('.menu-items').slideUp(300).removeClass('active');
      } else {
        $('.menu-button').removeClass('icon-drawer').addClass('icon-close');
        $('.menu-items').slideDown(300).addClass('active');
      }
    });
  };

  function updateStatus(obj) {
    var top_of_object = $(obj).offset().top;
    var bottom_of_window = $(window).scrollTop() + $(window).height();

    if ($(window).scrollTop() + 120 > $(obj).offset().top) {
      $('#current-section p').text($(obj).attr("data-title"));
      status = $(obj).attr("data-title");
    }
  };
});