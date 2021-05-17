var mysql   = require('mysql')
var conn = mysql.createConnection({
    host        : 'localhost',
    user        : 'root',
    password    : '',
    database    : 'online_ordering_db'
})

exports.getQuery = async function(sql, params){
    return new Promise((resolve, reject) => {
        conn.query(sql,params, function(err, results) {
          if (err) {
            console.log(err)
            throw err;
          }
          resolve(results);
        });
    })
}

exports.executeQuery = async function(sql, params){
  return new Promise((resolve, reject) => {
      conn.query(sql,params, function(err, results) {
        if (err) {
          console.log(err)
          throw err;
        }
        resolve(true);
      });
  })
}
