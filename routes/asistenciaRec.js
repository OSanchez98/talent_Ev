//tabla de asistencia aspirantes
var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`Evento_idEvento`";
var table = "user_aspirante";
var colums = "`user_Reclutador`,`Reclutador_Area_idArea`";

//Obtener todos los eventos
router.get('/', function (req, res, next) {
    res.send('All events');
});
/* Obtenemos y mostramos los datos del evento, solo la primary key no */
router.get('/', function (req, res) {
    DbConnect.read(table,primary+","+colums, null, function (error, data) {
        if (typeof data !== 'undefined' && data.length > 0)
            res.json(data);
        else
            res.json(404, { "msg": "notExist", "error": error });
    });
});
module.exports = router;