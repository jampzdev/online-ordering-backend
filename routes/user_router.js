var express = require('express')
var router = express.Router()

var user_ctrl = require('../controllers/user_controller')

router.post('/get-users', function (req, res, next) {
    user_ctrl.getUsers(req, res, next)
})

router.get('/save-user', function (req, res, next) {
    user_ctrl.saveUser(req, res, next)
})

module.exports = router

// routes->controller->model->controller->response