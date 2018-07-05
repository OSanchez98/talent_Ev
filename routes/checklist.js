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

module.exports = router;