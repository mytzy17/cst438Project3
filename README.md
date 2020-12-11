=======
## E-Learner

E-Learner is a website that allows children of all ages to quiz themselves and learn with different subjects.

Created by **Roober Cruz**, **Mytzy Escalante Godinez**, **Miguel Espitia**, **Carmelo Hernandez**

Link to heroku-running app:

### User Stories

* [x] Users can register and log in
* [x] Users can take quizzes of different subjects or quizzes with questions from different subjects.
* [x] Users can accumulate points based on their quiz performances.
* [x] Users can use said points to purchase different backgrounds from a website store. This encourages users to continue quizzing themselves.
* [x] Admin users can add different questions into the database.
* [x] Admin users can also see user information.

**USES**:
* [x] Express
* [x] EJS
* [x] Git
* [x] Mysql
* [x] JawsDB
* [x] Heroku


### Iteration 1

**User Story:** Set up backend functionality by Roober:
> I started out with setting up the index.js file that uses Express JS for the handling
> of routes. I also set up the back end code for creating a new account/registering and logging in.

**User Story:** Set up database for backend and frontend to communicate by Miguel:
>Throughout the first iteration of the project I worked on creating the tables in the 
>database and populating them with a mix of permanent and temporary information.

**User Story:** Set up Frontend/HTML of home, about, grades, register, login, admin by Mytzy:
> I worked on the implementation of the frontend and HTML of the following pages using BootStrap 4.
> In addition to that I also implemented the navbar so the user could be able to access multiple pages and browse around. 

**User Story:** Setup the HTML pages of English, Science, and Math by Carmelo:
> I have started the implementation of the English, Science, and Math pages using HTML, 
> then I converted these pages to ejs. Also, I did some changes to the app.css file.

### Iteration 2

**User Story:** Set up basic question manipulation in admin by Roober:
> I started the basic functionality of how an admin might interact with the questions in the database
> and created an add and delete function for the admin to add or delete questions.
> I also added a view questions modal window that displays all questions in the database.

**User Story:** HTML changes/backend fixes and SQL modification by Miguel:
>Through iteration 2 I worked on HTML and backend to make sure our information was being posted
>into the database, such as registering a new user. Along with that came the usual SQL changes 
>and bug fixing in HTML pages such as register.ejs.

**User Story:** Modified the backend of navbar and landing page by Mytzy:
> I modified the navbar implementation code due to that there were minor changes that I needed to add 
> so it could be user friendly. Then created a second navbar ejs file so once the user logged in, the sign in page and login page
> would not show up in the navbar no more.

**User Story:** Implementation of the travis.yml file by Carmelo:
> In this iteration, I created the travis.yml file to check the test deployment every time
> that we pushed code to GitHub. Also, I completed the English, Science, and Math pages.

### Iteration 3

**User Story:** Landing page and starting quiz by Roober:
> Over the 3rd iteration and part of thanksgiving, I worked on the basic backend functionality
>of the landing page which included two buttons, user profile and take quiz. The take quiz button
>opens up a modal where you can choose your options. I also implemented the quiz page along with the 
>submission of the quiz to the DB. 

**User Story:** HTML designing and fixes by Miguel:
>Apart from more SQL modifications to work around our code that was being continuosly changed
>this iteration I helped Roober with his modal. This was mostly because he did the backend functionality of it and
>it had no organization or HTML/CSS to it.

**User Story:** Modified the backend/frontend of navbar, landing page, grades page by Mytzy:
> Throughout iteration 3, there really wasn't much to do. I was in charge of rearragining elements on the frontend of the following pages. 
> Also the grades ejs files were modified and implemented into one grade ejs file so their wouldn't be so many of them. Also the template
> of the landing page and nav bar was modified in order to be more user friendly.

**User Story:** Modified elearner.sql by Carmelo:
> In this iteration, I was working in the backend in the elearner.sql. and I added the questions and answers for English, Science, and Math from grades 1 to 6.

### Iteration 4

**User Story:** Rearranging things, quiz Results, and file upload by Roober:
> For this last iteration, I decided to clean up our main file, index.js and move most of the
>code into different routes. I also made a results page after quiz submission that shows 
>what questions a user got wrong and what they got right along with a percentage 
>which will be stored into the DB. I also implemented a file upload for images for
>the user's profile picture.

**User Story:** Avatar addition for userprofile HTML/CSS/backend/userprofile records by Miguel:
>For the final iteration, I worked on the avatar idea for our userprofile. Essentially the idea was to have an 
>avatar for every user to be able to "evolve" as they got more and more correct answers in quizzes. An example being
>if they reach 10 correct questions their avatar will evolve and so on. Unfortunately, this idea was scrapped in the end
>because it would've led to further bugs that we did not want to risk in order to prioritze the other functionality of project.
>Lastly, in userprofile I implemented a separate tab in which we would show the users passed tests, correct answers and the ID of that specific test.

**User Story:** Frontend/Backend work on user profile, quiz, result page, and edit profile pages by Mytzy:
> In the last iteration of the project I implemented and designed the following pages. I made the user profile look more nicer as in rearranging the outputed 
> information that needed to be display as well as creating a button in order for the user to be able to edit their profile.
> Also I rearranged div elements and designed so the outputted information in both quiz and result page could look presentable.

**User Story:** Modified user profile page by Carmelo:
> For this last iteration, I added other information rows in the user profile page to show a summary of the quizzes taken from the users when they click on the tab records. 
