//
//  AlbumTableViewCell.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    var label: UILabel!
    var categoria: CategoriasAlbum!
    var percentageLabel: UILabel!
    
    let cellWidth = UIScreen.mainScreen().bounds.width * 0.9
    let cellHeight = UIScreen.mainScreen().bounds.height / 4
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 30
        
        self.layer.borderColor = UIColor(red:0.58, green:0.78, blue:0.42, alpha:1).CGColor
        self.layer.borderWidth = 5
        
        let grayFilter = UIView()
        grayFilter.frame.size = CGSizeMake(cellWidth, cellWidth / 2)
        grayFilter.backgroundColor = UIColor.whiteColor()
        grayFilter.alpha = 0.6
        self.addSubview(grayFilter)
        
        label = UILabel()
        label.frame.size = CGSizeMake( cellWidth / 2 + 50 , self.frame.width / 6)
        label.center = CGPointMake( cellWidth / 2, cellHeight / 2.8)
        label.textAlignment = .Center
        label.textColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
        label.font = UIFont(name: "LondrinaSolid-Regular", size: 28)
        self.addSubview(label)
        self.selectionStyle = UITableViewCellSelectionStyle.None

        percentageLabel = UILabel()
        percentageLabel.frame.size = CGSizeMake( cellWidth / 2, self.frame.width / 6)
        percentageLabel.center = CGPointMake( cellWidth / 2, cellHeight / 1.6)
        percentageLabel.textAlignment = .Center
        percentageLabel.textColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
        percentageLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 20)
    
        self.addSubview(percentageLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
