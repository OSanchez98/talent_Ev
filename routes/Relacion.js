//gets con relaciones de 2 tablas   
var express = require('express');
var router = express.Router();
var DbConnect = require ('../DbConnect');

//INICIA EL SELECT DE LA TABLA DE ASISTENCIA DE ASPIRANTES
var tb1="evento";
var tb2 = "asistasp_evento";
var col1="Nombre";
var pk1 = "idEvento";
var pk2 ="Evento_idEvento";

router.get('/',function(req,res){

    var col2 = ","+tb2+"."+"evento_idEvento,"+tb2+"."+"User_Aspirante,"+tb2+"."+"tipo_idTipo";
    var on = tb1+"."+pk1+" = "+tb2+"."+pk2;
    var where = tb1+"."+pk1+"="+tb2+"."+pk2;

    DbConnect.relationTwo(tb1,col1,tb2,col2,on,where,function(error,data){
        if (typeof data !== 'undefined' && data.length > 0)
        res.json(data);
       //res.send('respond with a resource');
     else
        res.json(404, { "msg": "notExist", "error": error });
    });

});

 //TABLA UNO PARA LAS ETIQUETAS DEL RECLUTADOR
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
 //TERMINA EL SELECT DE LAS ETIQUETAS DEL RECLUTADOR


module.exports = router;