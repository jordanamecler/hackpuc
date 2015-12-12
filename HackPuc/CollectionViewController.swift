//
//  CollectionViewController.swift
//  HackPuc
//
//  Created by Jordana Mecler on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var type = String()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(10, 30, 20, 20)
        backButton.setTitle("<", forState: .Normal)
        backButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        backButton.addTarget(self, action: "backPressed", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(backButton)
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 40, 150, 30)
        categoryLabel.center.x = self.view.center.x
        categoryLabel.textAlignment = .Center
        categoryLabel.text = type
        categoryLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 28)
        
        self.view.addSubview(categoryLabel)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: CGRectMake(0, categoryLabel.frame.origin.y + categoryLabel.frame.height + 5, self.view.frame.width, self.view.frame.height/1.25), collectionViewLayout: layout)
        collectionView.center.x = self.view.center.x
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)

    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let figurinha = FigurinhaViewController()
        
        figurinha.cardIndex = indexPath.row + 1
        figurinha.cardName = "Neymar Jr."
        figurinha.cardImage = UIImage(named: "neymar")
        figurinha.age = 23
        figurinha.numberOfMedals = 0
        figurinha.modalidade = "Futebol Masculino"
        
        
        navigationController?.pushViewController(figurinha, animated: true)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func backPressed() {
        navigationController?.popViewControllerAnimated(true)
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
