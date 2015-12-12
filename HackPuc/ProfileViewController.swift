//
//  ProfileViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class ProfileViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .whiteColor()
        
        let profileLabel = UILabel()
        profileLabel.frame = CGRectMake(0, 40, 150, 30)
        profileLabel.center.x = self.view.center.x
        profileLabel.textAlignment = .Center
        profileLabel.text = "Profile"
        profileLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 30)
        
        view.addSubview(profileLabel)
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRectMake(20, profileLabel.frame.origin.y + profileLabel.frame.height + 20, 150, 30)
        nameLabel.text = "Name"
        nameLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        view.addSubview(nameLabel)
        
//        // Get a reference to our posts
//        var ref = Firebase(url:"https://hackpuc.firebaseio.com/")
//        
//        // Retrieve new posts as they are added to your database
//        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
//            print(snapshot.value.objectForKey("author"))
//            print(snapshot.value.objectForKey("title"))
//        })
//        
        
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.delegate = self
        fbLoginButton.frame.origin = CGPointMake(0, nameLabel.frame.origin.y + nameLabel.frame.height + 120)
        fbLoginButton.center.x = self.view.center.x
        
        self.view.addSubview(fbLoginButton)
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
