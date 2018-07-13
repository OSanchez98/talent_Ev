var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary ="`idUser_Reclutador`";
var table ="user_reclutador";
var colums ="`Usuario`,`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Area_idArea`";
var thcolumns ="`Nombre`,`Apellido_pat`,`Apellido_mat`,`Area_idArea`";

/* GET users listing.
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
}); */

/* Obtenemos y mostramos los datos del reclutador */
router.get('/', function (req, res) {
  DbConnect.read(table,primary+','+thcolumns, null, function (error, data) {
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
        var where = " idUser_Reclutador="+id;
        DbConnect.read(table, thcolumns, where, function (error, data) {
        if (typeof data !== 'undefined' /*&& data.length > 0*/)
                res.json(data);
            else
                res.json(404, { "msg": "notExist", "error": error });
        });
    }
    else
      
        res.json(500, { "msg": "The id must be numeric" });
});



module.exports = router;
