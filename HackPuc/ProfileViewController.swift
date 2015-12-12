//
//  ProfileViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

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
