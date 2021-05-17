//model
var conn   = require('../services/mysql_service')

exports.auth = async function(req){
    var query   = "SELECT id,fname,mname,lname,email,is_active FROM admin_tbl WHERE email = ? AND passhash = MD5(?)"

    const result = await conn.getQuery(query, [req.body.email,req.body.passhash]).then(results => results);
    const arr    = result.map((item,index)=>({
        key                 : item.id,
        fname               : item.fname,
        mname               : item.mname,
        lname               : item.lname,
        email               : item.email,
        displayname         : item.fname + ' ' + item.lname,
        is_active           : item.is_active,
    })) 
    
    return arr
}