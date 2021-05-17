var varieties_mdl   = require('../models/varieties_model')

exports.getVarieties = async function (req, res, next) {
    const qryRes = await varieties_mdl.getVarieties()

    res.json({
        statusCode: 200,
        devMessage: qryRes
    })
}
