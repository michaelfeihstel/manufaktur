$('[data-toggle=side]').click(function(){
  $('.side').toggleClass("visible");
  $('body').toggleClass("inactive");
});

$('.main__content__overlay').click(function(){
  $('.side').removeClass("visible");
  $('.side__toggle').removeClass("visible");
  $('body').removeClass('inactive');
});