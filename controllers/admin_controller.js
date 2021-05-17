var admin_mdl   = require('../models/admin_model')

exports.auth = async function (req, res, next) {
    const qryRes = await admin_mdl.auth(req)
    
    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}
