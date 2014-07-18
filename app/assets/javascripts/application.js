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
//= require foundation
//= require jquery_nested_form
//= require jquery.minicolors
//= require jquery.sticky-kit
//= require d3
//= require c3
//= require selectize
//= require_tree

$(document).foundation();

// Flash notice
$('#flash').slideDown(500).delay(5000).slideUp(500);

// search-toggle
$('#search-toggle').click(function() {
	console.log('search-toggle clicked');

	$('#search').slideToggle(200);
	$('#search-toggle').toggleClass("enabled")
});

// sidebar toggle
$('.sidebar-toggle').click(function() {
 	var order_id = $(this).data("id");

	$('#sidebar').toggleClass('enabled');
	$('#content').toggleClass('disabled');
	$(this).toggleClass('enabled');

	console.log("sidebar was triggered.");
});

// sticky elements
$(".sticky").stick_in_parent()

// convert table rows to links
$('tr').on("click", function() {
    if($(this).attr('href') !== undefined){
        document.location = $(this).attr('href');
    }
});

// remove required attribute for deleted nested_forms
$(document).on('nested:fieldRemoved', function (event) {
	console.log("field removed");
  $('[required]', event.field).removeAttr('required');
});