var orders_mdl   = require('../models/orders_model')

exports.save = async function (req, res, next) {
    const qryRes = await orders_mdl.save(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.get = async function (req, res, next) {
    const qryRes = await orders_mdl.get(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.getSpecific = async function (req, res, next) {
    const qryRes = await orders_mdl.getSpecific(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.getSpecificDetails= async function (req, res, next) {
    const qryRes = await orders_mdl.getSpecificDetails(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.changeStatus= async function (req, res, next) {
    const qryRes = await orders_mdl.changeStatus(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}
