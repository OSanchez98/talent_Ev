var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idUser_Aspirante`";
var table = "user_aspirante";
var colums = "`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Descripcion`,`tipo_idTipo`";

//Obtener todos los eventos
router.get('/', function (req, res, next) {
    res.send('All events');
});

module.exports = router;