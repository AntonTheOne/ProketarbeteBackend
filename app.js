var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var expressLayouts = require('express-ejs-layouts');
var productRouter = require('./routes/products');
var spotsRouter = require('./routes/spots');
var session = require('express-session');
var cartRouter = require('./routes/cart');
var checkoutRouter = require('./routes/checkout');
var confirmationRouter = require('./routes/confirmation')
var searchRouter = require('./routes/search');
var adminRouter = require('./routes/admin');



var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

app.use(session({
  secret: 'supersecretrandomstring',
  resave: false,
  saveUninitialized: true
}));

app.use((req, res, next) => {
  res.locals.session = req.session;
  next();
});

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Use express-ejs-layouts for layout support
app.use(expressLayouts);
app.set('layout', 'layouts/public'); // Set the default layout

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


// Define routes

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/product', productRouter);
app.use('/spots', spotsRouter);
app.use('/cart', cartRouter);
app.use('/checkout', checkoutRouter);
app.use('/confirmation', confirmationRouter);
app.use('/search', searchRouter);
app.use('/admin', adminRouter);



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
