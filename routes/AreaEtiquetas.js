var express = require('express');
var router = express.Router();
var DbConnect = require ('../DbConnect');

var primary = "`id`";
var table ="area_etiquetas";
var columns = "`Area_idArea`,`Etiquetas_idEtiquetas`";
var nombre  ="`Etiquetas_idEtiquetas`";

/* Obtenemos y mostramos los datos del reclutador */
router.get('/', function (req, res) {
    DbConnect.read(table,primary+','+columns, null, function (error, data) {
        if (typeof data !== 'undefined' && data.length > 0)
            res.json(data);
           //res.send('respond with a resource');
        else
            res.json(404, { "msg": "notExist", "error": error });
    });
  });

//obtenemos con where
router.get('/:id', function (req, res) {
    var id = req.params.id;
    if (id != null) {
        var where = "Area_idArea=" + id;
        DbConnect.read(table, nombre, where, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0)
                res.json(data);
            else
                res.json(404, { "msg": "notExist", "error": error });
        });
    }
    else
      
        res.json(500, { "msg": "The id must be numeric" });
});



module.exports = router;