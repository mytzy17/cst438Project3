//back end part
var express = require('express');
var bodyParser = require('body-parser');
//var methodOverride = require('method-override');
var mysql = require('mysql');
var session = require('express-session');
var bcrypt = require('bcrypt');
var app = express();
var fileUpload = require('express-fileupload');


app.use(express.static('css'));
app.use(express.static('public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(fileUpload());
//check this for file uploading https://stackoverflow.com/questions/15772394/how-to-upload-display-and-save-images-using-node-js-and-express
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

function connectToDB() {
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'roob', // these probably need to be changed
        password: 'roob', // these probably need to be changed
        database: 'elearner', // these probably need to be changed
        multipleStatements: true
    });
    return connection;
}

let connection = connectToDB();
// connection.connect(); // This is for JAawsDB


//For tutorial on routes: https://www.youtube.com/watch?v=iM_S4RczozU
const login = require('./routes/login');
const register = require('./routes/register');
const quiz = require('./routes/quiz');
const user = require('./routes/user');
const admin = require('./routes/admin');
const landing = require('./routes/landing');
const grade = require('./routes/grade');

app.use("/login", login);
app.use("/register", register);
app.use("/quiz", quiz);
app.use("/user", user);
app.use("/admin", admin);
app.use("/landing", landing);
app.use("/grade", grade);


/*
The following four functions isAuthenticated, isAdmin, checkUsername, and checkPassword
are all pasted into the route files that need these functions. This is left here
for reference in case the functions in those files are lost.
*/
function isAuthenticated(req, res, next) {
    if (!req.session.authenticated) res.redirect('/login');
    else next();
}

function isAdmin(req, res, next) {
    if (!req.session.admin) res.redirect('/adminlogin');
    else next();
}

/* check username in DB */
function checkUsername(username) {
    let stmt = 'SELECT * FROM users WHERE username=?';
    return new Promise(function(resolve, reject) {
        connection.query(stmt, [username], function(error, results) {
            if (error) throw error;
            resolve(results);
        });
    });
}

/* check if password matches username */
function checkPassword(password, hash) {
    return new Promise(function(resolve, reject) {
        bcrypt.compare(password, hash, function(error, result) {
            if (error) throw error;
            resolve(result);
        });
    });
}

/* Home route */
app.get('/', (req, res) => {
    res.render('home');
});

/* About Routes */
app.get('/about', (req, res) => {
    res.render('about');
});

/* Science page */
app.get('/subject/science', (req, res) => {
    res.render('science');
});

/* Math page*/
app.get('/subject/math', (req, res) => {
    res.render('math')
});

/* English page */
app.get('/subject/english', (req, res) => {
    res.render('english');
});

/* Logout Route */
app.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/');
});

/* Error Route */
app.get('*', (req, res) => {
    res.render('error');
});

app.listen(process.env.PORT || 3000, function() {
    console.log('Server has been started');
});

//returns the date in mm-dd-yyyy format. Might be obsolete
function getDate() {
    let currDate = new Date();
    let currentDay = currDate.getDate() - 1;
    let currentMonth = currDate.getMonth() + 1;
    let currentYear = currDate.getYear() + 1900;
    //mm-dd-yyyy format
    let dateNow = currentMonth.toString() + "-" + currentDay.toString() + "-" + currentYear.toString();
    console.log(dateNow);
    console.log(currDate);
    return dateNow;
}

global.connection = connection;
module.export = app;