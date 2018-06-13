//
//  main.swift
//  pre-app-code-project
//
//  Created by Bruger on 12/06/2018.
//  Copyright © 2018 Mercantec. All rights reserved.
//

import Foundation

var benjaDownloading = 0;
let savage = false
//var






if (savage != true) {
    
    print("øasadsadlasjndajksdbsahdbaisdbasb dhb")
}













































































//


































































































// Maria


/*-----------------* Quiz class -----------------*/

class Quiz{
    //Dummy class to avoid errors
}



/*-----------------* Database class -----------------*/

class Database {
    
    /// userCurrentId is the increment of the key userId. It starts at 0, and not 1 because we increment it by 1 before returning the value.
    var userCurrentId: Int = 0;
    
    /// Alernative approach: Count the the rows (User objects) of userTable and add 1 (id does not equal index number of a user in the array, be cause array starts at 0)
    func getNewUserId() -> Int {
        self.userCurrentId = self.userCurrentId + 1;
        return self.userCurrentId;
    }
}

var database: Database = Database();







/*-----------------* User class -----------------*/

class User {
    var userId: Int?;
    var userFirstName: String?;
    
    // Initializer used when creating a user with the function
    init(){
        // Values to properties assigned afterwards
    }
    
    // Initializer used for auto creating some users
    init(userId: Int, userFirstName: String){
        self.userId = userId;
        self.userFirstName = userFirstName;
    }
}

var userDatabase: [User] = [];













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
    
    func LoginUser(){
        
        print("Please type username");
        print("Please type password");
        
        var a = User();//Dummy return
        self.currentUser = a;
    }
    
    func CreateUser(){
        print("Please input username", terminator: "");
        let username = readLine();
        let newUser = User();
        userDatabase.append(newUser);
        
        print("User has been created - please login");
    }
    
    
    func LoginAlias(){
        self.isUserLoggedIn = true;
        self.userName = "Dummy account";
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
                |    X   | Exit to main menu     |
                |--------------------------------|
                Logged in as: \(self.userName)
                
                - Your choice:
                """, terminator: " ");
            
            //Needs optional unwrapping ... let userInput = readLine()?.uppercased(); ... an alternative:
            let userInput = readLine();
            let userInputUC = userInput?.uppercased();
            
            switch userInputUC {
                
            case "S":
                print("Starting program");
                
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



/// This creates and starts the program
var main = Interface();





