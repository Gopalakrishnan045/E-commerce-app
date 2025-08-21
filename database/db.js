const mysql = require("mysql");

const connection = mysql.createConnection({
  host: '172.31.47.218',
  user: 'root',
  password: 'Root@Pass2025',
  database: 'myapp',
});

connection.connect((err) => {
  if (err) console.log(err);
  else console.log("MySQL is connected...");
});

module.exports = connection;
