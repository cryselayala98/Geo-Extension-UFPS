/* rutas de login */
const express = require('express');
const router = express.Router();

const main = require('../controllers/main');
const project = require('../controllers/project');
const admin = require('../controllers/admin');
const index = require('../controllers/index');
const { ya_inicio_sesion, verificar_autenticacion } = require('../lib/auth');

/*para autenticar al admin*/
const passport = require('passport');

/* inicio de sesion */

router.get('/login', ya_inicio_sesion, admin.loading_login);

router.post('/iniciar_sesion', (req, res, next) => {

  	passport.authenticate('local.iniciar_sesion', {
    successRedirect: '/links/mainAdmin',
	failureRedirect: '/login',
	failureFlash: true
  })(req, res, next);  
});

router.get('/cerrar_sesion', verificar_autenticacion, admin.cerrar_sesion);

module.exports = router;