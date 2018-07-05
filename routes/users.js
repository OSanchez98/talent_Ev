var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary ="`idUser_Reclutador`";
var table ="user_reclutador";
var colums ="`Usuario`,`Contrasena`,`Apellido_pat`,`Apellido_mat`,`Area_idArea`";


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
