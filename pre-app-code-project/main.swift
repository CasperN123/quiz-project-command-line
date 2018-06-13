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
    private var userMiddleName: String;
    private var userLastName: String;
    
    private var userName: String;
    private var eMail: String;
    private var password: String;
    
    // Initializer used when creating a user with the function
    init(userFirstName: String, userMiddleName: String, userLastName: String, userName: String, eMail: String, password: String){
        self.userId = database.getNewUserId();
        
        self.userFirstName = userFirstName;
        self.userMiddleName = userMiddleName;
        self.userLastName = userLastName;
        
        self.userName = userName;
        self.eMail = eMail;
        self.password = password;
        
        // Values to properties assigned afterwards
    }
    
    func getUserId() -> Int {
        return self.userId; // TODO: Change this
    }
    
    func getUserFirstName() -> String {
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



/* Class seperator *******************************************************************************************/



/// The main interface which intiates the program
class Interface {
    var currentUser: User?;
    
    /// Empty if user is logged in with account
    /// - Used for alias names
    var userName: String = "";
    var didUserQuit: Bool = false;
    var isAliasUserLoggedIn: Bool = false;
    
    init(){
        print("Welcome to CaBeMa Quiz\nWe hope that you enjoy the quiz program");
        self.ShowMenu();
        
    }
    
    
    
    /// Shows the main menu
    func ShowMenu(){

        
        
        
        /*
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
    
    
  
    func loginUsername() -> User?{
        let userNameAttempts: Int = 3;
        var currentUserNameAttempt: Int = 0;
        
        while(currentUserNameAttempt < userNameAttempts){
            currentUserNameAttempt += 1;
            print("Please type username: ");
            let input = readLine()
            
            for user in database.userTable{
                if user.GetUserName().uppercased() == input?.uppercased(){
                    return user
                }
            }
            
            let triesLeft = userNameAttempts-currentUserNameAttempt;
            print("Wrong username!\nYou have \(triesLeft>1 ? String(triesLeft)+" tries" : triesLeft>0 ? String(triesLeft)+" try" : "no tries") left\n")
            
        }
        return nil;
    }
    
    
    
    func loginPassword(user: User) -> Bool {
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
        //var loggingIn = true
        // I would suggest these commented out / removed - and implement control in login username / password
        //while loggingIn == true {
            
            userLoggingIn = loginUsername()
            
            if let userSelected = userLoggingIn{
                if(loginPassword(user: userSelected)){
                    currentUser = userSelected;
                    // TODO: @Casper, consider this:
                    /*
                     var loadingSymbol: [Character] = ["/", "-", "\\", "|", "/", "-", "\\", "|"];
                     for symbol in loadingSymbol{
                        print("Logging in... \(symbol)");
                     usleep(500_000);
                     loggingIn=false
                     }
                     */
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
                        
                        
                        //loggingIn=false
                        loading = false
                    }
                    ShowMainMenu()
                }
            }
        //}
    }

    
    // Temple of DOOM user creation
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
                                database.userTable.append(newUser);
            
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
            self.currentUser = User(userFirstName: "", userMiddleName: "", userLastName: "", userName: "", eMail: "", password: "");
            self.ShowMainMenu();
        }
    }
    
    
    
    func ShowProfileCredentials(){
        if let theCurrentUser = currentUser{
            print("\n\n\n\nWelcome to your profile: \(theCurrentUser.GetUserName())")
            print("FullName: \(theCurrentUser.GetFullName())")
            print("This is your connected e-mail: \(theCurrentUser.GetUserEmail())")
            print("Current points: TODO: Calculate HERE dynamically")
            print("Press any key to return to main manu...")
            let _ = readLine();
        }
    }

    
    
    /// Shows the main menu
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
                    |    S   | Go to scoreboards     |
                    |    U   | Go to user settings   |\(!self.isAliasUserLoggedIn ? "\n|    A   | Profile               |" : "" )
                    |    X   | Exit to main menu     |
                    |--------------------------------|
                    Logged in as: \(theCurrentUser.GetUserName())
                    
                    - Your choice:
                    """, terminator: " ");
                
                
                
                //Needs optional unwrapping ... let userInput = readLine()?.uppercased(); ... an alternative:
                if let userInput = readLine(){
                    userInputUC = userInput.uppercased();
                }
                
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
        database.userTable.append(newUser);
        i+=6;
    }
    /* Make some users */
    
    
    /* Make some Quizes */
    let makeQuizes: [String] = [
        "Computer Science", "Basic questions regarding computer science", "1", "false", "1",
        "Mathematics", "Fundamental mathematics used within programming", "2", "false", "1",
        "Computer Science 2", "Mediocre questions regarding computer science", "3", "false", "1"
    ];

    i = 0;
    // Force unwrap used below, because it is merely static data being loaded
    while i < makeQuizes.count {
        let newQuiz = Quiz(title: makeQuizes[i], description: makeQuizes[i+1], creator: Int(makeQuizes[i+2])!, isQuestionsRandom: Bool(makeQuizes[i+3])!, minimumToAnswer: Int(makeQuizes[i+4])!);
        database.quizTable.append(newQuiz);
        i+=5;
    }
    /* Make some Quizes */
    
    // Make Questions
    
    // Make answers
    
    /*
    let makeQuizes: [String] = [
        "Computer Science", "What is 00000100 in binary?", "1", "false", "1",
        "Mathematics", "What is 5 % 4?", "2", "false", "1",
        "Computer Science 2", "How can a value of 64 be represented?", "3", "false", "1"
    ];*/

    
}

populateDatabase();







/// This creates and starts the program
var main = Interface();

