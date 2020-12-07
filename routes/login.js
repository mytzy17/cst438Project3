const express = require('express');
const router = express.Router();
var bcrypt = require('bcrypt');

/*
global connection comment below is there to enable the route js files to reach
and use the connection DB
*/

/* global connection */

/* Login Routes */
router
    .get('/', (req, res) => {
        res.render('login');
    }) 
    .post('/', async(req, res) => { /* login post method */
        let isUserExist = await checkUsername(req.body.username);
        console.log("============================");
        console.log(isUserExist[0]);
        console.log("============================");
        let hashedPasswd = isUserExist.length > 0 ? isUserExist[0].password : '';
        console.log(req.body.password)
        let passwordMatch = await checkPassword(req.body.password, hashedPasswd);
        console.log("password match: " + passwordMatch);
        if (passwordMatch) {
            req.session.authenticated = true;
            req.session.user = isUserExist[0].username;
            req.session.user_id = isUserExist[0].userId;
            console.log("authenticated: " + req.session.authenticated);
            console.log("username: " + req.session.user);
            console.log("ID: " + req.session.user_id);
            res.redirect('/landing');
        }
        else {
            console.log("error:::");
            res.render('login', { error: true });
        }
    });

/* checks username in DB */
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

module.exports = router;