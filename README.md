# CaBeMa Quiz

This is a quiz-program made primarily in Swift.
The program itself is currently made with no interface (CLI) - our focus has been on functionality.

## Database
We've made an MySQL database that mirrors a lot of our data-storage inside our program, but it has not yet been implemented.

To install the database, simply export the .sql file located in the root of the repository.

## API

We have an API (made in PHP) that interacts with this database. Our goal was to demonstrate that we were not only capable of creating a database which theoretically works with the main program, but also create functionalities which can interact with this database (create quizzes, users etc)

Since we haven't implemented the database to the main program, we decided to make a small front-end page which makes use of our API. All of this is located inside *main.php*

### Installation of API

To install the API (based on an localhost setup using XAMPP) extract the *db* folder into the *htdocs* folder (or your projects folder if you've changed it)
