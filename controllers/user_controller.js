//discussion controller
var user_mdl   = require('../models/user_model')

exports.getUsers = async function (req, res, next) {
    const qryRes = await user_mdl.getUsers()
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.saveUser = async function (req, res, next) {
    const qryRes = await user_mdl.saveUser(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.auth = async function (req, res, next) {
    const qryRes = await user_mdl.auth(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.register = async function (req, res, next) {
    const qryRes = await user_mdl.register(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}