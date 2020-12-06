const express = require('express');
const router = express.Router();

/* global connection */

function isAuthenticated(req, res, next) {
    if (!req.session.authenticated) res.redirect('/login');
    else next();
}

/*landing page after successful log in */
router.get('/', isAuthenticated, (req, res) => {
    let u_id = req.session.user_id;
    let u_name = req.session.username;
    res.render('landing', { userId: u_id, username: u_name });
});

module.exports = router;