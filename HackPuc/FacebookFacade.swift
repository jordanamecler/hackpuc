//
//  FacebookFacade.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class FacebookFacade  {
    
    var facebookId: String!
    var userName: String!
    var userEmail: String!

    
    init() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath:  "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                self.facebookId = result.valueForKey("id") as? String
                self.userName = result.valueForKey("name") as? String
                self.userEmail = result.valueForKey("email") as? String
                
            }
        })
    }
    
    func getUserName() -> String {
        return userName
    }
    
    func getUserEmail() ->String {
        return userEmail
    }
    
    func getFbId() -> String {
        return facebookId
    }

}
