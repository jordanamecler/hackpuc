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
        
        UIApplication.sharedApplication().statusBarStyle = .Default
        
        // Green round button and tabBar
        
        tabBar.backgroundImage = UIImage(named: "tabBar")

        let roundImage = UIImage(named: "tabItem")
        let roundedButton = UIImageView(image: roundImage)
        roundedButton.clipsToBounds = true
        roundedButton.frame.size = (roundImage?.size)!
        roundedButton.center = CGPointMake(tabBar.center.x, tabBar.center.y - 10)
        roundedButton.userInteractionEnabled = false
        self.view.addSubview(roundedButton)
        
        let albumImage = UIImageView(image: UIImage(named: "cards"))
        albumImage.center = CGPointMake(tabBar.center.x, tabBar.center.y - 10)
        
        self.view.addSubview(albumImage)
        
        
    
                
    }


}
