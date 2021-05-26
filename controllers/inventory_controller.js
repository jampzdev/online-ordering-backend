//discussion controller
var inventory_model   = require('../models/inventory_model')

exports.get = async function (req, res, next) {
    const qryRes = await inventory_model.get()
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.getByCategory = async function (req, res, next) {
    const qryRes = await inventory_model.getByCategory(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.update = async function (req, res, next) {
    const qryRes = await inventory_model.update(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}
