//
//  main.swift
//  pre-app-code-project
//
//  Created by Bruger on 12/06/2018.
//  Copyright © 2018 4Head. All rights reserved.
//

import Foundation

class Quiz {
    
    
    // Private variables for Quiz class
    
    private var quizId : Int
    private var title : String
    private var description : String
    private var creator : Int
    private var isQuestionsRandom : Bool
    private var minimumToAnswer : Int
  
    
    
    
    // Functions for Quiz class
    
    
    /*
     
     
     
     func QuizMenu(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func StartQuiz(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func ShowScoreBoard(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func ListQuestions(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func ChangeQuestionOrder(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func EditQuestion(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func CreateQuestion(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func DeleteQuestion(<#parameters#>) -> <#return type#> {
     <#function body#>
     }*/
    
    func getQuizTitle() -> String{
        return self.title;
    }
    func GetQuizDescription() -> String{
        return self.description;
    }
    
    func getQuizId() -> Int{
        return self.quizId;
    }
    
    init(title: String, description: String, creator: Int, isQuestionsRandom: Bool, minimumToAnswer: Int) {
        
        self.quizId = database.getNewQuizId();
        self.title = title
        self.description = description
        self.creator = creator
        self.isQuestionsRandom = isQuestionsRandom
        self.minimumToAnswer = minimumToAnswer
    }
}



class Question {
    
    // Private variables for Question class
    
    private var questionId : Int
    private var quizId : Int
    private var correctAnswerId : Int
    private var text : String
    var points : Int
    
    
    // Functions for Question class
    
    func Points() {
        
        if correctAnswerId == quizId {
            
            points += 1
            
        }
    }
    
    /*
     func ListAnswers() -> <#return type#> {
     <#function body#>
     }
     
     func EditAnswers(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     
     func createAnswers() -> [QuizTable] {
     <#function body#>
     }
     
     func ChooseCorrectAnswer(<#parameters#>) -> <#return type#> {
     <#function body#>
     }*/
    
    // Initializer for Question class
    
    init(quizId: Int, correctAnswerId: Int, text: String, points: Int) {
        
        self.questionId = database.getNewUserId();
        self.quizId = quizId;
        self.correctAnswerId = correctAnswerId
        self.text = text
        self.points = points
    }
    
    func getQuizId() -> Int {
        return self.quizId;
    }
    
    
    func getQuestion() -> String {
        return self.text;
    }
    
}


/*-----------------* Quiz class -----------------*/

class Answer{
    var answerId: Int;
    var questionId: Int;
    var answerText: String;
    
    init(questionId: Int, answerText: String){
        self.questionId = questionId;
        self.answerText = answerText;
        self.answerId = database.getNewAnswerId();
        
    }
}








class User {
    private let userId: Int;
    
    private var userFirstName: String;
    private var userMiddleName: String?;
    private var userLastName: String;
    
    private var userName: String;
    private var eMail: String;
    private var password: String;
    
    // Initializer used when creating a user with the function
    init(userFirstName: String){
        self.userId = database.getNewUserId();
        
        self.userFirstName = userFirstName;
        self.userMiddleName = "TODO";
        self.userLastName = "TODO";
        
        self.userName = "TODO";
        self.eMail = "TODO";
        self.password = "TODO";
        
        // Values to properties assigned afterwards
    }
    
    func getUserId() -> Int {
        return self.userId; // TODO: Change this
    }
    
    func getUserFirstName() -> String {
        return self.userFirstName; // TODO: Change this
    }
}







/*-----------------* Database class -----------------*/

class Database {
    
    var quizTable: [Quiz] = [];
    var questionTable: [Question] = [];
    var answerTable: [Answer] = [];
    var userTable: [User] = [];
    var userPoints: [Int] = []
    
    /// userCurrentId is the increment of the key userId. It starts at 0, and not 1 because we increment it by 1 before returning the value.
    private var userCurrentId: Int = 0;
    
    /// Alernative approach: Count the the rows (User objects) of userTable and add 1 (id does not equal index number of a user in the array, be cause array starts at 0)
    func getNewUserId() -> Int {
        self.userCurrentId = self.userCurrentId + 1;
        return self.userCurrentId;
    }
    
    
   private var scoreBoardId: Int = 0;
    
