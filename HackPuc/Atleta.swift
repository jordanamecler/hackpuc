//
//  Atleta.swift
//  HackPuc
//
//  Created by Thiago De Angelis on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation

enum Possui {
    case Nao
    case Sim
    case Brilhante
}

class Atleta {
  
    let nome:String
    let pais:String
    let idade:Int
    let qtdMedalhas:Int
    var possui = Possui.Nao
    
    init(nome:String, pais:String, idade:Int, qtdMedalhas:Int) {
        self.nome = nome
        self.pais = pais
        self.idade = idade
        self.qtdMedalhas = qtdMedalhas
    }
    
    
    
    
}