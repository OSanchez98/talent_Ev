//añadir aspirante
var express = require('express');
var router = express.Router();
var DbConnect = require('../DbConnect');

var primary = "`idUser_Aspirante`";
var table = "user_aspirante";
var colums = "`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Descripcion`,`tipo_idTipo`";
//var columsall = "`idUser_Aspirante,`Contrasena`,`Nombre`,`Apellido_pat`,`Apellido_mat`,`Descripcion`,`tipo_idTipo`";

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
        idUser_Aspirante: req.body.idUser_Aspirante,
        Contrasena: req.body.Contrasena,
        Nombre: req.body.Nombre,
        Apellido_pat: req.body.Apellido_pat,
        Apellido_mat: req.body.Apellido_mat,
        Descripcion: req.body.Descripcion,
        tipo_idTipo: req.body.tipo_idTipo,
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
        Contrasena: req.body.Contrasena,
        Nombre: req.body.Nombre,
        Apellido_pat: req.body.Apellido_pat,
        Apellido_mat: req.body.Apellido_mat,
        Descripcion: req.body.Descripcion,
        tipo_idTipo: req.body.tipo_idTipo,
    };
    var set = 
        "Contrasena='"+ userData.Contrasena +"',"+
        "Nombre='" + userData.Nombre + "'," +
        "Apellido_pat='" + userData.Apellido_pat + "'," +
        "Apellido_mat='" + userData.Apellido_mat + "'," +
        "Descripcion='" + userData.Descripcion + "'," +
        "tipo_idTipo='" + userData.tipo_idTipo + "'" ;
    var where = "idUser_Aspirante='" + req.query.idUser_Aspirante+"'";
    DbConnect.update(table, set, where, function (error, data) {
        if (error == null)
            res.json({ "status": "ok" });
        else
            res.json(404, { "status": "notExist", "error": error });
    });
});

/*ELIMINAR ASPIRANTE
router.delete('/:idUser_Aspirante', function (req, res) {
    var idUser_Aspirante = req.params.idUser_Aspirante;
    if (idUser_Aspirante != null) {
        var where = " idUser_Aspirante="+idUser_Aspirante;        
        DbConnect.delete(table, where, function (error, data) {
            if (error == null)
                res.json({ status: ok });
            else
                res.json(404, { "msg": "notExist", "error": error });
        });
    }
    else
        res.json(500, { "msg": "The id must be numeric" });
});*/

module.exports = router;