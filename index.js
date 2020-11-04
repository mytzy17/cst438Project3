//back end part
var express = require('express');
var bodyParser = require('body-parser');
//var methodOverride = require('method-override');
var mysql = require('mysql');
var session = require('express-session');
var bcrypt = require('bcrypt');
var app = express();


app.use(express.static('css'));
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));
//app.use(methodOverride('_method'));
app.use(session({
    secret: 'top secret code!',
    resave: true,
    saveUninitialized: true
}));
app.set('view engine', 'ejs');

// const connection = mysql.createConnection({
//     host: process.env.HOST,
//     user: process.env.USERNAME,
//     password: process.env.PASSWORD,
//     database: process.env.DATABASE,
//     multipleStatements: true
// });

// const connection = mysql.createConnection({
//     host: 'localhost',
//     user: 'mytzy',
//     password: 'mytzy',
//     database: 'cheese',
//     multipleStatements: true
// });
// connection.connect(); // This is for JAawsDB

function isAuthenticated(req, res, next){
    if(!req.session.authenticated) res.redirect('/login');
    else next();
}