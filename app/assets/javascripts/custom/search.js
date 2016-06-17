// search-toggle
$('[data-toggle="search"]').click(function() {

  // $('.search').toggleClass("visible");
  $('body').toggleClass('show_search inactive');
  $('.main__content').toggleClass("show_search");
});

// global-search
var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$('[data-role="search-input"]').keyup(function(){
  term = $(this).val();

  if (term.length > 2) {
    delay(function(){
      $.ajax({
        url: "/search",
        type: "POST",
        data: { "term": term },
        dataType: "script",
        error: function(data) {
            console.log(data);
        },
        success: function(data) {
            data
        }
      });
    }, 500 );
  }
})

$('.main__content__overlay').click(function(){
  $('.search').removeClass("visible");
  $('.search__toggle').removeClass("visible");
  $('.global-search__results').removeClass('visible');
  $('.global-search__input').val('');
  $('body').removeClass('show_search inactive');
});