var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idEvento`";
var table = "evento";
var colums = "`Nombre`,`Descripcion`,`Fecha`,`Locacion`";

//Obtener todos los eventos
router.get('/filter', function (req, res, next) {
    res.send('All events');
});

module.exports = router;

