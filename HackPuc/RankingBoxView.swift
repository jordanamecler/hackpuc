//
//  RankingBoxView.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class RankingBoxView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    private let screenWidth = UIScreen.mainScreen().bounds.width
    private let screenHeight = UIScreen.mainScreen().bounds.height
    var names: Array<String>!
    var names1: Array<String>!
    var names2: Array<String>!
    var table: UITableView!
    
    

    init(frame: CGRect, names: Array<String>, names2: Array<String>) {
        super.init(frame: frame)
        
        self.names1 = names
        self.names2 = names2
        self.names = names
        
        backgroundColor = .whiteColor()
        
        self.frame.size = CGSizeMake(screenWidth * 0.9, screenHeight * 0.4)
        self.center = CGPointMake(screenWidth / 2, screenHeight * 0.35)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor(red:0.57, green:0.76, blue:0.4, alpha:1) .CGColor//UIColor(red:0.16, green:0.17, blue:0.21, alpha:1).CGColor
        self.layer.borderWidth = 5
        
        let title = UILabel()
        title.textAlignment = .Center
        title.frame.size = CGSizeMake( screenWidth * 0.9 , 50)
        title.center = CGPointMake( screenWidth * 0.9 / 2, screenHeight * 0.03)
        title.text  = "Ranking"
        title.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        title.textColor = .blackColor()
        addSubview(title)
        
        let segmented = UISegmentedControl(items: ["Friends","Global"])
        segmented.selectedSegmentIndex = 0
        segmented.frame.size = CGSizeMake( screenWidth * 0.9, 30)
        segmented.frame.origin = CGPointMake(0, screenHeight * 0.06 )
        segmented.tintColor = UIColor(red:0.57, green:0.76, blue:0.4, alpha:1)
        segmented.layer.cornerRadius = 1
        segmented.addTarget(self, action: Selector("changeRanking:"), forControlEvents: UIControlEvents.ValueChanged)
        addSubview(segmented)
        
        
        table = UITableView(frame: CGRectMake(0, segmented.frame.origin.y + segmented.frame.height,  screenWidth * 0.9, screenHeight * 0.4 - screenHeight * 0.06 ), style: UITableViewStyle.Grouped)
        table.backgroundColor = .clearColor()
        table.delegate = self
        table.dataSource = self
        table.contentInset = UIEdgeInsetsZero
        addSubview(table)
        
        

    }
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    func changeRanking(segmented: UISegmentedControl) {
        
        switch(segmented.selectedSegmentIndex) {
            
        case 0:
            names = names1

        case 1:
            names = names2
        default:
            break
        }
        
        table.reloadData()
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let rankCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell2")
        
        rankCell.backgroundColor = UIColor.clearColor()
        if self.names != nil {
            rankCell.textLabel?.text = "\(indexPath.row + 1)º \(self.names[indexPath.row])"
        }
        else {
            rankCell.textLabel?.text = "\(indexPath.row + 1)º"
        }
        rankCell.textLabel?.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        
        return rankCell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    convenience init(names: Array<String>, names2: Array<String>) {
        self.init(frame: CGRectZero, names: names, names2:names2)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
