//contiene la conexion a mysql
const mysql = require('mysql');

/* promisify permite convertir codigo de callbacks a codigo de promesas o de async-await */
/* mysql no soporta hacer async-await, por tanto se usa promisify*/
const { promisify } = require('util');

const { database } = require('./keys');

/* crea una serie de hilos para hacer tareas en secuencia */
/* crear una conexion */
const pool = mysql.createPool(database);

pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('DATABASE CONNECTION WAS CLOSED');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('DATABASE HAS TO MANY CONNECTIONS');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('DATABASE CONNECTION WAS REFUSED');
        }
    }

    if (connection) connection.release();
    console.log('DB is connected');
    return;
});

/* hacer que las consultas a la BD se puedan usar con promesas o async-await */
pool.query = promisify(pool.query);

module.exports = pool;