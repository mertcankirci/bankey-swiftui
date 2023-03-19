//
//  LoginViewModel.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 4.03.2023.
//

import SwiftUI

class LoginVewModel: ObservableObject {
    @Published var users : [User] = []
    
    func refreshUserData() {
        users = userData
    }
    func login(username: String, password: String) -> Bool? {
        
        
        refreshUserData()
        users = userData
        
        if username != "" && password != "" {
            for user in users {
                
                if user.userName == username && user.password == password {
                    return true
                }
            }
        }
        
        return false
    }
    
    func signUp(username: String, password: String, password2: String, email: String) -> Bool {
        users = userData
        
        if (username != "" && password != "" && password2 != "" && email != "" && password == password2) {
            users.append(User(userName: username, password: password, email: email))
            print(users)
            
            return true
        }
        else {
            print("Zort")
            return false
        }
    }
    
    
    
    let userData = [
        User(userName: "abdussamed", password: "kati", email: "abdussamed_ceza@gmail.com"),
        User(userName: "utkangul", password: "abdullahgul", email: "utkan_sagopa@gmail.com")
    ]
    
}
