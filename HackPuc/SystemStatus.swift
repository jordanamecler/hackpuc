//
//  SystemStatus.swift
//  HackPuc
//
//  Created by Jordana Mecler on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation
import UIKit

class SystemStatus {
    /** ELEMENTOS DA ESTRUTURA PADRAO DE UM SINGLETON **/
    class var sharedInstance:SystemStatus {
        get {
        struct Singleton {
            static let instance = SystemStatus()
            }
        return Singleton.instance
        }
    }
    
    private init() {
    }
    /** FIM DA IMPLEMANTACAO PADRAO DE UM SINGLETON **/
     
     /* NavigationController do aplicativo */
    var navController:UINavigationController?

/** Aqui eu guardo as coisas que eu quero usar em todas as telas do sistema. Sempre os mesmos valores, pq é um Singleton. **/
}
