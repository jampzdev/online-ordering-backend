var express = require('express')
var router = express.Router()

var upload_ctrl = require('../controllers/upload_controller')

router.post('/save', function (req, res, next) {
    upload_ctrl.save(req, res, next)
})

module.exports = router
