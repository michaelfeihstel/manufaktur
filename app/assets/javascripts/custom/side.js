$('[data-toggle=side]').click(function(){
  // $('.side').toggleClass("visible");
  $('body').toggleClass("show_side inactive");
  $('.main__content').toggleClass("show_side");
});

$('.main__content__overlay').click(function(){
  $('.side').removeClass("visible");
  $('.side__toggle').removeClass("visible");
  $('body').removeClass('show_side inactive');
});