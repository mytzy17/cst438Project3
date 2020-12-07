const express = require('express');
const router = express.Router();

/*
global connection comment below is there to enable the route js files to reach
and use the connection DB
*/

/* global connection */

function isAuthenticated(req, res, next) {
    if (!req.session.authenticated) res.redirect('/login');
    else next();
}

router.get('/:uname', isAuthenticated, (req, res) => {
    console.log("User page");
    console.log("params username: " + req.params.uname);
    var stmt = 'SELECT * FROM users where username = \'' + req.params.uname + '\';';
    connection.query(stmt, function(error, result) {
        if (result.length) {
            if (error) throw error;
            let userInfo = result[0];
            res.render('userprofile', { userInfo: userInfo });
        }
    });
});

router.post('/:uid/updatepicture', isAuthenticated, (req, res) => {
    let randNum1 = Math.floor(100000 + Math.random() * 90000000);
    let randNum2 = Math.floor(100000 + Math.random() * 90000000);
    console.log(req.files);
    if (!req.files) {
        return res.status(400).send('No files were uploaded.');
    }

    var file = req.files.uploaded_image;
    file.name = randNum1.toString() + file.name.substring(0, file.name.lastIndexOf(".")) + randNum2.toString() + file.name.substr(file.name.lastIndexOf("."));
    console.log(file);
    var img_name = file.name;


    if (file.mimetype == "image/jpeg" || file.mimetype == "image/png" || file.mimetype == "image/gif") {
        file.mv('public/images/uploaded_images/' + file.name, function(err) {
            if (err) throw err;
            console.log("userId: " + req.session.user_id);
            console.log("img_name: " + img_name);
            let stmt = 'update users set profile_img=\'' + img_name + '\' where userId = ' + req.session.user_id + ";";
            connection.query(stmt, function(err, result) {
                if (err) throw err;
                res.redirect('/user/' + req.session.user);
            })
        })
    }
})

router.post('/:uid/updateemail', isAuthenticated, (req, res) => {
    console.log("User page");
    var stmt = 'update users set email = \'' + req.body.email + '\' where userId=' + req.session.user_id + ';';
    connection.query(stmt, function(error, result) {
        console.log("Query update Started");
        console.log("reached here!");
        if (error) throw error;
        res.redirect('/user/' + req.session.user);
    });
});

router.get('/:uid/updateemail', (req, res) => {
    var stmt = 'SELECT * FROM users where userId = ' + req.session.user_id + ';';
    connection.query(stmt, function(error, result) {
        if (result.length) {
            if (error) throw error;
            let userInfo = result[0];
            res.render('editprofile', { userInfo: userInfo });
        }
    });
});

module.exports = router;