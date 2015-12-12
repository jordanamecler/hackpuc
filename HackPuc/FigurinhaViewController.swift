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
            
            let cardCountryLabel = UILabel()
            cardCountryLabel.text = "Country: \(equipe.pais)"
            cardCountryLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            cardCountryLabel.frame = CGRectMake(cardImageView.frame.origin.x , cardImageView.frame.origin.y + cardImageView.frame.height + 10 ,view.frame.width * 0.6, 40)
            view.addSubview(cardCountryLabel)
            
            let modalidadeLabel = UILabel()
            modalidadeLabel.text = "Sport: \(equipe.modalidade)"
            modalidadeLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            modalidadeLabel.frame = CGRectMake(cardCountryLabel.frame.origin.x , cardCountryLabel.frame.origin.y + cardCountryLabel.frame.height ,view.frame.width * 0.6, 40)
            view.addSubview(modalidadeLabel)
            
            let medalsLabel = UILabel()
            medalsLabel.frame = CGRectMake(modalidadeLabel.frame.origin.x, modalidadeLabel.frame.origin.y + modalidadeLabel.frame.height, modalidadeLabel.frame.width, modalidadeLabel.frame.height)
            medalsLabel.text = "Members:\(equipe.integrantes)."
            medalsLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            view.addSubview(medalsLabel)
            
            
        }
        else if let antiga = antiga {
            
            let cardName = UILabel()
            cardName.text = "\(antiga.nome) - \(antiga.ano)"
            cardName.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            cardName.frame = CGRectMake(cardImageView.frame.origin.x , cardImageView.frame.origin.y + cardImageView.frame.height + 10 ,view.frame.width * 0.6, 40)
            view.addSubview(cardName)
            
            let winnerLabel = UILabel()
            winnerLabel.text = "Winner: \(antiga.paisGanhador)"
            winnerLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            winnerLabel.frame = CGRectMake(cardName.frame.origin.x , cardName.frame.origin.y + cardName.frame.height ,view.frame.width * 0.6, 40)
            view.addSubview(winnerLabel)
            
            let descLabel = UILabel()
            descLabel.frame = CGRectMake(winnerLabel.frame.origin.x, winnerLabel.frame.origin.y + winnerLabel.frame.height, winnerLabel.frame.width, winnerLabel.frame.height)
            descLabel.text = "Members:\(antiga.desc)."
            descLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            view.addSubview(descLabel)
            
            
        }
        else if let turismo = turismo {
            
            let cardName = UILabel()
            cardName.text = "Name: \(turismo.nome)"
            cardName.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            cardName.frame = CGRectMake(cardImageView.frame.origin.x , cardImageView.frame.origin.y + cardImageView.frame.height + 10 ,view.frame.width * 0.6, 40)
            view.addSubview(cardName)
            
            let descLabel = UILabel()
            descLabel.text = "\(turismo.desc)"
            descLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            descLabel.frame = CGRectMake(cardName.frame.origin.x , cardName.frame.origin.y + cardName.frame.height ,view.frame.width * 0.6, 40)
            view.addSubview(descLabel)
        }
        else if let modalidade = modalidade {
            
            let cardName = UILabel()
            cardName.text = "Name: \(modalidade.nome)"
            cardName.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            cardName.frame = CGRectMake(cardImageView.frame.origin.x , cardImageView.frame.origin.y + cardImageView.frame.height + 10 ,view.frame.width * 0.6, 40)
            view.addSubview(cardName)
            
            let histLabel = UILabel()
            histLabel.text = "\(modalidade.historia)"
            histLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 22)
            histLabel.frame = CGRectMake(cardName.frame.origin.x , cardName.frame.origin.y + cardName.frame.height ,view.frame.width * 0.6, 40)
            view.addSubview(histLabel)
            
        }
        
    }

    func backPressed() {
        navigationController?.popViewControllerAnimated(true)
    }
    



}
