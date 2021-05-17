//discussion controller
var prod_mdl   = require('../models/product_model')

exports.save = async function (req, res, next) {
    const qryRes = await prod_mdl.save(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.get = async function (req, res, next) {
    const qryRes = await prod_mdl.get()
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.getInventory = async function (req, res, next) {
    const qryRes = await prod_mdl.getInventory(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.getSpecificProduct = async function (req, res, next) {
    const qryRes = await prod_mdl.getSpecificProduct(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}
