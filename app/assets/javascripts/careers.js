$(window).ready(function() {
  $(".job-description").click(function() {
    $(".job-description").removeClass("active");
    $(".job-description .content").slideUp();

    $(this).addClass("active");
    $(this).find(".content").slideDown();
  });
});