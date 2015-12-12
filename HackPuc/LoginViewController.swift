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

class LoginViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate {

    let userTextField = UITextField()
    let passwordTextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.view.backgroundColor = UIColor(red:0.59, green:0.82, blue:0.35, alpha:1)
        
        let image = UIImage(named: "logo.png")
        let logoImage = UIImageView(image: image!)
        
        logoImage.frame = CGRect(x: 0, y: 50, width: self.view.frame.width/2, height: self.view.frame.height/3)
        logoImage.center.x = self.view.center.x
        view.addSubview(logoImage)
//        
//        let logo = UILabel()
//        logo.frame = CGRectMake(0, 100, 80, 30)
//        logo.center.x = self.view.center.x
//        logo.textAlignment = .Center
//        logo.text = "LOGO"
//        logo.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
//        //  A FONTE FUNCIONOU DE PRIMEIRA PORRA É NOIS!
//        
//        self.view.addSubview(logo)
        
        
        let userLabel = UILabel()
        userLabel.frame = CGRectMake(30, logoImage.frame.origin.y + logoImage.frame.height + 50, 80, 30)
        userLabel.textAlignment = .Left
        userLabel.text = "Username"
        userLabel.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1)
//        userLabel.sizeToFit()
        userLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        self.view.addSubview(userLabel)
        
        userTextField.frame = CGRectMake(userLabel.frame.origin.x + userLabel.frame.width + 10, userLabel.frame.origin.y, self.view.frame.width/2, 30)
        userTextField.layer.borderColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1).CGColor
        userTextField.backgroundColor = .whiteColor()
        userTextField.layer.borderWidth = 1
        userTextField.layer.cornerRadius = 10
        userTextField.delegate = self
        
        let paddingView = UIView()
        paddingView.frame = CGRectMake(0, 0, 7, 0)
        
        userTextField.leftView = paddingView
        userTextField.leftViewMode = .Always

        
        self.view.addSubview(userTextField)
        
        let passwordLabel = UILabel()
        passwordLabel.frame = CGRectMake(userLabel.frame.origin.x, userLabel.frame.origin.y + userLabel.frame.height + 20, 80, 30)
        passwordLabel.textAlignment = .Left
        passwordLabel.text = "Password"
        passwordLabel.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1)
//        passwordLabel.sizeToFit()
        passwordLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        self.view.addSubview(passwordLabel)
        
        passwordTextField.frame = CGRectMake(userTextField.frame.origin.x, passwordLabel.frame.origin.y, self.view.frame.width/2, 30)
        passwordTextField.layer.borderColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1).CGColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.secureTextEntry = true
        passwordTextField.backgroundColor = .whiteColor()
        passwordTextField.delegate = self
        
        let paddingView2 = UIView()
        paddingView2.frame = CGRectMake(0, 0, 7, 0)
        
        passwordTextField.leftView = paddingView2
        passwordTextField.leftViewMode = .Always
        
        self.view.addSubview(passwordTextField)
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.setTitleColor(UIColor(red:0.29, green:0.29, blue:0.29, alpha:1), forState: .Normal)
        loginButton.layer.borderColor = UIColor(red:0.49, green:0.72, blue:0.24, alpha:1).CGColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = UIColor(red:0.49, green:0.72, blue:0.24, alpha:1)
        
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.delegate = self
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
        signUpButton.setTitleColor(UIColor(red:0.29, green:0.29, blue:0.29, alpha:1), forState: .Normal)
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1).CGColor
        signUpButton.layer.cornerRadius = 10
        signUpButton.addTarget(self, action: "signUpPressed", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(signUpButton)
    
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if (error == nil) && (result.isCancelled == false) {
            
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
    }
    
    func signUpPressed() {
        
        if userTextField.text != "" && passwordTextField.text != "" {
            Login().signUp(userTextField.text!, password: passwordTextField.text!)
        }
        else if userTextField.text != "" {
            let alerta = UIAlertController(title: "Error", message: "Password missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else if passwordTextField.text != "" {
            let alerta = UIAlertController(title: "Error", message: "E-mail missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "E-mail and password missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    
    func loginAction() {

        
        if userTextField.text != "" && passwordTextField.text != "" {
            Login().login(userTextField.text!, password: passwordTextField.text!)
            
            let ref = Firebase(url: "https://hackpuc.firebaseio.com/")
            ref.observeAuthEventWithBlock({ authData in
                if authData != nil {
                    // user authenticated
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
                    print(authData)
                    
                    
                } else {
                    // No user is signed in
                    let alerta = UIAlertController(title: "Error", message: "E-mail and password don't match", preferredStyle: .Alert)
                    let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    
                    alerta.addAction(okAction)
                    
                    self.presentViewController(alerta, animated: true, completion: nil)
                }
            })
            
            
            
        }
        else if userTextField.text != "" {
            let alerta = UIAlertController(title: "Error", message: "Password missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)

        }
        else if passwordTextField.text != "" {
            let alerta = UIAlertController(title: "Error", message: "E-mail missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "E-mail and password missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

