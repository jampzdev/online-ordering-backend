//model
const conn         = require('../services/mysql_service')
const email        = require('../services/email_service')
const randomstring = require("randomstring");

exports.getUsers = async function(){
    var query   = "SELECT * FROM users_tbl WHERE id = ?"

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
    var query   = "INSERT INTO users_tbl(fname,mname,lname)VALUES(?,?,?)"

    const result = await conn.getQuery(query, [params.fname,params.mname,params.lname]).then(results => results);

    return result.insertId
}

exports.auth = async function(req){
    var query   = "SELECT id,fname,mname,lname,email,is_active FROM users_tbl WHERE email = ? AND phash = MD5(?)"

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

exports.register = async function(req){
    let tmp_pwd = randomstring.generate(6);
    params = req.body
    var query   = "INSERT INTO users_tbl(email,fname,mname,lname,phash)VALUES(?,?,?,?,MD5(?))"

    const result = await conn.getQuery(query, [params.email,params.fname,params.mname,params.lname,tmp_pwd]).then(results => results);
    let title   = "New Account"
    let message = "Here's your temporary password <b>" + tmp_pwd + "</b>"
    email.sendMail(params.email,title,message)

    return result.insertId
}