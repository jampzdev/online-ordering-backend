//model
var conn   = require('../services/mysql_service')
var numeral = require('numeral');

exports.save = async function(req){
    let product_name = req.body.product_name
    let category_id = req.body.category_id
    let brand_id = req.body.brand_id
    let size = req.body.size
    let colors = req.body.colors
    let product_desc = req.body.product_desc
    let img = req.body.img

    console.log(size)

    var query   = "INSERT INTO products_tbl(product_name,product_desc,category_id,brand_id,img)VALUES(?,?,?,?,?)"

    const result = await conn.getQuery(query, [product_name,product_desc,category_id,brand_id,img]).then(results => results);
    let prod_id = result.insertId

    size.forEach(e => {
        var query1   = "INSERT INTO product_sizes_tbl(product_id,size_name,price)VALUES(?,?,?)"
        const resSize = conn.getQuery(query1, [prod_id,e.size,e.price]).then(results => results);

        colors.forEach(i => {
            if(i.size == e.size){
                var query2  = "INSERT INTO product_colors_tbl(product_id,size_name,color_name,add_price)VALUES(?,?,?,?)"
                const resColor = conn.executeQuery(query2, [prod_id,e.size,i.color,i.price]).then(results => results);
            }
        })
    
    });

 
    return true
}

exports.get = async function(){
    var query   = "SELECT * FROM products_view"
    var arr = [];
    const result = await conn.getQuery(query).then(results => results);

    result.forEach(elem => {
        let a = elem.sizes.split(",")
        var sizes = []
        // console.log("1",a)

        a.forEach(e1 => {
            var tmp_colors = []
            let b = e1.split("-")
            b1 = b[0].split("|")

            let c = b[1].split("/")

            c.forEach(e3 => {
                let d = e3.split("~")

                var tmp_color_add_price = {
                    color : d[0],
                    add_price : d[1]
                }
                
                tmp_colors.push(tmp_color_add_price)
            })
    
            var tmp_size = {
                size : b1[0],
                price: b1[1],
                colors :tmp_colors
            }
            sizes.push(tmp_size)
        })
        var tmp = {
            id                      : elem.id,
            product_name            : elem.product_name,
            product_desc            : elem.product_desc,
            category_name           : elem.category_name,
            brand_name              : elem.brand_name,  
            sizes                   : sizes,
            img                     : "http://localhost:3001/"+elem.img,

        }
        arr.push(tmp)
    })
    return arr
}

exports.getInventory = async function(req){
    var query   = "SELECT id,product_name,product_desc,category_id,brand_id,brand_name,img,category_name,size_name,color_name,price,quantity,is_active FROM inventory_view"

    const result = await conn.getQuery(query).then(results => results);
    const arr    = result.map((item,index)=>({
        key                : item.id,
        product_name       : item.product_name,
        product_desc       : item.product_desc,
        category_id        : item.category_id,
        brand_id           : item.brand_id,
        brand_name         : item.brand_name,
        img                : "http://localhost:3001/"+item.img,
        category_name      : item.category_name,
        size_name          : item.size_name,
        color_name         : item.color_name,
        price              : numeral(item.price).format('0,0.00'),
        quantity           : item.quantity,
        is_active          : item.is_active,

    })) 

    
    return arr
}

exports.getSpecificProduct = async function(req){
    var query   = "SELECT * FROM products_view WHERE id = ?"
    var arr = [];
    const result = await conn.getQuery(query,[req.body.key]).then(results => results);

    result.forEach(elem => {
        let a = elem.sizes.split(",")
        var sizes = []
        // console.log("1",a)

        a.forEach(e1 => {
            var tmp_colors = []
            let b = e1.split("-")
            b1 = b[0].split("|")

            let c = b[1].split("/")

            c.forEach(e3 => {
                let d = e3.split("~")

                var tmp_color_add_price = {
                    color : d[0],
                    add_price : d[1]
                }
                
                tmp_colors.push(tmp_color_add_price)
            })
    
            var tmp_size = {
                size : b1[0],
                price: b1[1],
                colors :tmp_colors
            }
            sizes.push(tmp_size)
        })
        var tmp = {
            id                      : elem.id,
            product_name            : elem.product_name,
            product_desc            : elem.product_desc,
            category_name           : elem.category_name,
            brand_name              : elem.brand_name,  
            img                     : "http://localhost:3001/"+elem.img,
            sizes                   : sizes
        }
        arr.push(tmp)
    })
    
    return arr[0]
}
