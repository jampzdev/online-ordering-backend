var express = require('express')
var router = express.Router()

var cat_ctrl = require('../controllers/category_controller')

router.post('/save', function (req, res, next) {
    cat_ctrl.save(req, res, next)
})

router.post('/get', function (req, res, next) {
    cat_ctrl.get(req, res, next)
})


module.exports = router

// routes->controller->model->controller->response