   func getScoreBoardId() -> Int {
        self.scoreBoardId = self.scoreBoardId + 1;
        return self.scoreBoardId;
    }
    
    
    private var answerId: Int = 0;
    
    func getNewAnswerId() -> Int {
        self.answerId = self.answerId + 1;
        return self.answerId;
    }
    
    private var quizId: Int = 0;
    
    func getNewQuizId() -> Int {
        self.quizId = self.quizId + 1;
        return self.quizId;
    }
    
    
    
    
    
    
    
    
    /// Show all of the quizes in the database
    /// Return: quizId
    func FindQuiz() -> Int?{
        print("The following quizes are in database");
        print("Quiz number:\t\tQuiz title:\t\t\t\tQuiz description:");
        for quiz in database.quizTable {
            print("\(quiz.getQuizId())\t\t\t\t\(quiz.getQuizTitle())\t\t\t\t\(quiz.GetQuizDescription())\t\t");
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
                    if(quiz.getQuizId() == userInt){
                        
                        /* Note regarding below: Since the loop will run until a correct input has been made, and the while loop will break at the return value, this boolean seems pointless - if it was not for the posibility to choose 0 and abort */
                        correctInput = true;
                        return userInt;
                    }
                }
            }
        }
    }
}

var database: Database = Database();




//

class Scoreboard {
    init(boardId: Int, quizId: Int) {
        self.boardId = boardId;
        self.quizId = quizId;
    }
    
    let boardId: Int;
    let quizId: Int;
    var pointTable: [Int] = []
    var userIdTable: [Int] = []

    func SummarizeScores() {
        // List quizes
        if let quiz = database.FindQuiz(){
            print(quiz)
        }
        // User choose quiz - implemented in FindQuiz?
        
        // Get quizID from selected quiz
        
        // Find userAnswers related to quizId in database
        
        // Find questions related to quiz
        
            // 1. For each question compared to correct answer and userAnswers - find points.  2. Make an array of users that took quiz.
        
       
        // If an answer that user made was correct - increment that users "temporary point . array ?
        // Sort point array samtidig med bruger temp array - find top 10 ?
    }
}







/*-----------------* Interface class -----------------*/

/// The main interface which intiates the program
class Interface {
    var currentUser: User?;
    
    /// Empty if user is logged in with account
    /// - Used for alias names
    var userName: String = "";
    var didUserQuit: Bool = false;
    var isUserLoggedIn: Bool = false;
    
    init(){
        print("Welcome to CaBeMa Quiz\nWe hope that you enjoy the quiz program");
        self.ShowMenu();
        
    }
    
