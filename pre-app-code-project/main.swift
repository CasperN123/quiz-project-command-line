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
    
    
    
    // Functions for Question class
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
    
    init(quizId: Int, correctAnswerId: Int, text: String) {
        
        self.questionId = database.getNewUserId();
        self.quizId = quizId;
        self.correctAnswerId = correctAnswerId
        self.text = text
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
    //Dummy class to avoid errors
    var answerId: Int;
    var questionId: Int;
    var answerText: String;
    
    init(questionId: Int, answerText: String){
        self.questionId = questionId;
        self.answerText = answerText;
        self.answerId = database.getNewAnserId();
        
    }
}





class User {
    var userId: Int?;
    var userFirstName: String?;
    
    // Initializer used when creating a user with the function
    init(){
        self.userId = database.getNewUserId();
        // Values to properties assigned afterwards
    }
    
    
    
    // Initializer used when creating a user with the function
    init(userFirstName: String){
        self.userId = database.getNewUserId();
        self.userFirstName = userFirstName;
        // Values to properties assigned afterwards
    }
    
    
    // Initializer used for auto creating some users
    init(userId: Int, userFirstName: String){
        self.userId = userId;
        self.userFirstName = userFirstName;
    }
}



/*-----------------* Database class -----------------*/

class Database {
    
    var quizTable: [Quiz] = [];
    var questionTable: [Question] = [];
    var answerTable: [Answer] = [];
    var userTable: [User] = [];
    
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
    
    func getNewAnserId() -> Int {
        self.answerId = self.answerId + 1;
        return self.answerId;
    }
    
    private var quizId: Int = 0;
    
    func getNewQuizId() -> Int {
        self.quizId = self.quizId + 1;
        return self.quizId;
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
        // Add data from db together here
    }
}




//




























































































// Maria






// Maria

class Database {
    
    /// userCurrentId is the increment of the key userId. It starts at 0, and not 1 because we increment it by 1 before returning the value.
    var userCurrentId: Int = 0;
    
    /// Alernative approach: Count the the rows (User objects) of userTable and add 1 (id does not equal index number of a user in the array, be cause array starts at 0)
    func getNewUserId() -> Int {
        self.userCurrentId = self.userCurrentId + 1;
        return self.userCurrentId;
    }
    
    
}







/*-----------------* User class -----------------*/














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
        self.didUserQuit = true;
        print("Thank you for using CaBeMa");
    }
    
  
    func loginUsername(){
        
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        var cUsername = false
        let username = "savage"
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        while(!cUsername){
            print("Please type username: ");
            var input = readLine()
            
            if input == username {
                cUsername = true
            }
            
            else {
                if input != username {
                    print("Wrong username!")
            }
        }
        
        else {
            if input != username {
                print("Wrong username!")
            }
        }
    }
        
    func loginPassword() -> Bool{
        
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        var cPassword = false
        let password = "savage"
        // TEMP USERNAME AND PASSWORD FOR DEBUGGING !!!
        while(!cPassword){
            print("Please type password: ");
            var input = readLine()
            
            if input == password {
                cPassword = true
                return true;
            }
                
            }
        }
    }
    
    
    func LoginUser(){
    
    var loggingIn = true
        
        while loggingIn == true {
            
            
            
            loginUsername()
            
            if(loginPassword()){
                loggingIn=false
                ShowMainMenu()
            }
            
            
            
         
        }
        
    }
    
    func CreateUser(){
        print("Please input username", terminator: "");
        let username = readLine();
        print("Please input password", terminator: "");
        let password = readLine();
        let newUser = User();
        database.userTable.append(newUser);
        
        print("User has been created - please login");
    }
    
    
    func LoginAlias(){
        self.isUserLoggedIn = true;
        self.userName = "Dummy account";
    }
    
    
    func ShowProfileCredentials(){
        print("Welcome to your profile: \(userName)")
        print("This is your connected e-mail: www.4head.com")
    }
    
    
    
    
    /// Shows the main menu
    func ShowMainMenu(){
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
                Logged in as: \(self.userName)
                
                - Your choice:
                """, terminator: " ");
            
            //Needs optional unwrapping ... let userInput = readLine()?.uppercased(); ... an alternative:
            let userInput = readLine();
            let userInputUC = userInput?.uppercased();
            
            switch userInputUC {
                
            case "Q":
                print("Starting program");
                
            case "S":
                print("Starting program");
                
            case "U":
                print("Starting program");
                
            case "A":
                ShowProfileCredentials()
                sleep(3)
                
            /// Exits program
            case "X":
                didUserQuit = true;
                self.Quit();
                
            default:
                print("Selection not recognized");
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
    
    var newQuiz = Quiz(title: "Svære matematik regnestykker", description: "Se om du kan klare det!", creator: 1, isQuestionsRandom: false, minimumToAnswer: 1);
    database.quizTable.append(newQuiz);
    
    var newQuestion = Question(quizId: 1, correctAnswerId: 2, text: "Hvad er 1+1");
    database.questionTable.append(newQuestion);
    
    var newAnswerA = Answer(questionId: 1, answerText: "1");
    var newAnswerB = Answer(questionId: 1, answerText: "2");
    var newAnswerC = Answer(questionId: 1, answerText: "3");
    var newAnswerD = Answer(questionId: 1, answerText: "4");
    
    database.answerTable.append(newAnswerA);
    database.answerTable.append(newAnswerB);
    database.answerTable.append(newAnswerC);
    database.answerTable.append(newAnswerD);
    
    
    
    var newQuiz2 = Quiz(title: "Svære matematik regnestykker 2", description: "Se om du kan klare det!", creator: 1, isQuestionsRandom: false, minimumToAnswer: 1);
    database.quizTable.append(newQuiz2);
    
    var newQuestion2 = Question(quizId: 2, correctAnswerId: 2, text: "Hvad er 2*10");
    database.questionTable.append(newQuestion2);
    
    var newAnswerE = Answer(questionId: 2, answerText: "10");
    var newAnswerF = Answer(questionId: 2, answerText: "20");
    var newAnswerG = Answer(questionId: 2, answerText: "30");
    var newAnswerH = Answer(questionId: 2, answerText: "40");
    
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
        print(i.userFirstName);
    }
    
}

/// This creates and starts the program
var main = Interface();





