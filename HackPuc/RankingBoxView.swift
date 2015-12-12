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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .whiteColor()
        
        self.frame.size = CGSizeMake(screenWidth * 0.9, screenHeight * 0.4)
        self.center = CGPointMake(screenWidth / 2, screenHeight * 0.4)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor(red:0.57, green:0.76, blue:0.4, alpha:1) .CGColor//UIColor(red:0.16, green:0.17, blue:0.21, alpha:1).CGColor
        self.layer.borderWidth = 1
        
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
        
        
        let table = UITableView(frame: CGRectMake(0, segmented.frame.origin.y + segmented.frame.height,  screenWidth * 0.9, screenHeight * 0.4 - screenHeight * 0.06 ), style: UITableViewStyle.Grouped)
        table.backgroundColor = .clearColor()
        table.delegate = self
        table.dataSource = self
        table.contentInset = UIEdgeInsetsZero
        addSubview(table)
        
        

    }
    
    func changeRanking(segmented: UISegmentedControl) {
        
        switch(segmented.selectedSegmentIndex) {
            
        case 0: break

        case 1: break

        default:
            break
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let rankCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell2")
        
        rankCell.backgroundColor = UIColor.clearColor()
        rankCell.textLabel?.text = "\(indexPath.row + 1)º"
        rankCell.textLabel?.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
        
        
        return rankCell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    override func drawRect(rect: CGRect) {
        
//        let context = UIGraphicsGetCurrentContext()
//        let path = CGPathCreateMutable()
//        CGPathMoveToPoint(path, nil, 0, screenHeight * 0.06)
//        CGPathAddLineToPoint(path, nil, screenWidth * 0.9, screenHeight * 0.06)
//        CGPathCloseSubpath(path)
//        CGContextAddPath(context, path)
//        CGContextSetLineWidth(context, 1)
//        CGContextSetStrokeColorWithColor(context, UIColor(red:0.16, green:0.17, blue:0.21, alpha:1).CGColor)
//        CGContextStrokePath(context)
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
