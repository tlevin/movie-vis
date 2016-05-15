var Express = require('express');

var app = Express();

app.use(express.static('dist'));

var server = app.listen(80, function() {
  console.log('Express server running.')
})