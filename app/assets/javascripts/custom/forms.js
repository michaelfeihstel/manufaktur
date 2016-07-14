// use submit buttons outside of form tags
$('[data-submit]').on('click', function() {
  var formId = $(this).data("submit")
  $('form[id^=' + formId + ']').submit();

  console.log("Submitting " + formId);
});