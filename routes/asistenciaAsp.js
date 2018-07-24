//tabla de asistencia aspirantes
var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`evento_idEvento`";
var table = "asistasp_evento";
var colums = "`User_Aspirante`,`tipo_idTipo`";

//Obtener todos los eventos
router.get('/', function (req, res, next) {
    res.send('All events');
});

/* Creamos una asistencia */
router.post("/", function (req, res) {
    var userData = {
        evento_idEvento: req.body.evento_idEvento,
        User_Aspirante: req.body.User_Aspirante,
        tipo_idTipo: req.body.tipo_idTipo,
    };
    console.log(userData);
    var data =
        "'" + userData.evento_idEvento +"',"+
        "'" + userData.User_Aspirante +"',"+
        "'" + userData.tipo_idTipo + "'";
    DbConnect.create(table, primary + ',' + colums, data, function (error, data) {
        console.log(data);
        
        if (data)
            res.json({ status: "ok" });
        else
            console.log(error); //comente esto porque era lo que imprimia el error
            //res.sendStatus(404);
    });
});

module.exports = router;