$('[data-tab] .tab-title').on('click', function(e) {
  e.preventDefault();

  var target = $(this).children('a').attr('href');
  
  // add active class to tab titles
  $('.tab-title').removeClass("active");
  $(this).addClass("active");

  // switch to correct tab
  $('.tab').removeClass("active");
  $('.tab[data-tab="' + target +'"]').addClass("active");
  $(document.body).trigger("sticky_kit:recalc")

  // resize charts if any present
  if (typeof chart !== 'undefined') {
    chart.resize();
  }
});