//model
var conn   = require('../services/mysql_service')

exports.get = async function(){
    var query   = "SELECT id,product_name,product_desc,category_id,brand_id,img,category_name,size_name,color_name,price,quantity,is_active FROM inventory_view"

    const result = await conn.getQuery(query).then(results => results);
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
