//
//  SocialInterectionViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class SocialInterectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .whiteColor()
        
        let socialLabel = UILabel()
        socialLabel.frame = CGRectMake(0, 40, 150, 30)
        socialLabel.center.x = self.view.center.x
        socialLabel.textAlignment = .Center
        socialLabel.text = "Social"
        socialLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 30)
        view.addSubview(socialLabel)
        
        
        let rankingBox = RankingBoxView()
        view.addSubview(rankingBox)
        
        let ganharFigurinhasBox = UIButton()
        ganharFigurinhasBox.tag = 0
        ganharFigurinhasBox.setImage( UIImage(named:"pacoteAberto"), forState: .Normal)
        ganharFigurinhasBox.clipsToBounds = true
        ganharFigurinhasBox.layer.borderColor = UIColor(red:0.55, green:0.75, blue:0.4, alpha:1).CGColor
        ganharFigurinhasBox.layer.borderWidth = 1
        ganharFigurinhasBox.frame.size = CGSizeMake(view.frame.width / 2.3, view.frame.height / 4)
        ganharFigurinhasBox.frame.origin = CGPointMake(rankingBox.frame.origin.x, rankingBox.frame.origin.y + rankingBox.frame.height + 10)
        ganharFigurinhasBox.addTarget(self , action: Selector("ganharAction"), forControlEvents: .TouchUpInside)
        view.addSubview(ganharFigurinhasBox)
        

        
        let trocarFigurinhasBox = UIButton()
        trocarFigurinhasBox.clipsToBounds = true
        trocarFigurinhasBox.layer.borderColor = UIColor(red:0.55, green:0.75, blue:0.4, alpha:1).CGColor
        trocarFigurinhasBox.layer.borderWidth = 1
        trocarFigurinhasBox.frame.size = CGSizeMake(view.frame.width / 2.3, view.frame.height / 4)
        trocarFigurinhasBox.frame.origin = CGPointMake(rankingBox.frame.origin.x + rankingBox.frame.width - trocarFigurinhasBox.frame.width, rankingBox.frame.origin.y + rankingBox.frame.height + 10)
        trocarFigurinhasBox.addTarget(self , action: Selector("trocarAction"), forControlEvents: .TouchUpInside)
        view.addSubview(trocarFigurinhasBox)
        
    }

    
    func trocarAction() {
        
        
    }
    
    func ganharAction() {
        
        print("ganhar")
        let ganhar = GanharFigurinhasViewController()
        self.navigationController?.pushViewController(ganhar, animated: true)
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
