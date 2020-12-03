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
app.use(bodyParser.urlencoded({extended: true}));
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

function isAdmin(req, res, next) {
    if(!req.session.admin) res.redirect('/adminlogin');
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

app.post('/adminlogin', async function(req, res) {
    console.log("HERE");
    let isUserExist = await checkUsername(req.body.username);
    console.log("============================");
    console.log(isUserExist[0]);
    console.log("============================");
    let hashedPassword  = isUserExist.length > 0 ? isUserExist[0].password : '';
    let passwordMatch = await checkPassword(req.body.password, hashedPassword);
    console.log(req.body.password);
    console.log("pwmatch: " + passwordMatch);
    if(passwordMatch){
        if(isUserExist[0].isAdmin == 1) {
            console.log("is an admin!");
            req.session.admin = true;
        } else {
            console.log("NOT an admin!");
            req.session.admin = false;
        }
        req.session.authenticated = true;
        req.session.user = isUserExist[0].username;
        req.session.user_id = isUserExist[0].userId;
        res.redirect('/admin');
    }
});

app.get('/admin', isAuthenticated, isAdmin, function(req, res) {
    var stmt = "SELECT * FROM totalQuestions;";
    connection.query(stmt, function(err, result){
        if(err) throw err;
        let listOfQuestions = result;
        console.log(listOfQuestions);
        res.render('admin', {listOfQs: listOfQuestions});
    })
})

app.post('/adminadd', isAuthenticated, isAdmin,function(req, res) {
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

app.post('/admindelete', isAuthenticated, isAdmin, function(req, res) {
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
    let isUserExist = await checkUsername(req.body.username);
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
        if(req.body.color == "green"){
            let g = 'bulbasaur.gif';
            let stmt1 = 'INSERT INTO users (username, password, email, avatar, isAdmin) VALUES (?, ?, ?, ?, ?);';
            let data = [req.body.username, hash, req.body.email, g, 0];
            connection.query(stmt1, data, function(err, result){
                console.log(stmt1);
               if(err) throw err;
                res.redirect('/login');
            });
        }else if(req.body.color == "blue"){
            let b = 'squirtle.gif';
            let stmt1 = 'INSERT INTO users (username, password, email, avatar, isAdmin) VALUES (?, ?, ?, ?, ?);';
            let data = [req.body.username, hash, req.body.email, b, 0];
            connection.query(stmt1, data, function(err, result){
                console.log(stmt1);
               if(err) throw err;
                res.redirect('/login');
            });
        }else if(req.body.color == "red"){
            let r = 'charmander.gif';
            let stmt1 = 'INSERT INTO users (username, password, email, avatar, isAdmin) VALUES (?, ?, ?, ?, ?);';
            let data = [req.body.username, hash, req.body.email, r, 0];
            connection.query(stmt1, data, function(err, result){
                console.log(stmt1);
               if(err) throw err;
                res.redirect('/login');
            });
        }
    });
});
// app.post('/register', async function(req, res){
//     let salt = 10;
//     let newPassword = req.body.password.toString();
//     bcrypt.hash(newPassword, salt, function(error, hash){
//         if(error) throw error;
//         let stmt = 'INSERT INTO users (username, password, email, color, isAdmin) VALUES (?, ?, ?, ?, ?);';
//         let data = [req.body.username, hash, req.body.email, req.body.color, 0];
//         connection.query(stmt, data, function(err, result){
//             console.log(stmt);
//           if(err) throw err;
//           res.redirect('/login');
//         });
//     });
// });

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


var userChosenDiff;
var userChosenCat;
var userChosenGradeLvl;
var userChosenNumOfQs;
app.post('/gotoquiz' ,isAuthenticated, function(req, res) {
    userChosenDiff = parseInt(req.body.chooseDiff);
    userChosenCat = req.body.chooseCat;
    userChosenGradeLvl = parseInt(req.body.chooseGrade);
    userChosenNumOfQs = parseInt(req.body.chooseNum);
    res.redirect('/quiz');
});

app.get('/quiz', isAuthenticated, function(req, res) {
    console.log("Diff:" + userChosenDiff + " Cat:" + userChosenCat + " GradeLvl:"
        + userChosenGradeLvl + " numQs:" + userChosenNumOfQs);
    var stmt = "SELECT * FROM totalQuestions WHERE difficulty=" + userChosenDiff
        + " AND category='" + userChosenCat + "' AND gradeLvl=" + userChosenGradeLvl
        + " ORDER BY RAND() LIMIT " + userChosenNumOfQs + ";";
    console.log(stmt)
    
    connection.query(stmt, function(err, result) {
        if(err) throw err;
        let qList = result;
        console.log(qList);
        res.render('quiz', {qList: qList});
    })
})

app.post('/submitquiz', isAuthenticated, function(req, res) { //will be tested tomorrow
    let dateOfSubmission = new Date();
    let stmt = "INSERT INTO quizAttempts VALUES(?, ?, ?)";
    let finalscore = req.body.finalscore.toString;
    finalscore = parseFloat(finalscore).toFixed(2);
    let data = [req.session.user_id, finalscore, dateOfSubmission.toString()];
    connection.query(stmt, data, function(err, result) {
        if(err) throw err;
        userChosenDiff = null;
        userChosenCat = null;
        userChosenGradeLvl = null;
        userChosenNumOfQs = null;
        res.redirect('/landing');
    });
});

app.get('/grade/:gid', function(req, res) {
   let stmt = "SELECT * FROM gradeLvlInfo WHERE gradeLvl = " + req.params.gid + ";"; 
   console.log(stmt);
   connection.query(stmt, function(err, result) {
       if(err) throw err;
       
       if(result.length) {
           var gradeInfo = result[0];
           console.log(gradeInfo);
           res.render('grade', {gradeInfo: gradeInfo});
       }
   })
});

app.get('/user/:uid', isAuthenticated, function(req, res) {
    console.log("User page");
    var stmt = 'SELECT * FROM users where userId = ' + req.session.user_id + ';';
    connection.query(stmt, function(error, result) {
        if(result.length) {
            if(error) throw error;
            let userInfo = result[0];
            res.render('userprofile', {userInfo:userInfo});
        }
    });
});

app.post('/user/:uid/updatepicture', isAuthenticated, function(req, res) {
    console.log(req.files);
    if(!req.files) {
        return res.status(400).send('No files were uploaded.');
    }
    
    var file = req.files.uploaded_image;
	var img_name=file.name; 
	
	if(file.mimetype == "image/jpeg" || file.mimetype == "image/png"||file.mimetype == "image/gif" ) {
        file.mv('public/images/uploaded_images/' + file.name, function(err) {
            if(err) throw err;
            console.log("userId: " + req.session.user_id);
            console.log("img_name: " + img_name);
            let stmt = 'update users set profile_img=\'' + img_name + '\' where userId = ' + req.session.user_id + ";";
            connection.query(stmt, function(err, result) {
                if(err) throw err;
                res.redirect('/user/' + req.session.user_id);
            })
        })
	}
})

app.post('/user/:uid', isAuthenticated, function(req, res) {
    console.log("User page");
    var stmt = 'update users set email = \'' + req.body.email + '\' where userId=' + req.session.user_id + ';';
    connection.query(stmt, function(error, result) {
        console.log("Query update Started");
        console.log("reached here!");
        if(error) throw error;
        res.redirect('/user/:uid');
    });
});

/* Science page */
app.get('/science', function(req, res){
    res.render('science');
});

/* Math page*/
app.get('/math', function(req, res) {
    res.render('math')
});

/* English page */
app.get('/english', function(req, res) {
    res.render('english');
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