    /// Shows the main menu
    func ShowMenu(){
        
        
        MakeQuestions();

        
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
        
        MakeUsers();
        
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
    
  
    func loginUsername() {
        
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        var cUsername = false
        let username = "savage"
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        while(!cUsername){
            print("Please type username: ");
            let input = readLine()
                
            if input == username {
                cUsername = true
            }
                
            else {
                if input != username {
                    print("Wrong username!")
                }
            }
        }
    }
        
    func loginPassword() -> Bool {
        
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        var cPassword = false
        let password = "savage"
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        while(!cPassword){
            print("Please type password: ");
            let input = readLine()
            
            if input == password {
                cPassword = true
                return true;
            }
        }
    }
    
    func LoginUser(){
    
        var loggingIn = true
        
        while loggingIn == true {
            loginUsername()
            
            if(loginPassword()){
                var loading = true
                while loading == true {
                    print("Logging in... / \r")
                    usleep(500000)
                    print("Logging in... - \r")
                    usleep(500000)
                    print("Logging in... \\ \r")
                    usleep(500000)
                    print("Logging in... | \r")
                    usleep(500000)
                    print("Logging in... / \r")
                    usleep(500000)
                    print("Logging in... - \r")
                    usleep(500000)
                    print("Logging in... \\ \r")
                    usleep(500000)
                    print("Logging in... | \r")
                    usleep(500000)
                    
                    
                    loggingIn=false
                    loading = false
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
            
                let newUser = User(userFirstName: "Firsname-\(username)");
                print(password);
                
                database.userTable.append(newUser);
                
                print("User has been created - please login");
            }
        }
    }
    
    
    func LoginAlias(){
        self.isUserLoggedIn = true;
        self.userName = "Dummy account";
    }
    
    
    func ShowProfileCredentials(){
        if let theCurrentUser = currentUser{
            print("Welcome to your profile: \(theCurrentUser)")
            print("This is your connected e-mail: www.4head.com")
            print("Current points: \(database.userPoints)")
            
            print("Press any key to return to main manu...")
        }
    }
    
    
    
    
    /// Shows the main menu
    func ShowMainMenu(){
        if let theCurrentUser = currentUser{
            while(!didUserQuit) {
                print("""
                    \n\n\n
                    |--------------------------------|
                    | CaBeMa Quix, start menu        |
                    |--------------------------------|
                    | Letter | Function              |
                    |--------|-----------------------|
                    |    Q   | Go to quizes          |
                    |    S   | Go to scoreboards     |
                    |    U   | Go to user settings   |
                    |    A   | Profile               |
                    |    X   | Exit to main menu     |
                    |--------------------------------|
                    Logged in as: \(theCurrentUser)
                    
                    - Your choice:
                    """, terminator: " ");
                
                
                
                //Needs optional unwrapping ... let userInput = readLine()?.uppercased(); ... an alternative:
                let userInput = readLine();
                let userInputUC = userInput?.uppercased();
                
                switch userInputUC {
                    
                case "Q":
                    if let chosenQuizId = database.FindQuiz(){
                        print("Wow, the user selected a quiz with the id of: \(chosenQuizId)");
                    }
                    
                case "S":
                    print("Starting program");
                    
                case "U":
                    print("Starting program");
                    
                case "A":
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
                    if let somethingThatDidNotHaveAVariableNameButNowHasAndIsUnwrapped = readLine(){
                        print(somethingThatDidNotHaveAVariableNameButNowHasAndIsUnwrapped);
                    }
                    
                /// Exits program
                case "X":
                    didUserQuit = false;
                    self.Quit();
                    
                default:
                    print("Selection not recognized");
                }
                
            }
        }
    }
    
    func Logout(){
        // In case a user does a logout - reset these informations
        self.currentUser = nil;
        self.userName = "";
        self.isUserLoggedIn = false;
    }

}



func MakeQuestions(){
    
    let newQuiz = Quiz(title: "Svære matematik regnestykker", description: "Se om du kan klare det!", creator: 1, isQuestionsRandom: false, minimumToAnswer: 1);
    database.quizTable.append(newQuiz);
    
    let newQuestion = Question(quizId: 1, correctAnswerId: 2, text: "Hvad er 1+1", points: 1);
    database.questionTable.append(newQuestion);
    
    let newAnswerA = Answer(questionId: 1, answerText: "1");
    let newAnswerB = Answer(questionId: 1, answerText: "2");
    let newAnswerC = Answer(questionId: 1, answerText: "3");
    let newAnswerD = Answer(questionId: 1, answerText: "4");
    
    database.answerTable.append(newAnswerA);
    database.answerTable.append(newAnswerB);
    database.answerTable.append(newAnswerC);
    database.answerTable.append(newAnswerD);
    
    
    
    let newQuiz2 = Quiz(title: "Svære matematik regnestykker 2", description: "Se om du kan klare det!", creator: 1, isQuestionsRandom: false, minimumToAnswer: 1);
    database.quizTable.append(newQuiz2);
    
    let newQuestion2 = Question(quizId: 2, correctAnswerId: 2, text: "Hvad er 2*10", points: 1);
    database.questionTable.append(newQuestion2);
    
    let newAnswerE = Answer(questionId: 2, answerText: "KappaPride");
    let newAnswerF = Answer(questionId: 2, answerText: "20");
    let newAnswerG = Answer(questionId: 2, answerText: "4Head");
    let newAnswerH = Answer(questionId: 2, answerText: "NoT tHiS oNe");
    
    database.answerTable.append(newAnswerE);
    database.answerTable.append(newAnswerF);
    database.answerTable.append(newAnswerG);
    database.answerTable.append(newAnswerH);
    
}



func MakeUsers(){
    var a = User(userFirstName: "Maria");
    database.userTable.append(a);
    
    a = User(userFirstName: "Benjamin");
    database.userTable.append(a);
    
    a = User(userFirstName: "Casper");
    database.userTable.append(a);
    
    for i in database.userTable{
        print(i.getUserFirstName());
    }

    
}

/// This creates and starts the program
var main = Interface();



var tempUsers: [String] = [""];



