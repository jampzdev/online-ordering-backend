var express = require('express')
var router = express.Router()

var admin_ctrl = require('../controllers/admin_controller')

router.post('/auth', function (req, res, next) {
    admin_ctrl.auth(req, res, next)
})



module.exports = router
