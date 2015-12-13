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

class LoginViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let userTextField = UITextField()
    let passwordTextField = UITextField()
    var signUpView: PopUpViewController!
    var picker = ["Argentina", "Brasil", "United States"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        self.view.backgroundColor = UIColor(red:0.59, green:0.82, blue:0.35, alpha:1)
        
        let image = UIImage(named: "stickerz.png")
        let logoImage = UIImageView(image: image!)
        
        logoImage.frame = CGRect(x: 0, y: 50, width: self.view.frame.width/2, height: self.view.frame.height/7)
        logoImage.center.x = self.view.center.x
        view.addSubview(logoImage)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgInicial.png")!)
        
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
        userLabel.frame = CGRectMake(30, logoImage.frame.origin.y + logoImage.frame.height + 100, 80, 30)
        userLabel.textAlignment = .Left
        userLabel.text = "Email"
//        userLabel.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1)
        userLabel.textColor = UIColor.whiteColor()
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
//        passwordLabel.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1)
        passwordLabel.textColor = UIColor.whiteColor()
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
        loginButton.setImage(UIImage(named: "loginBut"), forState: .Normal)
        loginButton.setTitleColor(UIColor(red:0.29, green:0.29, blue:0.29, alpha:1), forState: .Normal)
//        loginButton.layer.borderColor = UIColor(red:0.49, green:0.72, blue:0.24, alpha:1).CGColor
//        loginButton.layer.borderWidth = 1
//        loginButton.layer.cornerRadius = 10
//        loginButton.backgroundColor = UIColor(red:0.49, green:0.72, blue:0.24, alpha:1)
        
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
//        signUpButton.setTitle("Sign Up", forState: .Normal)
        signUpButton.setImage(UIImage(named: "signBut"), forState: .Normal)
//        signUpButton.setTitleColor(UIColor(red:0.29, green:0.29, blue:0.29, alpha:1), forState: .Normal)
//        signUpButton.layer.borderWidth = 1
//        signUpButton.layer.borderColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1).CGColor
//        signUpButton.layer.cornerRadius = 10
        signUpButton.addTarget(self, action: "signUpPressed", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(signUpButton)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if (error == nil) && (result.isCancelled == false) {
            
            startApp()
        }
    }
    
    func signUpPressed() {
        
        signUpView = PopUpViewController()
        
        
        let signUpLabel = UILabel()
        signUpLabel.frame = CGRectMake(0, 0, signUpView.view.frame.size.width, signUpView.view.frame.size.height*0.8)
        signUpLabel.text = "Cadastro"
        signUpLabel.center.x = signUpView.popUpView.center.x * 0.8
        signUpLabel.center.y = signUpView.popUpView.center.y * 0.2
        signUpLabel.textAlignment = NSTextAlignment.Center
        signUpLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 28)
        
        signUpView.popUpView.addSubview(signUpLabel)
        
        
        let nameTextField = UITextField()
        nameTextField.delegate = self
        nameTextField.frame = CGRectMake(0, 0, signUpView.view.frame.size.width*0.725, signUpView.view.frame.size.height*0.05)
        nameTextField.center.x = signUpView.popUpView.center.x*0.8
        nameTextField.center.y = signUpView.popUpView.center.y * 0.4
        nameTextField.placeholder = "Name"
        nameTextField.backgroundColor = UIColor.whiteColor()
        nameTextField.layer.cornerRadius = 4
        nameTextField.layer.borderWidth = 1
        nameTextField.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        nameTextField.textColor = UIColor.blackColor()
        
        let paddingView3 = UIView()
        paddingView3.frame = CGRectMake(0, 0, 7, 0)
        
        nameTextField.leftView = paddingView3
        nameTextField.leftViewMode = .Always
        
        signUpView.popUpView.addSubview(nameTextField)
        
        let emailTextField = UITextField()
        emailTextField.delegate = self
        emailTextField.frame = CGRectMake(0, 0, signUpView.view.frame.size.width*0.725, signUpView.view.frame.size.height*0.05)
        emailTextField.center.x = signUpView.popUpView.center.x*0.8
        emailTextField.center.y = signUpView.popUpView.center.y * 0.55
        emailTextField.placeholder = "E-mail"
        emailTextField.backgroundColor = UIColor.whiteColor()
        emailTextField.layer.cornerRadius = 4
        emailTextField.layer.borderWidth = 1
        emailTextField.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        emailTextField.textColor = UIColor.blackColor()
        
        let paddingView4 = UIView()
        paddingView4.frame = CGRectMake(0, 0, 7, 0)
        
        emailTextField.leftView = paddingView4
        emailTextField.leftViewMode = .Always
        
        signUpView.popUpView.addSubview(emailTextField)
        
        let passwordTextField2 = UITextField()
        passwordTextField2.delegate = self
        passwordTextField2.frame = CGRectMake(0, 0, signUpView.view.frame.size.width*0.725, signUpView.view.frame.size.height*0.05)
        passwordTextField2.center.x = signUpView.popUpView.center.x*0.8
        passwordTextField2.center.y = signUpView.popUpView.center.y * 0.7
        passwordTextField2.secureTextEntry = true
        passwordTextField2.placeholder = "Password"
        passwordTextField2.backgroundColor = UIColor.whiteColor()
        passwordTextField2.layer.cornerRadius = 4
        passwordTextField2.layer.borderWidth = 1
        passwordTextField2.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        passwordTextField2.textColor = UIColor.blackColor()
        
        let paddingView5 = UIView()
        paddingView5.frame = CGRectMake(0, 0, 7, 0)
        
        passwordTextField2.leftView = paddingView5
        passwordTextField2.leftViewMode = .Always
        
        signUpView.popUpView.addSubview(passwordTextField2)
        
        let paisLabel = UILabel()
        paisLabel.frame = CGRectMake(0, 0, signUpView.view.frame.size.width, signUpView.view.frame.size.height*0.4)
        paisLabel.text = "Country"
        paisLabel.center.x = signUpView.popUpView.center.x * 0.3
        paisLabel.center.y = signUpView.popUpView.center.y * 0.85
        paisLabel.textAlignment = NSTextAlignment.Center
        paisLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        signUpView.popUpView.addSubview(paisLabel)
        
        let countryPicker = UIPickerView()
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryPicker.frame = CGRectMake(0, 0, signUpView.view.frame.width/1.5, signUpView.view.frame.height * 0.2)
        countryPicker.center.x = signUpView.popUpView.center.x * 0.8
        countryPicker.center.y = signUpView.popUpView.center.y * 1.05
        
        signUpView.popUpView.addSubview(countryPicker)
        
        
        signUpView.showInView(self.view)
        
        signUpView.nameTextField = nameTextField
        signUpView.emailTextField = emailTextField
        signUpView.passwordTextField = passwordTextField2
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.picker.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.picker[row]
    }
    
    func loginAction() {
        
        
        if userTextField.text != "" && passwordTextField.text != "" {
            Login().login(userTextField.text!, password: passwordTextField.text!)
            
            let ref = Firebase(url: "https://hackpuc.firebaseio.com/")
            ref.observeAuthEventWithBlock({ authData in
                if authData != nil {
                    // user authenticated
                    
                    self.startApp()
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
    
    func startApp() {
        
        
        // TabBar Itens
        let profileImage = UIImage(named: "profileItem")
        let profileItem = UITabBarItem(title: "Profile", image: profileImage, tag: 0)
        profileItem.selectedImage = profileImage
        
        let albumImage = UIImage(named: "cards")
        let albumItem = UITabBarItem(title: "Stickerz", image: albumImage, tag: 1)
        albumItem.selectedImage = albumImage
        
        let friendsImage = UIImage(named: "friendsItem")
        let friendsItem = UITabBarItem(title: "+Stickerz", image: friendsImage , tag: 2)
        friendsItem.selectedImage = friendsImage
        
        
        // TabBar
        
        let tabBarC = RoundedTabBarViewController()
        let album = AlbumViewController()
        album.tabBarItem = albumItem
        let albumNav = UINavigationController(rootViewController: album)
        albumNav.navigationBar.hidden = true
        
        let profile = ProfileViewController()
        profile.tabBarItem = profileItem
        
        let socialInterection = SocialInterectionViewController()
        socialInterection.tabBarItem = friendsItem
        
        tabBarC.viewControllers = [profile, albumNav, socialInterection]
        tabBarC.selectedIndex = 1
        
        SystemStatus.sharedInstance.navController!.pushViewController(tabBarC, animated: false)
        
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

