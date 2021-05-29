//model
var conn   = require('../services/mysql_service')

exports.save = async function(req){
    var query   = "INSERT INTO categories_tbl(category_name,img)VALUES(?,?)"

    const result = await conn.executeQuery(query, [req.body.category_name,req.body.img]).then(results => results);

    
    return true
}

exports.update = async function(req){
    var query   = "UPDATE categories_tbl set category_name = ?,img=? WHERE id = ?"

    const result = await conn.executeQuery(query, [req.body.category_name,req.body.img,req.body.key]).then(results => results);

    
    return true
}


exports.get = async function(){
    var query   = "SELECT * FROM categories_tbl"

    const result = await conn.getQuery(query).then(results => results);
    const arr    = result.map((item,index)=>({
        id                  : item.id,
        category_name          : item.category_name,
        img                     : "http://localhost:3001/"+item.img,

    })) 
    
    return arr
}
