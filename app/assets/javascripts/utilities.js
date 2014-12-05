// convert table rows to links
$('tr').on("click", function() {
    if($(this).attr('href') !== undefined){
        document.location = $(this).attr('href');
    }
});

// convert flex rows into links
$('.flex-row').on("click", function() {
  if($(this).attr('href') !== undefined){
    console.log("Row clicked");
    document.location = $(this).attr('href');
  }
});