$('[data-tab] .tab-title').on('click', function() {
  var target = $(this).children('a').attr('href');
  
  // refresh tab titles
  $('.tab-title').removeClass("active");
  $(this).addClass("active");

  // switch to correct tab
  $('.tab').removeClass("active");
  $('.tab' + target).addClass("active");

  console.log("Tabs: Selected " + target);
  
  return false;
});