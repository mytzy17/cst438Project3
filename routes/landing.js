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

/*landing page after successful log in */
router.get('/', isAuthenticated, (req, res) => {
    let u_id = req.session.user_id;
    let u_name = req.session.user;
    console.log("user ID: " + u_id + " and username: " + u_name);
    res.render('landing', { userId: u_id, username: u_name });
});

module.exports = router;