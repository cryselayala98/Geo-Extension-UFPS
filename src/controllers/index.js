const indexController = {};

/* traerse la conexion para realizar consultas */
const pool = require('../database');

indexController.renderIndex = async(req, res) => {
    res.render('map');
};

indexController.renderConvocatoria = async(req, res) => {

    const projects_query = await pool.query('SELECT codigo_proyecto, nombre_proyecto, programa_academico, num_convenio, grupo_investigacion, meses_duracion, fecha_inicio, descripcion, poblacion, estado, DATE_FORMAT(fecha_inicio, \'%Y\') AS year, fecha_fin FROM proyecto_extension');
    res.render('convocatoria', {
        projects_query
    });
};

indexController.renderContacto = async(req, res) => {
    res.render('contacto');
};

indexController.consultarGeoProyectos = async(req, res) => {
    const {
        convocatoria,
        programa,
        estado,
        especifico
    } = req.body;
    
    console.log(req.body);
        try {
            let other = 'WHERE LOWER(proyecto_extension.nombre_proyecto) LIKE LOWER("%' + especifico + '%") ';
            if(convocatoria != "todas"){
                other += 'AND DATE_FORMAT(proyecto_extension.fecha_inicio, \'%Y\') = "' + convocatoria + '" ';
            }

            if(programa != "todas"){
                other += 'AND proyecto_extension.programa_academico = "' + programa + '" ';
            }

            if(estado != "todas"){
                other += 'AND proyecto_extension.estado = "' + estado + '" ';
            }

            const projects_query = await pool.query('SELECT proyecto_extension.codigo_proyecto, proyecto_extension.nombre_proyecto, proyecto_extension.programa_academico, proyecto_extension.grupo_investigacion,   proyecto_extension.estado, DATE_FORMAT(proyecto_extension.fecha_inicio, \'%Y\') AS year, georreferencia.latitud, georreferencia.longitud, georreferencia.descripcion AS geo_descripcion FROM proyecto_extension JOIN georreferencia ON georreferencia.codigo_proyecto = proyecto_extension.codigo_proyecto ' + other);
            
            res.json({ proyectos: projects_query });
        } catch (err) {
            console.log(err);
        }
        
        
    
};

module.exports = indexController;