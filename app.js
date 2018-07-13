var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var event = require('./routes/events');
var encuesta = require('./routes/encuesta');
var personalidad = require('./routes/personalidad');
var aspirantes = require('./routes/aspirantes');
var checklist = require('./routes/checklist');
var AreaEtiquetas = require('./routes/AreaEtiquetas');
var relAreaEtiq = require('./routes/Relacion');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/events', event);
app.use('/list',checklist);
app.use('/encuesta',encuesta);
app.use('/pers',personalidad);
app.use('/aspirantes',aspirantes);
app.use('/AreaEtiquetas',AreaEtiquetas);
app.use('/EtiqName',relAreaEtiq);




// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
