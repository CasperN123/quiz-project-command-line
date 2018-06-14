//
//  main.swift
//  pre-app-code-project
//
//  Created by (ʘᗩʘ’) on 12/06/2018.
//  Copyright © 2018 4Head. All rights reserved.
//

import Foundation

class Quiz {
    
    
    // Private variables for Quiz class
    
    private var quizId : Int
    private var title : String
    private var description : String
    private var creator : Int
  
    
    
    
    // Functions for Quiz class
    
    
    func CreateQuestions(quiz: Quiz) {
        var makingQuestions = true;
        while(makingQuestions){
            print("\n\nDo you want to add a new question? Y/N:", terminator: " ");
            if let userChoice = readLine(){
                switch userChoice.uppercased(){
                case "Y":
                    print("Please type a new question:", terminator: " ");
                    if let userQuestion = readLine(){
                        let newQuestion = Question(quizId: quiz.GetQuizId(), correctAnswerId: 0, text: userQuestion, points: 1);
                        database.AppendQuestionTable(question: newQuestion);
                        newQuestion.CreateAnswers(question: newQuestion);
                    }
                case "N":
                        print("Quiz has been saved");
                        makingQuestions = false;
                        print("Exiting");
                    
                default:
                    print("Selection not recognized");
                }
            }
        }
    }
    /*
     
     
     
     func QuizMenu(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func StartQuiz(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func ListQuestions(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     
     */
    
    func GetQuizTitle() -> String{
        return self.title;
    }
    func GetQuizDescription() -> String{
        return self.description;
    }
    
    func GetQuizId() -> Int{
        return self.quizId;
    }
    
    init(title: String, description: String, creator: Int) {
        
        self.quizId = database.GetNewQuizId();
        self.title = title
        self.description = description
        self.creator = creator
    }
}



/* Class seperator *******************************************************************************************/



class Question {
    
    // Private variables for Question class
    
    private var questionId : Int
    private var quizId : Int
    private var correctAnswerId : Int
    private var text : String
    var points : Int
    
    
    func ListAnswers(question: Question){
        for answer in database.GetAnswerTable(){
            if(answer.GetAnswerId() == question.GetQuizId()){
                print(answer.GetAnswerText());
            }
        }
    }
    
    
    func CreateAnswers(question: Question) {
        var makingAnswers = true;
        while(makingAnswers){
            print("\n\nDo you want to add a new answer? Y/N:", terminator: " ");
            if let userChoice = readLine(){
                switch userChoice.uppercased(){
                case "Y":
                    print("Please type a new answer:", terminator: " ");
                    if let questionAnswer = readLine(){
                        let newAnswer = Answer(questionId: question.GetQuestionId(), answerText: questionAnswer)
                        database.AppendAnswerTable(answer: newAnswer);
//                        question.correctAnswerId
                    }
                case "N":
                    var correctAnswerChosen = false;
                    while(!correctAnswerChosen){
                        print("\n\n\n\n\n\nYou have made the following answers:")
                        var amountOfAnswers=0;
                        for answer in database.GetAnswerTable(){
                            if(answer.GetQuestionId() == question.GetQuestionId()){
                                amountOfAnswers += 1;
                                print("Id: \(answer.GetAnswerId()):\t\(answer.GetAnswerText())");
                            }
                        }
                        if(amountOfAnswers < 2){
                            print("Minimum possible answers is 2");
                            correctAnswerChosen = true;
                            } else {
                            print("Please type the Id of correct answer:", terminator: " ");
                            if let correctAnswerChoice = readLine(), let correctAnswerInt = Int(correctAnswerChoice){
                                
                                // Checks that the id is indeed connected to the question
                                for answer in database.GetAnswerTable(){
                                    if(answer.GetQuestionId() == question.GetQuestionId()){
                                        print(answer.GetAnswerId());
                                        print(correctAnswerInt);
                                        
                                        if(answer.GetAnswerId() == correctAnswerInt){
                                            correctAnswerChosen = true;
                                        }
                                    }
                                }
                            }
                            
                            print("\n\nQuestion has been saved");
                            makingAnswers = false;
                        
                        }
                    }
                default:
                    print("Selection not recognized");
                }
            }
        }
    }
    
    // Initializer for Question class
    
