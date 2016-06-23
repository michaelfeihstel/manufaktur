//= require stickykit
//= require best_in_place
//= require best_in_place.jquery-ui
//= require_tree ./custom

$(".breadcrumbs-container").stick_in_parent({
  offset_top: 55,
  bottoming: false
});

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});