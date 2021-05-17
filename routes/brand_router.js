var express = require('express')
var router = express.Router()

var brand_ctrl = require('../controllers/brand_controller')

router.post('/save', function (req, res, next) {
    brand_ctrl.save(req, res, next)
})

router.post('/get', function (req, res, next) {
    brand_ctrl.get(req, res, next)
})


module.exports = router

// routes->controller->model->controller->response