    init(quizId: Int, correctAnswerId: Int, text: String, points: Int) {
        
        self.questionId = database.GetNewQuestionId();
        self.quizId = quizId;
        self.correctAnswerId = correctAnswerId
        self.text = text
        self.points = points
    }
    
    func GetPoints() -> Int {
        return self.points;
    }
    
    
    func GetQuizId() -> Int {
        return self.quizId;
    }
    
    
    func GetQuestion() -> String {
        return self.text;
    }
    
    func GetQuestionId() -> Int {
        return self.questionId;
    }
    func GetCorrectAnswer() -> Int {
        return self.correctAnswerId;
    }
    
}



/* Class seperator *******************************************************************************************/



class Answer{
    private var answerId: Int;
    private var questionId: Int;
    private var answerText: String;
    
    init(questionId: Int, answerText: String){
        self.questionId = questionId;
        self.answerText = answerText;
        self.answerId = database.GetNewAnswerId();
        
    }
    
    func GetAnswerId() -> Int{
        return self.answerId;
    }
    
    func GetQuestionId() -> Int{
        return self.questionId;
    }
    
    func GetAnswerText() -> String{
        return self.answerText;
    }
}


/* Class seperator *******************************************************************************************/



class UserAnswer{
    private var userAnswerId: Int;
    private var questionId: Int;
    private var answerId: Int;
    private var userId: Int
    
    init(questionId: Int, answerId: Int, userId: Int){
        self.userAnswerId = database.GetNewUserAnswerId();
        self.questionId = questionId;
        self.answerId = answerId;
        self.userId = userId;
        
    }
    
    func GetAnswerId() -> Int{
        return self.answerId;
    }
    
    func GetQuestionId() -> Int{
        return self.questionId;
    }
    
    func GetUserId() -> Int{
        return self.userId;
    }
}



/* Class seperator *******************************************************************************************/



class User {
    private let userId: Int;
    
    private var userFirstName: String;
    private var userMiddleName: String;
    private var userLastName: String;
    
    private var userName: String;
    private var eMail: String;
    private var password: String;
    
    // Initializer used when creating a user with the function
    init(userFirstName: String, userMiddleName: String, userLastName: String, userName: String, eMail: String, password: String){
        self.userId = database.GetNewUserId();
        
        self.userFirstName = userFirstName;
        self.userMiddleName = userMiddleName;
        self.userLastName = userLastName;
        
        self.userName = userName;
        self.eMail = eMail;
        self.password = password;
        
        // Values to properties assigned afterwards
    }
    
    func GetUserId() -> Int {
        return self.userId; // TODO: Change this
    }
    
    func GetUserFirstName() -> String {
        return self.userFirstName; // TODO: Change this
    }
    
    func GetUserName() -> String{
        return self.userName;
    }
    
    func GetPassword() -> String{
        return self.password;
    }
    
    func GetFullName() -> String{
        return "\(self.userFirstName) \((self.userMiddleName != "") ? self.userMiddleName+" " : "")\(self.userLastName)";
    }
    
    func GetUserEmail() -> String{
        return self.eMail;
    }
}



/* Class seperator *******************************************************************************************/





/* Class seperator *******************************************************************************************/



class Database {
    
    private var quizTable: [Quiz] = [];
    private var questionTable: [Question] = [];
    private var answerTable: [Answer] = [];
    private var userTable: [User] = [];
    private var userAnswerTable: [UserAnswer] = [];
    var userPoints: [Int] = [1,3,4,5,6,7,34543,3453,123,414,42,3,5,21,45]
    
    func sortedHighscore() {
    for points in (userPoints.sorted())
    {
    let userHighscores = points
        
        
        print(userHighscores)
    }
}
    
    /// userCurrentId is the increment of the key userId. It starts at 0, and not 1 because we increment it by 1 before returning the value.
    private var userCurrentId: Int = 0;
    private var answerId: Int = 0;
    private var quizId: Int = 0;
    private var userAnswerId: Int = 0;
    private var questionId: Int = 0;
    
    /// Alernative approach: Count the the rows (User objects) of userTable and add 1 (id does not equal index number of a user in the array, be cause array starts at 0)
    func GetNewUserId() -> Int {
        self.userCurrentId = self.userCurrentId + 1;
        return self.userCurrentId;
    }
    func GetNewQuestionId() -> Int {
        self.questionId = self.questionId + 1;
        return self.questionId;
    }
    

    
    
    
    func GetNewAnswerId() -> Int {
        self.answerId = self.answerId + 1;
        return self.answerId;
    }
    
