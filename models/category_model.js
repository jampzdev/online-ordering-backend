//model
var conn   = require('../services/mysql_service')

exports.save = async function(req){
    var query   = "INSERT INTO categories_tbl(category_name)VALUES(?)"

    const result = await conn.executeQuery(query, [req.body.category_name]).then(results => results);

    
    return true
}

exports.get = async function(){
    var query   = "SELECT * FROM categories_tbl"

    const result = await conn.getQuery(query).then(results => results);
    const arr    = result.map((item,index)=>({
        id                  : item.id,
        category_name          : item.category_name,
    })) 
    
    return arr
}