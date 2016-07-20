Chart.defaults.global.defaultFontFamily = 'franklin-gothic-urw';
Chart.defaults.global.defaultFontSize = 14;

Chart.defaults.global.hover.mode = 'label';
Chart.defaults.global.hover.animationDuration = 140;

Chart.defaults.global.tooltips.mode = 'label';

Chart.defaults.global.elements.point.hitRadius = 50;

Chart.defaults.global.elements.rectangle.borderWidth = 0;

Chart.defaults.global.elements.line.tension = 0.2;
Chart.defaults.global.elements.line.borderWidth = 1;
Chart.defaults.global.elements.line.fill = true;

var de = d3.locale({
  'decimal': ',',
  'thousands': '.',
  'grouping': [3],
  'currency': ['€ ', ''],
  'dateTime': '%a %b %e %X %Y',
  'date': '%m/%d/%Y',
  'time': '%H:%M:%S',
  'periods': ['AM', 'PM'],
  'days': ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag'],
  'shortDays': ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
  'months': ['Januar', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
  'shortMonths': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
});