    func GetNewUserAnswerId() -> Int {
        self.userAnswerId = self.userAnswerId + 1;
        return self.userAnswerId;
    }
    
    
    
    func GetNewQuizId() -> Int {
        self.quizId = self.quizId + 1;
        return self.quizId;
    }
    
    
    
    func GetQuizTable() -> [Quiz]{
        return self.quizTable;
    }
    func GetAnswerTable() -> [Answer]{
        return self.answerTable;
    }
    func GetUserAnswerTable() -> [UserAnswer]{
        return self.userAnswerTable;
    }
    func GetQuestionTable() -> [Question]{
        return self.questionTable;
    }
   
    
    
    func GetUserTable() -> [User]{
        return self.userTable;
    }
    
    
    
    func AppendAnswerTable(answer: Answer){
        self.answerTable.append(answer);
    }

    func AppendUserAnswerTable(answer: UserAnswer){
        self.userAnswerTable.append(answer);
    }

    
    func AppendQuestionTable(question: Question){
        self.questionTable.append(question);
    }

    func AppendQuizTable(quiz: Quiz){
        self.quizTable.append(quiz);
    }

    
    
    func AppendUserTable(user: User){
        self.userTable.append(user);
    }
    
    

    
    
    // NOT TODO
    func ShowQuizzes() {
        print("The following quizes exist:");
        
        print("\(quizTable)")
        
        // Run Quiz
        // Show statistics?
        // End Quiz
        print("Please choose a quiz:", terminator: " ");
        if let userSelectedQuiz = readLine(){
            print(userSelectedQuiz);
            
        let selectedQuiz = readLine()
            switch selectedQuiz {
           
            case "1":
                print("\(quizTable.index(after: 0))")
            case "2":
                print("\(quizTable.index(after: 1))")
            case "3":
                print("\(quizTable.index(after: 2))")
            case "4":
                print("\(quizTable.index(after: 3))")

            default:
                print("If you wish to return to main menu press x")
                
            }
        }
    }
    
    
    
    // TODO: Fairly important...
    func CreateQuiz(user: User){
        print("Please input quiz title: ", terminator: "");
        if let title = readLine(){
            print("Please input quiz description: ", terminator: "");
            if let description = readLine(){
                let newQuiz = Quiz(title: title, description: description, creator: user.GetUserId());
                self.AppendQuizTable(quiz: newQuiz);
                newQuiz.CreateQuestions(quiz: newQuiz);
            }
        }
    }
    
    
    /// Show all of the quizes in the database
    /// Return: quizId
    func FindQuiz() -> Quiz?{
        print("\n\n\nThe following quizes are in database");
        print("Quiz number:\t\tQuiz title:\t\t\t\tQuiz description:");
        for quiz in database.quizTable {
            print("\(quiz.GetQuizId())\t\t\t\t\t\(quiz.GetQuizTitle())\t\t\(quiz.GetQuizDescription())");
        }
        
        /// For controlling whether a database with the selected id exists
        var correctInput = false;
        while(!correctInput){
            print("Please choose a quiz number or type 0 to abort:", terminator: " ");
            if let userInput = readLine(), let userInt = Int(userInput){
                
                if(userInt == 0){
                    return nil;
                }
                
                /// Based on userInput - checks if a database with the Id exists
                for quiz in database.quizTable{
                    if(quiz.GetQuizId() == userInt){
                        
                        /* Note regarding below: Since the loop will run until a correct input has been made, and the while loop will break at the return value, this boolean seems pointless - if it was not for the posibility to choose 0 and abort */
                        correctInput = true;
                        return quiz;
                    }
                }
            }
        }
    }
}

var database: Database = Database();



/* Class seperator *******************************************************************************************/



/// The main interface which intiates the program
class Interface {
    private var currentUser: User?;
    
    /// Empty if user is logged in with account
    /// - Used for alias names
    private var userName: String = "";
    private var didUserQuit: Bool = false;
    private var isAliasUserLoggedIn: Bool = false;
    
    init(){
        print("Welcome to CaBeMa Quiz\nWe hope that you enjoy the quiz program");
        self.ShowMenu();
        
    }
    
    
    
