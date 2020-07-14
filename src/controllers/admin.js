const controller = {};
const express = require('express')
const app = express()

const pool = require('../database');


controller.loading_login = async(req, res) => {
	let m = req.flash('message')[0];
    res.render('login',{
    	message: m
    });
};

controller.renderMainAdmin = async(req, res) => {

	let auth = undefined;
	if(req.session.authenticate) auth = req.session.authenticate;
	let s = req.flash('success')[0];
	
    const projects_query = await pool.query('SELECT codigo_proyecto, nombre_proyecto FROM proyecto_extension');
    res.render('main_admin', { 
    	projects_query: projects_query,
    	success: s 
    });
};

controller.cerrar_sesion = async(req, res) => {
    req.logOut();
	req.session.destroy();
  	res.redirect('/');
}
module.exports = controller;