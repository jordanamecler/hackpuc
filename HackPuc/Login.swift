//
//  Login.swift
//  HackPuc
//
//  Created by Jordana Mecler on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation
import Firebase

class Login {
    
    init() {
        
    }
    
    func signUp(email: String, password: String) {
        let ref = Firebase(url: "https://hackpuc.firebaseio.com/")
        ref.createUser(email, password: password,
            withValueCompletionBlock: { error, result in
                
                if error != nil {
                    print("erro: \(error)")
                    // There was an error creating the account
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                }
        })
    }
    
    func login(email: String, password: String) {
        let ref = Firebase(url: "https://hackpuc.firebaseio.com/")
        ref.authUser(email, password: password,
            withCompletionBlock: { error, authData in
                
                if error != nil {
                    print("\(error)")
                    // There was an error logging in to this account
                } else {
                    print("logou")
                    // We are now logged in
                }
        })

    }
}