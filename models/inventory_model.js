//model
var conn   = require('../services/mysql_service')

exports.get = async function(){
    var query   = "SELECT id,inventory_id,product_name,product_desc,category_id,brand_id,img,category_name,size_id,size_name,color_id,color_name,price,quantity,is_active FROM inventory_view"

    const result = await conn.getQuery(query).then(results => results);
    const arr    = result.map((item,index)=>({
        id                      : item.id,
        inventory_id            : item.inventory_id,
        product_name            : item.product_name,
        product_desc            : item.product_desc,
        category_id             : item.category_id,
        brand_id                : item.brand_id,
        img                     : "http://localhost:3001/"+item.img,
        category_name           : item.category_name,
        size_id                 :item.size_id,
        size_name               : item.size_name,
        color_id                : item.color_id,
        color_name              : item.color_name,
        price                   : item.price,
        quantity                : item.quantity,
        is_active               : item.is_active
    })) 
    
    return arr
}


exports.getByCategory = async function(req){
    var query   = "SELECT id,product_name,product_desc,category_id,brand_id,img,category_name,size_name,color_name,price,quantity,is_active FROM inventory_view WHERE category_id = ?"

    const result = await conn.getQuery(query,[req.body.category_id]).then(results => results);
    const arr    = result.map((item,index)=>({
        id                      : item.id,
        product_name            : item.product_name,
        product_desc            : item.product_desc,
        category_id             : item.category_id,
        brand_id                : item.brand_id,
        img                     : "http://localhost:3001/"+item.img,
        category_name           : item.category_name,
        size_name               : item.size_name,
        color_name              : item.color_name,
        price                   : item.price,
        quantity                : item.quantity,
        is_active               : item.is_active
    })) 
    
    return arr
}


exports.update = async function(req){
    var query   = "UPDATE `inventory_tbl` SET quantity = ? WHERE id = ?"

    const result = await conn.executeQuery(query,[req.body.quantity,req.body.inventory_id]).then(results => results);
    
    return true
}