var conn   = require('../services/mysql_service')
const email        = require('../services/email_service')

exports.save = async function(req){
    let user = req.body.user_id
    let msg = "Order Placed <br><br><table class='table table-striped'><thead><tr><td>Product Name</td><td>QTY</td></tr></thead><tbody>"

    var query   = "INSERT INTO orders_tbl(user_id,payment_method,grand_total)VALUES(?,?,?)"

    const result = await conn.getQuery(query, [user.key,req.body.payment_method,req.body.grand_total]).then(results => results);
    let orderId  = result.insertId
    let products = req.body.products


    for(let i=0;i<products.length;i++){
        let data        =  products[i]
        let color       =  data.color.color
        let size        =  data.size.size
        msg+="<tr><td>" + data.product_name + "</td><td>"+ data.quantity +"</td></tr>"

        var qryProd   = "INSERT INTO orders_products_tbl(order_id,product_id,size,color,quantity,total_price)VALUES(?,?,?,?,?,?)"
        const result  =  conn.getQuery(qryProd, [orderId,data.key,size,color,data.quantity,data.total_price]).then(results => results);
    }

    msg +="</tbody></table>"

    email.sendMail(user.email,"Your order details",msg)
    return true
}

exports.get = async function(){
    var query   = "SELECT a.id,a.user_id,CONCAT(b.`fname` ,' ', b.`lname`) AS fullname,a.payment_method,a.order_status,a.grand_total,a.date_created FROM orders_tbl a INNER JOIN users_tbl b ON b.id = a.user_id"

    const result = await conn.getQuery(query).then(results => results);
    const arr    = result.map((item,index)=>({
        id                      : item.id,
        user_id                 : item.user_id,
        fullname                : item.fullname,
        payment_method          : item.payment_method,
        order_status            : item.order_status,
        grand_total             : item.grand_total.toFixed(2),
        date_created            : item.date_created
    })) 
    
    return arr
}

exports.getSpecific = async function(req){
    var query   = "SELECT a.id,a.user_id,CONCAT(b.`fname` ,' ', b.`lname`) AS fullname,a.payment_method,a.order_status,a.grand_total,a.date_created FROM orders_tbl a INNER JOIN users_tbl b ON b.id = a.user_id WHERE a.id=?"

    const result = await conn.getQuery(query,[req.body.key]).then(results => results);
    const arr    = result.map((item,index)=>({
        id                      : item.id,
        user_id                 : item.user_id,
        fullname                : item.fullname,
        payment_method          : item.payment_method,
        order_status            : item.order_status,
        grand_total             : item.grand_total.toFixed(2),
        date_created            : item.date_created
    })) 
    
    return arr[0]
}

exports.getSpecificDetails = async function(req){
    var query   = "SELECT a.id,b.product_name,b.img,a.size,a.color,a.quantity,a.`total_price` FROM orders_products_tbl a INNER JOIN products_tbl b ON b.id = a.product_id WHERE a.order_id = ?"

    const result = await conn.getQuery(query,[req.body.key]).then(results => results);
    const arr    = result.map((item,index)=>({
        id                      : item.id,
        product_name            : item.product_name,
        img                     : "http://localhost:3001/"+item.img,
        size                    : item.size,
        color                   : item.color,
        quantity                : item.quantity,
        total_price             : item.total_price.toFixed(2)
    })) 
    
    return arr
}

exports.changeStatus = async function(req){
    var query   = "UPDATE orders_tbl SET order_status = ? WHERE id = ?"
    const result = await conn.getQuery(query, [req.body.order_status,req.body.key]).then(results => results);

    return true
}
