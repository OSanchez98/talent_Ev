//tabla de asistencia aspirantes
var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`evento_idEvento`";
var table = "user_aspirante";
var colums = "`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Descripcion`,`tipo_idTipo`";

//Obtener todos los eventos
router.get('/', function (req, res, next) {
    res.send('All events');
});

module.exports = router;