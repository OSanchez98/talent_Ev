//gets con relaciones de 2 tablas   
var express = require('express');
var router = express.Router();
var DbConnect = require ('../DbConnect');

var table1 ="etiquetas";
var primarytab1="idEtiquetas"
var table2 ="area_etiquetas";
var primarytab2="Etiquetas_idEtiquetas"
var columns1 = "Nombre";
var columns2 = "Area_idArea"

//obtenemos con where
router.get('/:id', function (req, res) {
    var id = req.params.id;
    if (id != null) {
        var on =table1+"."+primarytab1+"="+table2+"."+primarytab2;
        var where = table2+"."+columns2+"=" + id ;
        DbConnect.relation(table1,table2,columns1,on,where, function (error, data) {
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