    /// Shows the main menu
    func ShowMenu(){

        /* TODO : DELETE THIS
        for i in database.quizTable {
            print(i.getQuizTitle());
        }
        
        for q in database.questionTable {
            if(q.getQuizId() == 1){
                print(q.getQuestion());
            }
        }
        
        for a in database.answerTable {
            if(a.questionId == 1){
                print(a.answerText);
            }
        }
        */
        
        while(!didUserQuit) {

            print("""
\n\n\n
|--------------------------------|
| CaBeMa Quix                    |
|--------------------------------|
| Letter | Function              |
|--------|-----------------------|
|    L   | Login as user         |
|    C   | Create new user       |
|    A   | Login with alias      |
|    X   | Exit to promt         |
|--------------------------------|

- Your choice:
""", terminator: " ");
            
            //Needs optional unwrapping:
            let userInput = readLine()?.uppercased();
            
            switch userInput {
                
            case "L":
                self.LoginUser();
                
            case "C":
                self.CreateUser();
                
            case "A":
                self.LoginAlias();
                
            case "X":
                self.Quit();
                
            
            default:
                print("Selection not recognized");
            }
        }
    }
    
    
    
    func Quit(){
        print("Thank you for using CaBeMa");
        self.didUserQuit = true;
    }
    
    
    
    func LoginUsername() -> User?{
        let userNameAttempts: Int = 3;
        var currentUserNameAttempt: Int = 0;
        
        while(currentUserNameAttempt < userNameAttempts){
            currentUserNameAttempt += 1;
            print("Please type username: ");
            let input = readLine()
            
            for user in database.GetUserTable(){
                if user.GetUserName().uppercased() == input?.uppercased(){
                    return user
                }
            }
            
            let triesLeft = userNameAttempts-currentUserNameAttempt;
            print("Wrong username!\nYou have \(triesLeft>1 ? String(triesLeft)+" tries" : triesLeft>0 ? String(triesLeft)+" try" : "no tries") left\n")
            
        }
        return nil;
    }
    
    
    
    func LoginPassword(user: User) -> Bool {
        let loginAttempts: Int = 3;
        var currentLoginAttempt: Int = 0;
        
        while(currentLoginAttempt < loginAttempts){
            currentLoginAttempt += 1;
            print("Please type password: ");
            let input = readLine()
            
            if input == user.GetPassword() {
                return true;
            } else {
                let triesLeft = loginAttempts-currentLoginAttempt;
                print("Wrong password!\nYou have \(triesLeft>1 ? String(triesLeft)+" tries" : triesLeft>0 ? String(triesLeft)+" try" : "no tries") left\n")
            }
        }
        // If password is not guessed within three tries, then abort login
        return false
    }
    
    
    
    func LoginUser(){
    
        var userLoggingIn: User?;
            
        userLoggingIn = LoginUsername()
        
        if let userSelected = userLoggingIn{
            if(LoginPassword(user: userSelected)){
                currentUser = userSelected;
                
                 let loadingSymbol: [Character] = ["/", "-", "\\", "|", "/", "-", "\\", "|"];
                 for symbol in loadingSymbol{
                    print("Logging in... \(symbol)");
                    usleep(100_000);
                 }
                ShowMainMenu()
            }
        }
    }

    
    
