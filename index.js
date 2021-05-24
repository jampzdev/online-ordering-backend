const express           = require('express'); //framework nodeJS
// const bodyParser        = require('body-parser');
const cors              = require('cors');

var app                 = express();
var user_router         = require('./routes/user_router')
var brand_router        = require('./routes/brand_router')
var categoy_router      = require('./routes/category_router')
var product_router      = require('./routes/product_router')
var varieties_router    = require('./routes/varieties_router')
var admin_router        = require('./routes/admin_router')
var orders_router       = require('./routes/orders_router')
var inventory_router    = require('./routes/inventory_router')

var upload_router       = require('./routes/upload_router')

app.use(cors());
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb'}));


app.use(express.static(__dirname+'/images'));

app.use("/users",user_router)
app.use("/brand",brand_router)
app.use("/category",categoy_router)
app.use("/product",product_router)
app.use("/varieties",varieties_router)
app.use("/admin",admin_router)
app.use("/orders",orders_router)
app.use("/inventory",inventory_router)

app.use("/upload",upload_router)

app.listen(3001, () => console.log('Express server is running at port no : 3001'));
