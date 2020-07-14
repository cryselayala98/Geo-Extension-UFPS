const controller = {};

const pool = require('../database');

controller.renderProjectDetail = async(req, res) => {
    const project_query = await pool.query('SELECT * FROM proyecto_extension WHERE codigo_proyecto =' + req.params.project_id);
    const instituciones_query = await pool.query('SELECT * FROM institucion_proyecto JOIN institucion_aliada ON institucion_proyecto.id_institucion = institucion_aliada.id WHERE institucion_proyecto.id_proyecto =' + req.params.project_id);
    const autores_query = await pool.query('SELECT * FROM autor_proyecto JOIN autor ON autor.id = autor_proyecto.id_autor WHERE autor_proyecto.id_proyecto =' + req.params.project_id);
    const fechas = await pool.query('SELECT DATE_FORMAT(fecha_inicio, \'%Y-%m-%d\') AS f_i, DATE_FORMAT(fecha_fin, \'%Y-%m-%d\') AS f_f FROM proyecto_extension WHERE codigo_proyecto =' + req.params.project_id);
    res.render('detail_project', {
        proyecto: project_query[0],
        instituciones: instituciones_query,
        autores: autores_query,
        fechas: fechas[0]
    });
};

controller.renderAddProject = async(req, res) => {
    res.render('project/add');
};

controller.AddProject = async(req, res) => {
    // console.log(req.body);
    const {
        codigo,
        nombre,
        programa,
        convenio,
        duracion,
        fecha_inicio,
        fecha_fin,
        poblacion,
        grupo_investigacion,
        estado,
        descripcion,
        correo
    } = req.body;

    const new_project = {
        codigo_proyecto: codigo,
        nombre_proyecto: nombre,
        programa_academico: programa,
        num_convenio: convenio,
        grupo_investigacion,
        meses_duracion: duracion,
        fecha_inicio,
        descripcion,
        poblacion,
        estado,
        correo_contacto: correo,
        fecha_fin
    };

    await pool.query('INSERT INTO proyecto_extension SET ?', [new_project]);
    res.redirect('/links/mainAdmin');
};

controller.renderEdit = async(req, res) => {
    const project_query = await pool.query('SELECT * FROM proyecto_extension WHERE codigo_proyecto =' + req.params.project_id);

    let en_ejecucion = project_query[0].estado;
    let finalizado = project_query[0].estado;

    if (project_query[0].estado == 'en_ejecucion') finalizado = undefined;
    else {
        en_ejecucion = undefined;
    }

    const fechas = await pool.query('SELECT DATE_FORMAT(fecha_inicio, \'%Y-%m-%d\') AS f_i, DATE_FORMAT(fecha_fin, \'%Y-%m-%d\') AS f_f FROM proyecto_extension WHERE codigo_proyecto =' + req.params.project_id);
    const instituciones_query = await pool.query('SELECT * FROM institucion_proyecto JOIN institucion_aliada ON institucion_proyecto.id_institucion = institucion_aliada.id WHERE institucion_proyecto.id_proyecto =' + req.params.project_id);
    const autores_query = await pool.query('SELECT * FROM autor_proyecto JOIN autor ON autor.id = autor_proyecto.id_autor WHERE autor_proyecto.id_proyecto =' + req.params.project_id);
    const geo = await pool.query ('SELECT * FROM georreferencia WHERE codigo_proyecto = ' + req.params.project_id);
    res.render('project/edit', {
        proyecto: project_query[0],
        instituciones: instituciones_query,
        autores: autores_query,
        en_ejecucion: en_ejecucion,
        finalizado: finalizado,
        fechas: fechas[0],
        georreferencia: geo
    });
};

controller.remove = async(req, res) => {

};

controller.edit = async(req, res) => {
    const {
        codigo,
        nombre,
        programa,
        convenio,
        duracion,
        fecha_inicio,
        fecha_fin,
        poblacion,
        grupo_investigacion,
        estado,
        descripcion,
        correo
    } = req.body;

    const project_edit = {
        codigo_proyecto: codigo,
        nombre_proyecto: nombre,
        programa_academico: programa,
        num_convenio: convenio,
        grupo_investigacion,
        meses_duracion: duracion,
        fecha_inicio,
        descripcion,
        poblacion,
        estado,
        correo_contacto: correo,
        fecha_fin
    };
    await pool.query('UPDATE proyecto_extension set ? WHERE codigo_proyecto = ?', [project_edit, codigo]);
    res.redirect('/links/' + req.params.project_id + '/editar');
};

controller.authorRegister = async(req, res) => {
    const {
        id,
        nombre,
        tipo,
        unidad_academica,
        cargo
    } = req.body;

    const new_author = {
        id,
        nombre,
        unidad_academica,
        cargo,
        tipo
    };
    await pool.query('INSERT INTO autor SET ?', [new_author]);

    /* relacionar el autor al proyecto */
    const new_author_project = {
        id_autor: id,
        id_proyecto: req.params.project_id
    };
    await pool.query('INSERT INTO autor_proyecto SET ?', [new_author_project]);
    res.redirect('/links/' + req.params.project_id + '/editar');
};

controller.institutionRegister = async(req, res) => {
    try {
        const {
            nombre,
            descripcion_institucion
        } = req.body;

        const new_institution = {
            nombre,
            descripcion: descripcion_institucion
        };
        await pool.query('INSERT INTO institucion_aliada SET ?', [new_institution]);

        /* relacionar la institucion al proyecto */

        /* seleccionarel id de la ultima institucion registrada */
        const id_institution = await pool.query('SELECT id FROM institucion_aliada ORDER BY id DESC LIMIT 1;');
        const new_institution_project = {
            id_proyecto: req.params.project_id,
            id_institucion: id_institution[0].id
        };
        await pool.query('INSERT INTO institucion_proyecto SET ?', [new_institution_project]);

        res.redirect('/links/' + req.params.project_id + '/editar');

    } catch (err) {
        console.log(err);
    }
};

controller.insertGeo = async(req, res) => {

    try{
        const new_geo = {
            codigo_proyecto: req.params.project_id,
            latitud: req.params.latitud,
            longitud: req.params.longitud,
            descripcion : req.params.descripcion
    };

    await pool.query('INSERT INTO georreferencia SET ?', [new_geo]);

    res.redirect('/links/'+ req.params.project_id + '/editar'); 

    }catch(err){
        console.log(err);
    }
};

controller.search_geo = async(req, res)=> {
    const query = await pool.query('SELECT * FROM georreferencia WHERE codigo_proyecto =' + req.params.project_id);
    res.json({ geo_ref: query });
};

controller.eliminar_ubicaciones = async(req, res)=>{

   try{
        await pool.query('DELETE FROM georreferencia WHERE codigo_proyecto =' + req.params.project_id);
    
        res.redirect('/links/'+ req.params.project_id + '/editar');
   }catch(err){
        console.log(err);
   }
};


module.exports = controller;