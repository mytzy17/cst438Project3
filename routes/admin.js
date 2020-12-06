const express = require('express');
const router = express.Router();
var bcrypt = require('bcrypt');

/*
global connection comment below is there to enable the route js files to reach
and use the connection DB
*/

/* global connection */

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

router.get('/login', (req, res) => {
    res.render('adminlogin');
});

router.post('/login', async (req, res) => {
    console.log("HERE");
    let isUserExist = await checkUsername(req.body.username);
    console.log("============================");
    console.log(isUserExist[0]);
    console.log("============================");
    let hashedPassword = isUserExist.length > 0 ? isUserExist[0].password : '';
    let passwordMatch = await checkPassword(req.body.password, hashedPassword);
    console.log(req.body.password);
    console.log("pwmatch: " + passwordMatch);
    if (passwordMatch) {
        if (isUserExist[0].isAdmin == 1) {
            console.log("is an admin!");
            req.session.admin = true;
        }
        else {
            console.log("NOT an admin!");
            req.session.admin = false;
        }
        req.session.authenticated = true;
        req.session.user = isUserExist[0].username;
        req.session.user_id = isUserExist[0].userId;
        res.redirect('/admin');
    }
});

router.get('/', isAuthenticated, isAdmin, (req, res) => {
    var stmt = "SELECT * FROM totalQuestions;";
    connection.query(stmt, function(err, result) {
        if (err) throw err;
        let listOfQuestions = result;
        console.log(listOfQuestions);
        res.render('admin', { listOfQs: listOfQuestions });
    })
})

router.post('/add', isAuthenticated, isAdmin, (req, res) => {
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
        if (err) throw err;
        res.redirect('/admin');
    })
})

router.post('/delete', isAuthenticated, isAdmin, (req, res) => {
    var deleteQuestionStmt = "DELETE FROM totalQuestions WHERE questionId = " + req.body.questionIdDelete;
    connection.query(deleteQuestionStmt, function(err, result) {
        if (err) throw err;
        res.redirect('/admin');
    });
});

module.exports = router;