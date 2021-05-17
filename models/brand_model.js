//model
var conn   = require('../services/mysql_service')

exports.save = async function(req){
    var query   = "INSERT INTO brands_tbl(brand_name)VALUES(?)"

    const result = await conn.executeQuery(query, [req.body.brand_name]).then(results => results);

    
    return true
}

exports.get = async function(){
    var query   = "SELECT * FROM brands_tbl"

    const result = await conn.getQuery(query).then(results => results);
    const arr    = result.map((item,index)=>({
        id                  : item.id,
        brand_name          : item.brand_name,
    })) 
    
    return arr
}
