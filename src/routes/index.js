/*funciones de usuario en general*/
const express = require('express');
const router = express.Router();

const main = require('../controllers/main');
const project = require('../controllers/project');
const convocation = require('../controllers/convocation');
const admin = require('../controllers/admin');
const index = require('../controllers/index');


router.get('/', index.renderIndex);
router.get('/convocatoria', index.renderConvocatoria);
router.get('/contacto', index.renderContacto);

router.post('/consultar_geo_proyectos', index.consultarGeoProyectos);

router.get('/:project_id/ver_detalle', project.renderProjectDetail);

router.get('/proyectos', main.renderProjects);
router.get('/convocatoria', main.renderConvocatoria);

router.get('/:project_id/search_geo', project.search_geo);

module.exports = router;