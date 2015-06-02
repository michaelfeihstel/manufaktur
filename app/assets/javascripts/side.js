$('[data-toggle=side]').on("click", function(){
  $('.side').toggleClass("visible");
  $(this).toggleClass("visible");
  $('.main__content').data("toggle", "side");
});