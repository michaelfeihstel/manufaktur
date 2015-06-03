// search-toggle
$('[data-toggle="search"]').click(function() {

  $('.search').toggleClass("visible");
  $(this).toggleClass("visible");
  $('body').toggleClass('inactive');
});


$('.main__content__overlay').click(function(){
  $('.search').removeClass("visible");
  $('.search__toggle').removeClass("visible");
  $('body').removeClass('inactive');
});