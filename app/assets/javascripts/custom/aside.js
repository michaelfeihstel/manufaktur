$('.aside__toggle').on('click', function(event){
  event.preventDefault();
  $('aside').toggleClass('visible')
});