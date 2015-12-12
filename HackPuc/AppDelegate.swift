//
//  AppDelegate.swift
//  HackPuc
//
//  Created by Jordana Mecler on 11/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        if let window = self.window
        {
            
            if FBSDKAccessToken.currentAccessToken() != nil {
                
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

                window.rootViewController = tabBarC
                
            }
        }
        
        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

