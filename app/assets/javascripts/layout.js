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

  // drawernav
  var menuDrawer = {
    options: {
      menu: $('#drawer-nav'),
      pageContent: $('body'),
      menuBtn: $('header .drawer-btn a'),
      fullHeight: $('body').height()
    },

    init: function(options) {

      //allow custom options on init
      if (options && typeof(options) == 'object') {
        $.extend(menuDrawer.options, options);
      }

      menuDrawer.$menu = menuDrawer.options.menu;
      menuDrawer.$menu.hide();
      menuDrawer.$page = menuDrawer.options.pageContent;
      menuDrawer.$width = menuDrawer.$menu.innerWidth();
      menuDrawer.$btn = menuDrawer.options.menuBtn;

      menuDrawer.$btn.click(function(e){

        e.preventDefault();
        e.stopPropagation();

        if (menuDrawer.$page.data('state') === "open") {
          menuDrawer.hideMenu();

          if (Modernizr.mq('only screen and (max-width: 949px)')) {
            menuDrawer.options.pageContent.unbind('touchmove');
            menuDrawer.options.pageContent.removeClass('no-scroll');
          }
        } else {
          menuDrawer.revealMenu();
          
          if (Modernizr.mq('only screen and (max-width: 949px)')) {
            menuDrawer.options.pageContent.bind('touchmove', function(e) { e.preventDefault() });
            menuDrawer.options.pageContent.addClass('no-scroll');
          }
        }
      });

      menuDrawer.$close = menuDrawer.options.pageContent.click(function(){

        if (menuDrawer.$page.data('state') === "open") {
          menuDrawer.hideMenu();

          if (Modernizr.mq('only screen and (max-width: 949px)')) {
            menuDrawer.options.pageContent.unbind('touchmove');
            menuDrawer.options.pageContent.removeClass('no-scroll');
          }
        }
      });
    },

    revealMenu: function(){
      menuDrawer.$page.data('state', 'open');//.addClass('drawer-open');
      menuDrawer.$page.animate({left: -320}, 300);
      menuDrawer.$menu.slideDown();
      menuDrawer.$btn.removeClass('icon-drawer').addClass('icon-close');
    },

    hideMenu: function(){
      menuDrawer.$page.data('state', 'closed');//.removeClass('drawer-open');
      menuDrawer.$page.animate({left: 0}, 300);
      menuDrawer.$menu.slideUp(100);
      menuDrawer.$btn.removeClass('icon-close').addClass('icon-drawer');
    }
  };

  menuDrawer.init();

  // video button treatment on toronto page
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