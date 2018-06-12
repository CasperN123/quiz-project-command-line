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
var






if (savage != true) {
    
    print("øasadsadlasjndajksdbsahdbaisdbasb dhb")
}













































































//


































































































// Maria

class User {
    let userId: Int32;
    
    init(userId: Int32){
        self.userId = userId;
    }
}

var userDatabase: [User] = [];




class Interface {
    var currentUser: User?;
    var userName: String?;
    var currentQuiz: Int32?;
    
    func Quit() {
        
    }
    
    func CreateUser() {
        let newUser = User(userId: Int32(userDatabase.count));
        userDatabase.append(newUser);
        self.currentUser = newUser;
    }
    
    
/*    func LoginAlias() -> User{
        return User;
    }
    
    
    func LoginUser() -> User{
        return User;
    }*/
}



var main = Interface();
main.CreateUser();
print(main.currentUser!.userId);

main.CreateUser();
print(main.currentUser!.userId);

main.CreateUser();
print(main.currentUser!.userId);

