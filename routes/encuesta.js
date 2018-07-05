var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idEncuesta`";
var table = "encuesta";
var colums = "`IdReclutador`,`AreaReclutador`,`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`,`Fecha`,`Comentarios`";

//Obtener todos los eventos
router.get('/', function (req, res, next) {
    res.send('All events');
});

module.exports = router;