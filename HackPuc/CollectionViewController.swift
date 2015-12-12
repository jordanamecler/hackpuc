//
//  CollectionViewController.swift
//  HackPuc
//
//  Created by Jordana Mecler on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var type = String()
    private let barSize : CGFloat = 44.0
    private let kCellReuse : String = "PackCell"
    private let kCellheaderReuse : String = "PackHeader"
    private var collectionView : UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())   // Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 40, 150, 30)
        categoryLabel.center.x = self.view.center.x
        categoryLabel.textAlignment = .Center
        categoryLabel.text = type
        
        self.view.addSubview(categoryLabel)
        

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
