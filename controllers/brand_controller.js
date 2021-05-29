var brand_mdl   = require('../models/brand_model')

exports.save = async function (req, res, next) {
    const qryRes = await brand_mdl.save(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.update = async function (req, res, next) {
    const qryRes = await brand_mdl.update(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.get = async function (req, res, next) {
    const qryRes = await brand_mdl.get()
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}