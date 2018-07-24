var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idCheckList`";
var table = "checklist";
var colums = "`Rec_idUser_Reclutador`,`Rec_Area_idArea`,`idEtiquetas`,`Valor`";

//Obtener todos los eventos
router.get('/', function (req, res, next) {
    res.send('All events');
});
/* Insertamos lista con valores*/
router.post("/", function (req, res) {
    var userData = {
        idCheckList: req.body.idCheckList,
        Rec_idUser_Reclutador: req.body.Rec_idUser_Reclutador,
        Rec_Area_idArea: req.body.Rec_Area_idArea,
        idEtiquetas: req.body.idEtiquetas,
        Valor: req.body.Valor,
    };
    console.log(userData);
    var data = "'" + userData.idCheckList +"',"+
        "'" + userData.Rec_idUser_Reclutador +"',"+
        "'" + userData.Rec_Area_idArea + "'," +
        "'" + userData.idEtiquetas + "'," +
        "'" + userData.Valor + "'";
    DbConnect.create(table, primary + ',' + colums, data, function (error, data) {
        if (data)
            res.json({ status: "ok" });
        else
            //console.log(error); comente esto porque era lo que imprimia el error
            res.sendStatus(404);
    });
});

module.exports = router;