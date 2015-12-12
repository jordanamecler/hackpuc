//
//  OlimpiadasAntigas.swift
//  HackPuc
//
//  Created by Thiago De Angelis on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation

class OlimpiadaAntiga {
    
    let nome:String!
    let ano:Int!
    let desc:String!
    let paisGanhador:String!
    let index: Int
    
    init (nome:String, ano:Int, desc:String, paisGanhador:String, index: Int) {
    
        self.nome = nome
        self.ano = ano
        self.desc = desc
        self.paisGanhador = paisGanhador
        self.index = index
    }
    
    
}