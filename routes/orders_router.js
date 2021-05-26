var express = require('express')
var router = express.Router()

var orders_ctr = require('../controllers/orders_controller')

router.post('/save', function (req, res, next) {
    orders_ctr.save(req, res, next)
})

router.post('/get', function (req, res, next) {
    orders_ctr.get(req, res, next)
})

router.post('/get-specific', function (req, res, next) {
    orders_ctr.getSpecific(req, res, next)
})

router.post('/get-specific-details', function (req, res, next) {
    orders_ctr.getSpecificDetails(req, res, next)
})

router.post('/change-status', function (req, res, next) {
    orders_ctr.changeStatus(req, res, next)
})

module.exports = router