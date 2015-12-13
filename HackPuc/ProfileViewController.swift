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
                
        let nameLabel = UILabel()
        nameLabel.frame = CGRectMake(30, profileLabel.frame.size.height + profileLabel.frame.origin.y + 20, self.view.frame.width/2, 40)
        nameLabel.textAlignment = .Left
        nameLabel.text = "Name"
        nameLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        let imageName = "Brazil.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: nameLabel.frame.size.width + 80, y: nameLabel.frame.size.height + nameLabel.frame.origin.y - 35, width: 40, height: 30)
        
        var percAlbum = 0
        var numTrue = 0
        let alb: Album = DAOAlbuns().getBoolenDict()
        
        for i in alb.atletaArray {
            if i > 0 {
                numTrue++
            }
        }
        for i in alb.equipesArray {
            if i > 0 {
                numTrue++
            }
        }
        for i in alb.modalidadeArray {
            if i > 0 {
                numTrue++
            }
        }
        for i in alb.olimpiadasAntigasArray {
            if i > 0 {
                numTrue++
            }
        }
        for i in alb.turismoArray {
            if i > 0 {
                numTrue++
            }
        }
        
        percAlbum = numTrue * 100 / alb.totalFigurinhas
        
        let completedLabel = UILabel()
        completedLabel.frame = CGRectMake(30, nameLabel.frame.size.height + nameLabel.frame.origin.y + 20, self.view.frame.width, 40)
        completedLabel.textAlignment = .Left
        completedLabel.text = "\(percAlbum)% of the album is completed"
        completedLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        let emailLabel = UILabel()
        emailLabel.frame = CGRectMake(30, completedLabel.frame.size.height + completedLabel.frame.origin.y + 20, self.view.frame.width, 40)
        emailLabel.textAlignment = .Left
        emailLabel.text = "Email: maria@maria.com"
        emailLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        view.addSubview(imageView)
        view.addSubview(profileLabel)

        
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
        view.addSubview(nameLabel)
        view.addSubview(completedLabel)
        view.addSubview(emailLabel)

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
