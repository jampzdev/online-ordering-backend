//model
var conn   = require('../services/mysql_service')

exports.getUsers = async function(){
    var query   = "SELECT * FROM user_tbl WHERE id = ?"

    const result = await conn.getQuery(query, [1]).then(results => results);
    const arr    = result.map((item,index)=>({
        key                 : item.id,
        fname               : item.fname,
        mname               : item.mname,
        lname               : item.lname,
    })) 
    
    return arr
}

exports.saveUser = async function(req){
    params = req.query
    var query   = "INSERT INTO user_tbl(fname,mname,lname)VALUES(?,?,?)"

    const result = await conn.getQuery(query, [params.fname,params.mname,params.lname]).then(results => results);

    return result.insertId
}
