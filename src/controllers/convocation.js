const controller = {};
const express = require('express')
const app = express()

const pool = require('../database');

controller.render_convocations = async(req, res) => {
	
};

controller.renderAddConvocation = async(req, res) => {
	
};

controller.AddConvocation = async(req, res) => {
	res.render('convocation/add');
};

controller.renderEdit = async(req, res) => {
	
};

controller.edit = async(req, res) => {
	
};

controller.remove = async(req, res) => {
	
};

module.exports = controller;