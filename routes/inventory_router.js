var express = require('express')
var router = express.Router()

var inventory_controller = require('../controllers/inventory_controller')

router.post('/get', function (req, res, next) {
    inventory_controller.get(req, res, next)
})

module.exports = router