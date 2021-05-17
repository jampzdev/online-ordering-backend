//varieties routes
var express = require('express')
var router = express.Router()

var varieties_ctrl = require('../controllers/varieties_controller')

router.post('/get', function (req, res, next) {
    varieties_ctrl.getVarieties(req, res, next)
})



module.exports = router 
