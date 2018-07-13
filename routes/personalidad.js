var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');


var primary = "`idPersonalidad`";
var table="personalidad";
var columns = "`Nombre`";

/* Obtenemos y mostramos los datos de la personalidad, solo la primary key no */
router.get('/', function (req, res) {
    DbConnect.read(table,columns, null, function (error, data) {
        if (typeof data !== 'undefined' && data.length > 0)
            res.json(data);
        else
            res.json(404, { "msg": "notExist", "error": error });
    });
});
module.exports = router;
