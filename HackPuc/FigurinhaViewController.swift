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

    var atleta: Atleta?
    var equipe: Equipe?
    var antiga: OlimpiadaAntiga?
    var turismo: Turismo?
    var modalidade: Modalidade?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(10, 30, 20, 20)
        backButton.setTitle("<", forState: .Normal)
        backButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        backButton.addTarget(self, action: "backPressed", forControlEvents: .TouchUpInside)
        view.addSubview(backButton)
        
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
        
        
        // + Info
        
        if let atleta = atleta {
            
            let cardNameLabel = UILabel()
            cardNameLabel.text = "Name: \(atleta.nome)"
            cardNameLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            cardNameLabel.frame = CGRectMake(cardImageView.frame.origin.x , cardImageView.frame.origin.y + cardImageView.frame.height + 10 ,view.frame.width * 0.6, 40)
            view.addSubview(cardNameLabel)
        
           let ageLabel = UILabel()
            ageLabel.text = "Age: \(atleta.idade)"
            ageLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            ageLabel.frame = CGRectMake(cardNameLabel.frame.origin.x , cardNameLabel.frame.origin.y + cardNameLabel.frame.height ,view.frame.width * 0.6, 40)
            view.addSubview(ageLabel)
            
            let medalsLabel = UILabel()
            if atleta.qtdMedalhas == 1 {
                medalsLabel.text = "\(atleta.qtdMedalhas) medal"
            }
            else {
                medalsLabel.text = "\(atleta.qtdMedalhas) medals"
            }
            medalsLabel.frame = CGRectMake(ageLabel.frame.origin.x, ageLabel.frame.origin.y + ageLabel.frame.height, ageLabel.frame.width, ageLabel.frame.height)
            medalsLabel.text = "\(atleta.qtdMedalhas) medals"
            medalsLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            view.addSubview(medalsLabel)
            
        }
        else if let equipe = equipe {
            
        }
        else if let antiga = antiga {
            
        }
        else if let turismo = turismo {
            
        }
        else if let modalidade = modalidade {
            
        }
        
    }

    func backPressed() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
