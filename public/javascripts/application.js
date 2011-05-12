$(function() {
  var faye = new Faye.Client('http://vivid-sword-660.heroku.com/bayeux');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});
