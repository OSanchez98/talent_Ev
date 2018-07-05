var mysql = require('mysql'),
    connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'evaluator'
    }
    );

var crud = {};

crud.create = function (table, columns, data, callback) {
    if (!connection) return;
    var sql = 'INSERT INTO ' + table + '(' + columns + ') VALUES (' + data + ')';
    Query(sql, callback);
}

crud.read = function (table, columns, where, callback) {
    if (!connection) return;
    var sql = 'SELECT ' + columns + ' FROM ' + table;
    if (where != null && where != "")
        sql += ' WHERE ' + where;
    Query(sql, callback);
}

crud.update = function (table, values, where, callback) {
    if (!connection) return;
    var sql = 'UPDATE ' + table + ' SET ' + values + " WHERE " + where;
    Query(sql, callback);
}

crud.delete = function (table, where, callback) {
    if (!connection) return;
    var sql = 'DELETE FROM ' + table + ' WHERE ' + where;
    Query(sql, callback);
}

function Query(sql, callback) {
    connection.query(sql, function (error, result) {
        callback(error, result);
    });
}

module.exports = crud;