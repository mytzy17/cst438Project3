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

var userChosenDiff = null;
var userChosenCat = null;
var userChosenGradeLvl = null;
var userChosenNumOfQs = null;
var quizData = null;
var userAnswersForResults = null;
var finalPCT = null;
var qList = null;

router.post('/startquiz', isAuthenticated, (req, res) => {
    userChosenDiff = parseInt(req.body.chooseDiff);
    userChosenCat = req.body.chooseCat;
    userChosenGradeLvl = parseInt(req.body.chooseGrade);
    userChosenNumOfQs = parseInt(req.body.chooseNum);
    var stmt = "SELECT * FROM totalQuestions WHERE difficulty=" + userChosenDiff +
        " AND category='" + userChosenCat + "' AND gradeLvl=" + userChosenGradeLvl +
        " ORDER BY RAND() LIMIT " + userChosenNumOfQs + ";";
    connection.query(stmt ,function(err, result) {
        if(err) throw err;
        qList = result;
        console.log("STARTING QUIZ!!!!");
        console.log(qList);
        res.redirect('/quiz');
    })
});

router.get('/', isAuthenticated, (req, res) => {
    console.log("Diff:" + userChosenDiff + " Cat:" + userChosenCat + " GradeLvl:" +
        userChosenGradeLvl + " numQs:" + userChosenNumOfQs);
    /***
    This should probably change. Everytime this is refreshed. New questions pop
    up due to the query happening here. Should probably move to post method
    gotoquiz but that is not priority now.
    ***/
    console.log(qList);
    quizData = qList;
    res.render('quiz', { qList: qList, category: userChosenCat, difficulty: userChosenDiff, grade: userChosenGradeLvl });
})

function computePct(rightAns, totalQs) {
    let pct = (rightAns / totalQs) * 100;
    return pct.toFixed(2);
}
var rightAns = 0;

function calculate(userAnswers, quizData, quizLength) {
    let num = 0,
        rightAnswers = 0;
    let questionIdArray = [];
    let answerArray = [];
    for (let [key, value] of Object.entries(userAnswers)) {
        console.log(key, ":", value);
        questionIdArray.push(key);
        answerArray.push(value)
    }
    quizData.forEach(function(q) {
        console.log("Correct answer: " + q.answer);
        console.log("Your answer: " + answerArray[num]);
        if (q.answer == answerArray[num]) {
            rightAnswers++;
        }
        num++;
    })
    rightAns = rightAnswers;
    let pct = computePct(rightAnswers, quizLength);
    return pct;
}

router.post('/submit', isAuthenticated, (req, res) => {
    let totalQuestions = quizData.length;
    let userAnswers = req.body;
    userAnswersForResults = req.body;
    let pct = calculate(userAnswers, quizData, totalQuestions);
    finalPCT = pct;
    console.log("pct: ", pct);
    let dateNow = getDate();
    console.log("Current Date MM/DD/YYYY: " + dateNow);
    let stmt = "INSERT INTO quizAttempts (userId, testScore, numRightAns, totalQuestions," +
        "gradeLvl, diff, category, submissionDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    let data = [req.session.user_id, pct, rightAns, totalQuestions, userChosenGradeLvl, userChosenDiff, userChosenCat, dateNow];

    connection.query(stmt, data, function(err, result) {
        if (err) throw err;
        userChosenDiff = null;
        userChosenCat = null;
        userChosenGradeLvl = null;
        userChosenNumOfQs = null;
        res.redirect('/quiz/results');
    });
});

router.get('/results', isAuthenticated, (req, res) => {
    console.log(quizData);
    console.log(userAnswersForResults);
    let userAnswers = [];
    let questionIdArray = [];
    //parse the answers again:
    for (let [key, value] of Object.entries(userAnswersForResults)) {
        console.log(key, ":", value);
        questionIdArray.push(key);
        userAnswers.push(value)
    }

    console.log("User Answers array in results\n" + userAnswers);
    console.log("Confirm quizData length = " + quizData.length + " userAns length = " + userAnswers.length);
    res.render('result', { quizData: quizData, userAns: userAnswers, finalScore: finalPCT });
});

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

module.exports = router;