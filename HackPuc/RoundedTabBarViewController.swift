//
//  RoundedTabBarViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class RoundedTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let roundedButton = UIButton()
        roundedButton.backgroundColor = UIColor.grayColor()
        roundedButton.clipsToBounds = true
        roundedButton.layer.cornerRadius = 60
        roundedButton.frame.size = CGSizeMake(120, 120)
        roundedButton.center = self.tabBar.center
        roundedButton.userInteractionEnabled = false
        self.view.addSubview(roundedButton)
        

        
    }


}
