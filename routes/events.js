var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idEvento`";
var table = "evento";
var colums = "`Nombre`,`Descripcion`,`Fecha`,`Locacion`";

//Obtener todos los eventos
router.get('/filt', function (req, res, next) {
    res.send('All events');
});
/* Obtenemos y mostramos los datos del evento, solo la primary key no */
router.get('/', function (req, res) {
    DbConnect.read(table,colums, null, function (error, data) {
        if (typeof data !== 'undefined' && data.length > 0)
            res.json(data);
        else
            res.json(404, { "msg": "notExist", "error": error });
    });
});

module.exports = router;

