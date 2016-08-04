//= require stickykit
//= require_tree ./custom

$(".breadcrumbs-container").stick_in_parent({
  offset_top: 55,
  bottoming: false
});

$(document).on('turbolinks:load', function() {
   if (typeof chart !== 'undefined') {
     chart.resize();
   }
});