    func CreateUser(){
        print("Please input username: ", terminator: "");
        if let username = readLine(){
            print("Please input password: ", terminator: "");
            if let password = readLine(){
                print("Please input first name: ", terminator: "");
                if let firstName = readLine(){
                    print("Please input middle name (not required): ", terminator: "");
                    if let middleName = readLine(){
                        print("Please input last name: ", terminator: "");
                        if let LastName = readLine(){
                            print("Please input e-mail: ", terminator: "");
                            if let eMail = readLine(){
                                
                                let newUser = User(userFirstName: firstName, userMiddleName: middleName, userLastName: LastName, userName: username, eMail: eMail, password: password);
                                database.AppendUserTable(user: newUser);
            
                                print("\n\n\nUser has been created - please login");
                                let _ = readLine();
                            
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    func LoginAlias(){
        print("Please write your alias:", terminator: " ");
        if let aliasUsername = readLine(){
            self.isAliasUserLoggedIn = true;
            self.userName = "Alias-"+aliasUsername;
            self.currentUser = User(userFirstName: "Not registered", userMiddleName: "Not registered", userLastName: "Not registered", userName: aliasUsername, eMail: "Not registered", password: "Not registered");
            self.ShowMainMenu();
        }
    }

    
    
    func ShowMainMenu(){
        var userInputUC = "";
        if let theCurrentUser = currentUser{
            while(userInputUC != "X") {
                print("""
                    \n\n\n
                    |--------------------------------|
                    | CaBeMa Quix, start menu        |
                    |--------------------------------|
                    | Letter | Function              |
                    |--------|-----------------------|
                    |    Q   | Go to quizes          |
                    |    C   | Create Quiz           |
                    |    S   | Go to scoreboards     |\(!self.isAliasUserLoggedIn ? "\n|    A   | Profile               |" : "" )
                    |    X   | Exit to main menu     |
                    |--------------------------------|
                    Logged in as: \(theCurrentUser.GetUserName())
                    
                    - Your choice:
                    """, terminator: " ");
                
                
                
                //Needs optional unwrapping ... let userInput = readLine()?.uppercased(); ... an alternative:
                if let userInput = readLine(){
                    userInputUC = userInput.uppercased();
                }
                
                func yeet() {
                    
                }
                
                switch userInputUC {
                    
                case "Q":
                    var userPoint = 0;
                    if let chosenQuiz = database.FindQuiz(){
                        
                        print("\n\n\n");
                        for question in database.GetQuestionTable() {
                            
                            if(question.GetQuizId() == chosenQuiz.GetQuizId()) {
                                print("\n\n\(question.GetQuestion())");
                                for answer in database.GetAnswerTable(){
                                    if(answer.GetQuestionId() == question.GetQuestionId()){
                                        print("Id: \(answer.GetAnswerId()): \(answer.GetAnswerText())");
                                    }
                                }
                                
                                print("Please choose the id that corresponds to the answer:", terminator: " ");
                                if let userAnswer = readLine(), let userAnswerInt = Int(userAnswer){
                                    if(question.GetCorrectAnswer() == userAnswerInt){
                                        userPoint += question.GetPoints();
                                        print("Correct, you received \(question.GetPoints()) point. Points are now: \(userPoint)\n\n\n");
                                    } else {
                                        print("Wrong answer, it was the one with id: \n\(question.GetCorrectAnswer())");
                                    }
                                    
                                    if(!self.isAliasUserLoggedIn){
                                        if let userIs = self.currentUser{
                                            let newUserAnswer = UserAnswer(questionId: question.GetQuestionId(), answerId: userAnswerInt, userId: userIs.GetUserId());
                                            database.AppendUserAnswerTable(answer: newUserAnswer);
                                        }
                                    }
                                }
                            
                                
                            }
                        }
                        
                        print("\n\nQuiz over - points: \(userPoint)");
                        
                    }
                    
               
                case "C":
                    if let user = self.currentUser{
                        database.CreateQuiz(user: user);
                    }
                    
                case "S":
                    ScoreBoard()
                    
                    
                case "A":
                    if(!self.isAliasUserLoggedIn){
                        var loading = true
                        while loading == true {
                            print("Fetching data /")
                            usleep(500000)
                            print("Fetching data -")
                            usleep(500000)
                            print("Fetching data \\")
                            usleep(500000)
                            print("Fetching data |")
                            usleep(500000)
                   
                          
                            loading = false
                        }
                        ShowProfileCredentials()
                    }
                    
                /// Exits program
                case "X":
                    // Effectively signed out if choice is X through while loop
                    self.isAliasUserLoggedIn = false;
                    
                default:
                    print("Selection not recognized");
                }
                
            }
        }
    }
    
    
    
    // TODO ... if a singleScore is requested - go directly to show scores of quizId - otherwise show selection menu...
    func ScoreBoard() {
        
       
        
       
        
        print("""
            \n\n\n
            |--------------------------------|
            | BEST QUIZZERS IN THE LONELY CS |
            |--------------------------------|
            """);
        for user in database.GetUserTable(){
            print("| \((user.GetUserFirstName())) | \((self.SummarizeScores(userId: user.GetUserId())))|");
        }
            
            
        print("Press the right key to leave :)");
        let _ = readLine();
        
    }
    
    func SummarizeScores(userId: Int) -> Int{
        var summarizedPoints = 0;
        for answer in database.GetUserAnswerTable(){
            
            for question in database.GetQuestionTable(){
                if(answer.GetUserId() == userId){
                    if(answer.GetAnswerId() == question.GetCorrectAnswer()){
                        summarizedPoints += question.GetPoints();
                    }
                }
            }
        }
        
        return summarizedPoints;
        
    }
    
    
    
    func ShowProfileCredentials(){
        if let theCurrentUser = currentUser{
            print("\n\n\n\nWelcome to your profile: \(theCurrentUser.GetUserName())")
            print("FullName: \(theCurrentUser.GetFullName())")
            print("This is your connected e-mail: \(theCurrentUser.GetUserEmail())")
            print("Current points: \(database.userPoints)")
            print("Press any key to return to main manu...")
            let _ = readLine();
        }
    }
    
    
    func GetCurrentUser() -> User?{
        return self.currentUser
    }
    
}



/* Class seperator *******************************************************************************************/



/// This creates some objects in the database so that it is not empty
func populateDatabase(){
    
    /* Make some users */
    let makeUsers: [String] = [
        "Casper", "", "Nørgaard", "Casper", "casper@somewhere.dk", "1234",
        "Benjamin", "", "Sandland", "Benjamin", "benjamin@somewhereelse.com", "9ABC",
        "Maria", "", "Clemmensen", "Maria", "maria@somewhereinbetween.net", "5678",
        "Peter", "Rudolf", "Hansen", "Peter", "peter@hotmail.com", "abcd",
        "Jens", "", "Hansen", "Jens", "jens@hotmail.com", "abcd",
        "Thomas", "Fido", "Pedersen", "Thomas", "thomas@hotmail.com", "abcd"
    ];
    
    var i: Int = 0;
    while i < makeUsers.count {
        let newUser = User(userFirstName: makeUsers[i], userMiddleName:  makeUsers[i+1], userLastName:  makeUsers[i+2],
                           userName:  makeUsers[i+3], eMail:  makeUsers[i+4], password:  makeUsers[i+5])
        database.AppendUserTable(user: newUser);
        i+=6;
    }
    /* Make some users */
    
    
    /* Make some Quizes */
    let makeQuizes: [String] = [
        "Computer Science", "Basic questions regarding computer science", "1"
    ];

    i = 0;
    // Force unwrap used below, because it is merely static data being loaded
    while i < makeQuizes.count {
        let newQuiz = Quiz(title: makeQuizes[i], description: makeQuizes[i+1], creator: Int(makeQuizes[i+2])!);
        database.AppendQuizTable(quiz: newQuiz);
        i+=3;
    }
    /* Make some Quizes */
    
    
    // Make Questions
    let makeQuestions: [String] = [
        "1", "5", "What is HDD?", "1",
        "1", "7", "What is the best cheapest of these?", "1",
        "1", "8", "What is the correct reprensation of a sacartic face?"
    ];
    
    i = 0;
    // Force unwrap used below, because it is merely static data being loaded
    while i < makeQuestions.count {
        let newQuestion = Question(quizId: Int(makeQuestions[i])!, correctAnswerId: Int(makeQuestions[i+1])!, text: makeQuestions[i+2], points: 1);
        database.AppendQuestionTable(question: newQuestion);
        i+=4;
    }
    
    
    // Make answers
    let makeAnswers: [String] = [
        "1", "Highly Disfunctional Diagnosies",
        "1", "Heavy Drive Disk",
        "1", "High Density Drive",
        "1", "Hydraulic Disk Drive",
        "1", "Hard Disk Drive",
        "2", "MacBook",
        "2", "Toshiba PC",
        "3", "1Head",
        "3", "2Head",
        "3", "3Head",
        "3", "5Head",
        "3", "monkaS",
        "3", "1/2Head",
        "3", "4Head",
    ];
    
    i = 0;
    // Force unwrap used below, because it is merely static data being loaded
    while i < makeAnswers.count {
        let newAnswer = Answer(questionId: Int(makeAnswers[i])!, answerText: makeAnswers[i+1])
        database.AppendAnswerTable(answer: newAnswer);
        i+=2;
    }
    // Make answers
}

populateDatabase();







/// This creates and starts the program
var main = Interface();

var donger4Head = print("4Head")


