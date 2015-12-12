//
//  AlbumViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let categoriesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 70, 150, 30)
        categoryLabel.center.x = self.view.center.x
        categoryLabel.textAlignment = .Center
        categoryLabel.text = "Categories"
        
        self.view.addSubview(categoryLabel)

        categoriesTableView.frame = CGRectMake(0, categoryLabel.frame.origin.y + categoryLabel.frame.height + 20, self.view.frame.width, self.view.frame.height/1.5)
        categoriesTableView.center.x = self.view.center.x
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
        self.view.addSubview(categoriesTableView)
        
        self.view.backgroundColor = .blueColor()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.height/4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menuCell = UITableViewCell()
        
        menuCell.backgroundColor = UIColor.clearColor()
        
        switch indexPath.row {
            case 0:
                menuCell.textLabel?.text = "The Event"
            case 1:
                menuCell.textLabel?.text = "Athletes"
            case 2:
                menuCell.textLabel?.text = "Teams"
            case 3:
                menuCell.textLabel?.text = "Modalities"
            case 4:
                menuCell.textLabel?.text = "Tourism"
            case 5:
                menuCell.textLabel?.text = "Past"
            
            default:
                break
        }

        menuCell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        menuCell.textLabel?.textColor = UIColor.darkGrayColor()
        
        
        return menuCell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
