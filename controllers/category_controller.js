//discussion controller
var cat_mdl   = require('../models/category_model')

exports.save = async function (req, res, next) {
    const qryRes = await cat_mdl.save(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}

exports.get = async function (req, res, next) {
    const qryRes = await cat_mdl.get()
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}