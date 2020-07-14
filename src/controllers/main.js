const controller = {};

const pool = require('../database');

controller.index = async(req, res) => {
    const projects_query = await pool.query('SELECT * FROM proyecto_extension');

    res.render('map', {
        proyectos: projects_query
    });
};

controller.renderProjects = async(req, res) => {

    const projects_query = await pool.query('SELECT codigo_proyecto, nombre_proyecto, programa_academico, num_convenio, grupo_investigacion, meses_duracion, fecha_inicio, descripcion, poblacion, estado, DATE_FORMAT(fecha_inicio, \'%Y\') AS year, fecha_fin FROM proyecto_extension');
    res.render('proyectos', {
        projects_query
    });
};

controller.renderConvocatoria = async(req, res) => {

};

controller.error_404 = async(req, res) => {
    res.render('404');
};

module.exports = controller;