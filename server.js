
/**
 * Module dependencies.
 */
require('coffee-script-redux/register');

var express = require('express');
var http = require('http');
var path = require('path');
var pgAdapter = require('./apps/pg-adapter');

var app = express();




// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.cookieParser('your secret here'));
app.use(express.session());

//custom middlewarez. This block should be after express.session() but before app.router
app.use(function(req, res, next){
  res.locals.session = req.session;
  next();
});

app.use(app.router);
app.use(require('stylus').middleware(__dirname + '/public'));
app.use(express.static(path.join(__dirname, 'public')));



// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

// apps
require('./apps/units/routes')(app, pgAdapter);
require('./apps/authentication/routes')(app);

app.get('/', function(req, res){
  res.render('index', {title: "Express"});
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

module.exports = app;