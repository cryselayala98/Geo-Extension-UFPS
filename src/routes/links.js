/*funciones que realiza el administrador*/
const express = require('express');
const router = express.Router();

const main = require('../controllers/main');
const project = require('../controllers/project');
const convocation = require('../controllers/convocation');
const admin = require('../controllers/admin');
const index = require('../controllers/index');
const { verificar_autenticacion } = require('../lib/auth');

/*funciones de los proyectos */
router.get('/mainAdmin', verificar_autenticacion, admin.renderMainAdmin);

router.get('/add_project', verificar_autenticacion, project.renderAddProject);
router.post('/add_project', verificar_autenticacion, project.AddProject);

router.get('/:project_id/editar', verificar_autenticacion, project.renderEdit);
router.post('/:project_id/editar', verificar_autenticacion, project.edit);
router.delete('/:project_id/eliminar', verificar_autenticacion, project.remove);

router.post('/:project_id/registrarAutor', verificar_autenticacion, project.authorRegister);
router.post('/:project_id/registrarInstitucion', project.institutionRegister);

router.get('/:project_id/agregar_georreferencia/:latitud/:longitud/:descripcion', verificar_autenticacion, project.insertGeo);
router.get('/:project_id/eliminar_ubicaciones', verificar_autenticacion, project.eliminar_ubicaciones);

/*funciones de las convocatorias*/
router.get('/manage_convocations', verificar_autenticacion, convocation.render_convocations);

router.get('/add_convocation', verificar_autenticacion, convocation.renderAddConvocation);
router.post('/add_convocation', verificar_autenticacion, convocation.AddConvocation);

router.get('/:convocation_id/editar', verificar_autenticacion, convocation.renderEdit);
router.post('/:convocation_id/editar', verificar_autenticacion, convocation.edit);

router.delete('/:convocation_id/eliminar', verificar_autenticacion, convocation.remove);

module.exports = router;

