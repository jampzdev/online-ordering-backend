//model
var conn   = require('../services/mysql_service')
 
module.exports = {
    getVarieties:async ()=>{
        var query   = "SELECT id,variety_name,is_active FROM varieties_tbl"

        const result = await conn.getQuery(query, null).then(results => results);
        const arr    = result.map((item,index)=>({
            key                     : item.id,
            variety_name            : item.variety_name,
            is_priceable            : item.is_priceable,
            is_active               : item.is_active,
        })) 

        return arr
    },
} 