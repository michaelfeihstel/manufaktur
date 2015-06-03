$('[data-toggle=side]').on("click", function(){
  $('.side').toggleClass("visible");
  $(this).toggleClass("visible");
  $('body').toggleClass("inactive");
});

$('.main__content__overlay').click(function(){
  $('.side').removeClass("visible");
  $('.side__toggle').removeClass("visible");
  $('body').removeClass('inactive');
});