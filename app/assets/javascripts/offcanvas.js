var snapper = new Snap({
  element: document.getElementById('touch-target')
});

snapper.settings({
  disable: 'right',
  addBodyClasses: true,
  hyperextensible: true,
  resistance: 0.5,
  flickThreshold: 50,
  transitionSpeed: 0.5,
  easing: 'ease',
  maxPosition: 266,
  minPosition: -266,
  tapToClose: true,
  touchToDrag: true,
  slideIntent: 40,
  minDragDistance: 5
})