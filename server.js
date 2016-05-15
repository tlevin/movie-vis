var Express = require('express');

var app = Express();

app.use(Express.static(__dirname + '/dist'));

var server = app.listen(3000, function() {
  console.log('Express server running.')
})