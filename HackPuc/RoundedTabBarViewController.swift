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

        // Green round button and tabBar
        
        let greenTabBar = UIImageView(image: UIImage(named: "tabBar"))
        greenTabBar.clipsToBounds = true
        greenTabBar.frame.size = CGSizeMake(tabBar.frame.width, tabBar.frame.height)
        greenTabBar.center = tabBar.center
        greenTabBar.userInteractionEnabled = false
        self.view.addSubview(greenTabBar)       

        let roundImage = UIImage(named: "tabItem")
        let roundedButton = UIImageView(image: roundImage)
        roundedButton.clipsToBounds = true
        roundedButton.frame.size = (roundImage?.size)!
        roundedButton.center = CGPointMake(tabBar.center.x, tabBar.center.y - 10)
        roundedButton.userInteractionEnabled = false
        self.view.addSubview(roundedButton)
        
    }


}
