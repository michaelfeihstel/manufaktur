$('.lazy_load').each(function(index, element) {
  e = $(element)
  $.ajax({
    url: e.data('url'),
    type: 'GET',
    error: function(response){
    },
    success: function(response){
      response
    }
  });
});