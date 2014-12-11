// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery.minicolors
//= require d3
//= require c3
//= require stickykit
//= require_tree

$(".subnav-container").stick_in_parent({
  offset_top: 55
})

// Flash notice
$('.flash').slideDown(500).delay(5000).slideUp(500);




// remove required attribute for deleted nested_forms
$(document).on('nested:fieldRemoved', function (event) {
	console.log("field removed");
  $('[required]', event.field).removeAttr('required');
});



// selectize.js for select boxes
$('.selectize').selectize();