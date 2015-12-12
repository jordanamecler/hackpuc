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
    
    let cellWidth = UIScreen.mainScreen().bounds.width * 0.9
    let cellHeight = UIScreen.mainScreen().bounds.height / 4
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 30
        
        let grayFilter = UIView()
        grayFilter.frame.size = CGSizeMake(cellWidth, cellWidth / 2)
        grayFilter.backgroundColor = UIColor.whiteColor()
        grayFilter.alpha = 0.6
        self.addSubview(grayFilter)
        
        label = UILabel()
        label.frame.size = CGSizeMake( cellWidth / 2  , self.frame.width / 6)
        label.center = CGPointMake( cellWidth / 2, cellHeight / 2)
        label.textAlignment = .Center
        label.textColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
        label.font = UIFont(name: "LondrinaSolid-Regular", size: 30)
        self.addSubview(label)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
