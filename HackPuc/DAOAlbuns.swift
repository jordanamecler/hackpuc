//
//  DAO.swift
//  HackPuc
//
//  Created by Thiago De Angelis on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation


class DAOAlbuns {
    
    private func getPath(nomeArq:String)->String {
        
        let rootPath: String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let plistPath = rootPath.stringByAppendingString("/"+nomeArq+".plist")
        let fileManager: NSFileManager = NSFileManager.defaultManager()
        
        if !fileManager.fileExistsAtPath(plistPath) {
            
            let bundlePath: String? = NSBundle.mainBundle().pathForResource(nomeArq, ofType: "plist")
            
            if let bundle = bundlePath {
                do {
                    try fileManager.copyItemAtPath(bundle, toPath: plistPath)
                }
                catch let error as NSError {
                    print("Erro ao copiar "+nomeArq+".plist do mainBundle para plistPath: \(error.description)")
                }
            }
            else {
                print(nomeArq+".plist não está no mainBundle")
            }
        }
        return plistPath
    }
    
    func getAtletasAlbum()->[Atleta] {
    
        let plistPath = self.getPath("Atletas")
        
        let atletasDict = NSMutableArray(contentsOfFile:plistPath)
        var atletasArray = [Atleta]()
        
        for dict in atletasDict! {
        
            let atleta = Atleta(nome: dict.valueForKey("Nome") as! String, pais: dict.valueForKey("Pais") as! String, idade: dict.valueForKey("Idade") as! Int, qtdMedalhas: dict.valueForKey("QtdMedalhas") as! Int)

            let possui = dict.valueForKey("Possui") as! Int
            if possui == 1 {
                atleta.possui = .Sim
            }
            if possui == 2 {
                atleta.possui = .Brilhante
            }
            
            
            atletasArray.append(atleta)
        
        }
    
    
    
        return atletasArray
    
    }
    
    
    
    
}