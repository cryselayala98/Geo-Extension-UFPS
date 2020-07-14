/*configurar dependencias*/

const path = require('path');
const express_handlebars = require('express-handlebars');
const session = require('express-session');
const morgan = require('morgan');
const multer = require('multer');
const express = require('express');
var cookieParser = require('cookie-parser');
const errorHandler = require('errorhandler');
const validator = require('express-validator');
/* auth */
const passport = require('passport');
const bodyParser = require('body-parser');
const connectFlash = require('connect-flash');
const expressSession = require('express-session');

const MySQLStore = require('express-mysql-session')(session);

var sessionStore = new session.MemoryStore;

const {database} = require('../keys');

module.exports = (app) => {

    /* settings */
    app.set('port', process.env.PORT || 3000);

    /* conocer donde se encuentra la carpeta views, luego puedo hacer esto-> app.get('views') */
    app.set('views', path.join(__dirname, '../views'));
    /* path.join -> unir ruta de src con views */

    app.engine('.hbs', express_handlebars({

        /* definir la vista que siempre se cargara */
        defaultLayout: 'main',

        /* indicar que partials y layouts está dentro de la carpeta views*/
        partialsDir: path.join(app.get('views'), 'partials'),
        layoutsDir: path.join(app.get('views'), 'layouts'),
        extname: '.hbs',
        helpers: require('./helpers')

    }));

    app.set('view engine', '.hbs');

    //middlewares

    app.use(morgan('dev'));
    app.use(bodyParser.urlencoded({extended: false}));
    app.use(bodyParser.json());

    /* recibir informacion que proviene de formularios */
    app.use(express.urlencoded({ extended: false }));

    /* para manejo de peticiones http por medio de ajax */
    app.use(express.json());
    app.use(cookieParser('secret'));
    
    app.use(session({
      secret: 'geoextension',
      resave: false,
      saveUninitialized: true,
      store: new MySQLStore(database)
    }));

    app.use(connectFlash());
    app.use(passport.initialize());
    app.use(passport.session());
    app.use(validator());

    /* routes */
    app.use(require('../routes/index'));
    app.use(require('../routes/authentication'));
    app.use('/links', require('../routes/links'));
    /* capturar info del archivo index de la carpeta routes */

    /* global variables */

    app.use((req, res, next) => {
       // app.locals.message = req.flash('message'); /*que el programa los mensajes que esten definidos por 'message' y 'success'*/
       // app.locals.success = req.flash('success');
        app.locals.session = req.session.passport;
        app.locals.user = req.user;

      //  console.log(req.session);
        next();
    });

    /* static files -> hacer uso de la carpeta public */
    app.use('/public', express.static(path.join(__dirname, '../public')));

    /* errorhandlers */


    /* uso de errorHandler en modo de desarrollo */
    if ('development' === app.get('env')) {
        app.use(errorHandler);
    }


    return app;
}