var express = require('express')
var router = express.Router()

var prod_ctr = require('../controllers/product_controller')

router.post('/save', function (req, res, next) {
    prod_ctr.save(req, res, next)
})

router.post('/get', function (req, res, next) {
    prod_ctr.get(req, res, next)
})

router.post('/get-inventory', function (req, res, next) {
    prod_ctr.getInventory(req, res, next)
})

router.post('/get-specific-product', function (req, res, next) {
    prod_ctr.getSpecificProduct(req, res, next)
})


module.exports = router

// routes->controller->model->controller->response