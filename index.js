//back end part
var express = require('express');
var bodyParser = require('body-parser');
//var methodOverride = require('method-override');
var mysql = require('mysql');
var session = require('express-session');
var bcrypt = require('bcrypt');
var app = express();

//admin credentials
var adminUser = "XXXTentacles";
var adminPassword = "Gayball";

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

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'roob', // these probably need to be changed
    password: 'roob', // these probably need to be changed
    database: 'elearner', // these probably need to be changed
    multipleStatements: true
});
// connection.connect(); // This is for JAawsDB

function isAuthenticated(req, res, next){
    if(!req.session.authenticated) res.redirect('/login');
    else next();
}

/* check username in DB */
function checkUsername(username){
    let stmt = 'SELECT * FROM users WHERE username=?';
    return new Promise(function(resolve, reject){
       connection.query(stmt, [username], function(error, results){
           if(error) throw error;
           resolve(results);
       }); 
    });
}

/* check if password matches username */
function checkPassword(password, hash){
    return new Promise(function(resolve, reject){
       bcrypt.compare(password, hash, function(error, result){
          if(error) throw error;
          resolve(result);
       }); 
    });
}

app.get('/adminlogin',function(req, res) {
    res.render('adminlogin');
});

app.post('/adminlogin', function(req, res) {
    if(req.body.adminName == adminUser && req.body.adminPW == adminPassword) {
        res.redirect('/admin');
    } else {
        res.redirect('/');
    }
});

app.get('/admin', function(req, res) {
    var stmt = "SELECT * FROM totalQuestions;";
    connection.query(stmt, function(err, result){
        if(err) throw err;
        let listOfQuestions = result;
        console.log(listOfQuestions);
        res.render('admin', {listOfQs: listOfQuestions});
    })
})

app.post('/adminadd', function(req, res) {
    var addQuestionStmt = 'INSERT INTO totalQuestions (difficulty, category, image, question, answer, gradeLvl) VALUES (?, ?, ?, ?, ?, ?);';
    let newDiff = parseInt(req.body.newDiff);
    let newImg = "";
    let newGradeLvl = parseInt(req.body.newGradeLvl);
    if (req.body.newQuestionImg.length != 0) {
        newImg = req.body.newQuestionImg;
    }
    let data = [newDiff, req.body.newCate, newImg, req.body.newQuestion, req.body.newAnswer, newGradeLvl];
    console.log(data);
    connection.query(addQuestionStmt, data, function(err, result) {
        console.log(addQuestionStmt);
        if(err) throw err;
        res.redirect('/admin');
    })
})

app.post('/admindelete', function(req, res) {
   var deleteQuestionStmt = "DELETE FROM totalQuestions WHERE questionId = " + req.body.questionIdDelete;
   connection.query(deleteQuestionStmt, function(err, result) {
      if(err) throw err;
      res.redirect('/admin'); 
   });
});

// Home route
app.get('/', function(req, res){
    res.render('home');
});

/* Login Routes */
app.get('/login', function(req, res){
    res.render('login');
});

/* Add login post method */
app.post('/login', async function(req, res){
    let isUserExist  = await checkUsername(req.body.username);
    console.log("============================");
    console.log(isUserExist[0]);
    console.log("============================");
    let hashedPasswd  = isUserExist.length > 0 ? isUserExist[0].password : '';
    console.log(req.body.password)
    let passwordMatch = await checkPassword(req.body.password, hashedPasswd);
    console.log("password match: " + passwordMatch);
    if(passwordMatch){
        req.session.authenticated = true;
        req.session.user = isUserExist[0].username;
        req.session.user_id = isUserExist[0].userId;
        console.log("authenticated: " + req.session.authenticated);
        console.log("username: " + req.session.user);
        console.log("ID: " + req.session.user_id);
        res.redirect('/landing');
    }
    else{
        console.log("error:::");
        res.render('login', {error: true});
    }
});

/* Register Routes */
app.get('/register', function(req, res){
    res.render('register');
});

/* Register Post Method */
app.post('/register', async function(req, res){
    let salt = 10;
    let newPassword = req.body.password.toString();
    bcrypt.hash(newPassword, salt, function(error, hash){
        if(error) throw error;
        let stmt = 'INSERT INTO users (username, password, email) VALUES (?, ?, ?);';
        let data = [req.body.username, hash, req.body.email];
        connection.query(stmt, data, function(err, result){
            console.log(stmt);
           if(err) throw err;
           res.redirect('/login');
        });
    });
});

/* About Routes */
app.get('/about', function(req, res){
    res.render('about');
});

/*landing page after successful log in */
app.get('/landing', isAuthenticated, function(req, res) {
    let u_id = req.session.user_id;
    let u_name = req.session.username;
    res.render('landing', {userId: u_id, username: u_name});
});

/* Logout Route */
app.get('/logout', function(req, res){
   req.session.destroy();
   res.redirect('/');
});

/* Error Route*/
app.get('*', function(req, res){
   res.render('error'); 
});

app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
});