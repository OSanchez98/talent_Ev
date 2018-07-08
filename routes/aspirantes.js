//añadir aspirante
var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idUser_Aspirante`";
var table = "user_aspirante";
var colums = "`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Descripcion`,`tipo_idTipo`";
var columsall = "`idUser_Aspirante,`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Descripcion`,`tipo_idTipo`";

//Obtener todos los eventos
router.get('/filt', function (req, res, next) {
    res.send('All events');
});

/* Obtenemos y mostramos todos los usuarios */
router.get('/users', function (req, res) {
    DbConnect.read(table, primary + ',' + colums, null, function (error, data) {
        if (typeof data !== 'undefined' && data.length > 0)
            res.json(data);
        else
            res.json(404, { "status": "notCreate", "error": error });
    });
});

/* Creamos un nuevo usuario */
router.post("/", function (req, res) {
    var userData = {
        idUser_Aspirante: req.query.idUser_Aspirante,
        Contrasena: req.query.Contrasena,
        Nombre: req.query.Nombre,
        Apellido_pat: req.query.Apellido_pat,
        Apellido_mat: req.query.Apellido_mat,
        Descripcion: req.query.Descripcion,
        tipo_idTipo: req.query.tipo_idTipo,
    };
    console.log(userData);
    var data = "'" + userData.idUser_Aspirante +"',"+
        "'" + userData.Contrasena +"',"+
        "'" + userData.Nombre + "'," +
        "'" + userData.Apellido_pat + "'," +
        "'" + userData.Apellido_mat + "'," +
        "'" + userData.Descripcion + "'," +
        "'" + userData.tipo_idTipo + "'";
    DbConnect.create(table, primary + ',' + colums, data, function (error, data) {
        if (data)
            res.json({ status: "ok" });
        else
            res.json(404, { "status": "notInsert", "error": error });
    });
});

/* Actualizamos un usuario existente */
router.put('/', function (req, res) {
    var userData = {
        idUser_Aspirante: req.query.idUser_Aspirante,
        Contrasena: req.query.Contrasena,
        Nombre: req.query.Nombre,
        Apellido_pat: req.query.Apellido_pat,
        Apellido_mat: req.query.Apellido_mat,
        Descripcion: req.query.Descripcion,
        tipo_idTipo: req.query.tipo_idTipo,
    };
    var set = "idUser_Aspirante='"+ userData.idUser_Aspirante +"',"+
        "Contrasena='"+ userData.Contrasena +"',"+
        "Nombre='" + userData.Nombre + "'," +
        "Apellido_pat='" + userData.Apellido_pat + "'," +
        "Apellido_mat='" + userData.Apellido_mat + "'," +
        "Descripcion='" + userData.Descripcion + "'," +
        "tipo_idTipo='" + userData.tipo_idTipo + "'" ;
    var where = 'idUser_Aspirante=' + req.query.id;
    DbConnect.update(table, set, where, function (error, data) {
        if (error == null)
            res.json({ "status": "ok" });
        else
            res.json(404, { "status": "notExist", "error": error });
    });
});

module.exports = router;