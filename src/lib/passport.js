/* Definir funciones de autenticacion*/

const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');

passport.use('local.iniciar_sesion', new LocalStrategy({

  usernameField: 'username', //name sacados del formulario de la vista
  passwordField: 'password',
  passReqToCallback: true

}, async (req, username, password, done) => { //done se ejecuta después de hacer la autenticacion

  /*para validar la existencia de ese usuario*/
  const rows = await pool.query('SELECT * FROM usuario_admin WHERE nombre_admin = ?', [username]);

  if (rows.length > 0) {

    const user = rows[0];

    const validPassword = await helpers.comparePassword(password, user.contrasenia);

    if (validPassword) {
      req.session.authenticate = 'yes';

      done(null, user, req.flash('success', 'Bienvenido ' + user.nombre_admin)); //flash se utiliza para enviar mensajes en pantalla a la pagina
      /*user -> para guardar una sesion*/
    } else {
      done(null, false, req.flash('message', 'Contraseña incorrecta.'));
    }
  } else {
    return done(null, false, req.flash('message', 'El nombre de usuario no existe.'));
  }
}));


/*contrasenias, para la sesion*/
passport.serializeUser((user, done) => {
  done(null, user.nombre_admin);
});

passport.deserializeUser(async (nombre, done) => {
  const rows = await pool.query('SELECT * FROM usuario_admin WHERE nombre_admin = ?', [nombre]);
  done(null, rows[0]);
});