//
//  ViewController.swift
//  HackPuc
//
//  Created by Jordana Mecler on 11/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {

    let userTextField = UITextField()
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UILabel()
        logo.frame = CGRectMake(0, 100, 80, 30)
        logo.center.x = self.view.center.x
        logo.textAlignment = .Center
        logo.text = "LOGO"
        logo.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        //  A FONTE FUNCIONOU DE PRIMEIRA PORRA É NOIS!
        
        self.view.addSubview(logo)
        
        let userLabel = UILabel()
        userLabel.frame = CGRectMake(30, logo.frame.origin.y + logo.frame.height + 100, 30, 20)
        userLabel.textAlignment = .Center
        userLabel.text = "Username"
        userLabel.sizeToFit()
        
        self.view.addSubview(userLabel)
        
        userTextField.frame = CGRectMake(userLabel.frame.origin.x + userLabel.frame.width + 10, userLabel.frame.origin.y, 150, 30)
        userTextField.layer.borderColor = UIColor.grayColor().CGColor
        userTextField.layer.borderWidth = 1
        userTextField.layer.cornerRadius = 10
        
        self.view.addSubview(userTextField)
        
        let passwordLabel = UILabel()
        passwordLabel.frame = CGRectMake(userLabel.frame.origin.x, userLabel.frame.origin.y + userLabel.frame.height + 20, 30, 20)
        passwordLabel.textAlignment = .Center
        passwordLabel.text = "Password"
        passwordLabel.sizeToFit()
        
        self.view.addSubview(passwordLabel)
        
        passwordTextField.frame = CGRectMake(userTextField.frame.origin.x, passwordLabel.frame.origin.y, 150, 30)
        passwordTextField.layer.borderColor = UIColor.grayColor().CGColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.secureTextEntry = true
        
        self.view.addSubview(passwordTextField)
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        loginButton.layer.borderColor = UIColor.grayColor().CGColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 10
        
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame.origin = CGPointMake(0, passwordLabel.frame.origin.y + passwordLabel.frame.height + 120)
        fbLoginButton.center.x = self.view.center.x
        
        self.view.addSubview(fbLoginButton)
        
        loginButton.frame = CGRectMake(0, passwordLabel.frame.origin.y + passwordLabel.frame.height + 30, fbLoginButton.frame.width, fbLoginButton.frame.height)
        loginButton.center.x = self.view.center.x
        loginButton.addTarget(self, action: Selector("loginAction"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(loginButton)
        
        let signUpButton = UIButton()
        signUpButton.frame = CGRectMake(0, fbLoginButton.frame.origin.y + fbLoginButton.frame.height + 10, fbLoginButton.frame.width, fbLoginButton.frame.height)
        signUpButton.center.x = self.view.center.x
        signUpButton.setTitle("Sign Up", forState: .Normal)
        signUpButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.grayColor().CGColor
        signUpButton.layer.cornerRadius = 10
        signUpButton.addTarget(self, action: "signUpPressed", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(signUpButton)
    
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func signUpPressed() {
        if userTextField.text != nil && passwordTextField.text != nil {
            Login().signUp(userTextField.text!, password: passwordTextField.text!)
        }
    }
    
    
    func loginAction() {
        
        
        // TabBar Itens
        let profileImage = UIImage(named: "profileItem")
        let profileItem = UITabBarItem(title: "Profile", image: profileImage, tag: 0)
        profileItem.selectedImage = profileImage
        
        let albumImage = UIImage(named: "cards")
        let albumItem = UITabBarItem(title: "Album", image: albumImage, tag: 1)
        albumItem.selectedImage = albumImage
        
        let friendsImage = UIImage(named: "friendsItem")
        let friendsItem = UITabBarItem(title: "Social", image: friendsImage , tag: 2)
        friendsItem.selectedImage = friendsImage
    
        
        // TabBar
        
        let tabBarC = RoundedTabBarViewController()
        let album = AlbumViewController()
        album.tabBarItem = albumItem
        let albumNav = UINavigationController(rootViewController: AlbumViewController())
        albumNav.navigationBar.hidden = true

        let profile = ProfileViewController()
        profile.tabBarItem = profileItem
        let socialInterection = SocialInterectionViewController()
        socialInterection.tabBarItem = friendsItem
        
        tabBarC.viewControllers = [profile, albumNav, socialInterection]
        tabBarC.selectedIndex = 1
        
        self.presentViewController(tabBarC, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

