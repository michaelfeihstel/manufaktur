// search-toggle
$('#search-toggle').click(function() {
  console.log('search-toggle clicked');

  $('#search').toggleClass("enabled")
  $('#search-toggle').toggleClass("enabled")
});