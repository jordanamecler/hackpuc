//
//  Equipe.swift
//  HackPuc
//
//  Created by Thiago De Angelis on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation

class Equipe {

    let pais:String!
    let modalidade:String!
    let medalhas:Int
    let integrantes:[String]!
    
    init (pais:String, modalidade:String, medalhas:Int, integrantes:[String]) {
        self.pais = pais
        self.modalidade = modalidade
        self.medalhas = medalhas
        self.integrantes = integrantes
    }
    
    
}