const express = require('express');
const router = express.Router();
var bcrypt = require('bcrypt');

/*global connection*/

/* Register Routes */
router.get('/', (req, res) => {
    res.render('register');
});

/* Register Post Method */
router.post('/', async (req, res) => {
    let salt = 10;
    let newPassword = req.body.password.toString();
    bcrypt.hash(newPassword, salt, function(error, hash) {
        if (error) throw error;
        let stmt = 'INSERT INTO users (username, password, email, profile_img) VALUES (?, ?, ?, ?);';
        let data = [req.body.username, hash, req.body.email, "defaultprofilepicture.png"];
        connection.query(stmt, data, function(err, result) {
            console.log(stmt);
            if (err) throw err;
            res.redirect('/login');
        });
    });
});

module.exports = router;