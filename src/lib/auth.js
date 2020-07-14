/*redirigir al usuario si ya inicio sesion*/

module.exports = {
    ya_inicio_sesion(req, res, next) {
        if (req.isAuthenticated()) {
            return res.redirect('/links/mainAdmin');
        }
            return next();
    },

    verificar_autenticacion(req, res, next) {
        if (req.isAuthenticated()) {
        	return next();
        }
            return res.redirect('/login');
    }
};