// use submit buttons outside of form tags
$('[data-submit]').on('click', function() {
  var formId = $(this).data("submit")
  $('form[id^=' + formId + ']').submit();

  console.log("Submitting " + formId);
});

// selectize select boxes with class "selectize"
$('.selectize').selectize({
  valueField: "id",
  labelField: "full_name",
  sortField: "full_name",
  searchField: "full_name",
  maxOptions: 100
});