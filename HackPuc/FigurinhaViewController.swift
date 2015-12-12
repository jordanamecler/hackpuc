//
//  FigurinhaViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class FigurinhaViewController: UIViewController {

    var cardImage: UIImage!
    var cardIndex: Int!
    var cardName: String!
    var age: Int?
    var numberOfMedals: Int!
    var modalidade: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .whiteColor()
        
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(10, 30, 20, 20)
        backButton.setTitle("<", forState: .Normal)
        backButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        backButton.addTarget(self, action: "backPressed", forControlEvents: .TouchUpInside)
        view.addSubview(backButton)
        
        // Info da figurinha
        
        let cardNumberLabel = UILabel()
        cardNumberLabel.text = "#\(cardIndex)"
        cardNumberLabel.frame.size = CGSizeMake(50, 50)
        cardNumberLabel.center = CGPointMake(view.frame.width * 0.5, view.frame.height * 0.08)
        cardNumberLabel.textColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
        cardNumberLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 28)
        view.addSubview(cardNumberLabel)
        
        let cardImageView = UIImageView()
        cardImageView.image = cardImage
        cardImageView.frame.size = CGSizeMake(view.frame.width * 0.7, view.frame.height * 0.5)
        cardImageView.center = CGPointMake(view.frame.width  / 2, view.frame.height * 0.35)
        view.addSubview(cardImageView)
        
        let cardNameLabel = UILabel()
        cardNameLabel.text = "Name: \(cardName)"
        cardNameLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
        cardNameLabel.frame = CGRectMake(cardImageView.frame.origin.x , cardImageView.frame.origin.y + cardImageView.frame.height + 10 ,view.frame.width * 0.6, 40)
        view.addSubview(cardNameLabel)
        
        var nextFrame: CGRect!
        
        // age é optional pq nem tudo tem idade
        let ageLabel: UILabel?
        if let age = age {
            ageLabel = UILabel()
            ageLabel!.text = "Age: \(age)"
            ageLabel!.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            ageLabel!.frame = CGRectMake(cardNameLabel.frame.origin.x , cardNameLabel.frame.origin.y + cardNameLabel.frame.height ,view.frame.width * 0.6, 40)
            view.addSubview(ageLabel!)
            nextFrame = CGRectMake(ageLabel!.frame.origin.x , ageLabel!.frame.origin.y + ageLabel!.frame.height ,view.frame.width * 0.6, 40)
        }
        else {
            nextFrame = CGRectMake(cardNameLabel.frame.origin.x , cardNameLabel.frame.origin.y + cardNameLabel.frame.height ,view.frame.width * 0.6, 40)
        }
        
        let medalsLabel = UILabel()
        if numberOfMedals == 1 {
            medalsLabel.text = "\(numberOfMedals) medal"
        }
        else {
            medalsLabel.text = "\(numberOfMedals) medals"
        }
        medalsLabel.frame = nextFrame
        medalsLabel.text = "\(numberOfMedals) medals"
        medalsLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
        view.addSubview(medalsLabel)
        
        let modalidadeLabel = UILabel()
        modalidadeLabel.text = "\(modalidade)"
        modalidadeLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
        modalidadeLabel.frame = CGRectMake(nextFrame.origin.x , nextFrame.origin.y + medalsLabel.frame.height, nextFrame.width, 40)
        view.addSubview(modalidadeLabel)
        

        
        
    }

    func backPressed() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
