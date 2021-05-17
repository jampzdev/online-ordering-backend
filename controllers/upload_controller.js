var upload_mdl   = require('../models/upload_model')

exports.save = async function (req, res, next) {
    const qryRes = await upload_mdl.save(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}