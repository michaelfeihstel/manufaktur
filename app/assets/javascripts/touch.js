// enable text selection
delete Hammer.defaults.cssProps.userSelect;

// recognize gestures on #touch-target div
var touch_target = document.getElementById('touch-target');
var toggle_sidebar = new Hammer(touch_target);

// settings: horizontal only, after 120 px distance
toggle_sidebar.get('pan').set({ direction: Hammer.DIRECTION_HORIZONTAL });
toggle_sidebar.get('pan').set({ threshold: 120 });

// swipe in sidebar
toggle_sidebar.on('panright', function(ev) {
  $('.sidebar').addClass('enabled');
  console.log(ev);
});

// swipeout sidebar
toggle_sidebar.on('panleft', function(ev) {
  $('.sidebar').removeClass('enabled');
  console.log(ev);
});