const express = require('express');
const router = express.Router();

/*
global connection comment below is there to enable the route js files to reach
and use the connection DB
*/

/* global connection */
router.get('/:gid', (req, res) => {
    let stmt = "SELECT * FROM gradeLvlInfo WHERE gradeLvl = " + req.params.gid + ";";
    console.log(stmt);
    connection.query(stmt, function(err, result) {
        if (err) throw err;

        if (result.length) {
            var gradeInfo = result[0];
            console.log(gradeInfo);
            res.render('grade', { gradeInfo: gradeInfo });
        }
    })
});


module.exports = router;