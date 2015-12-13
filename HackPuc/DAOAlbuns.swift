//
//  DAO.swift
//  HackPuc
//
//  Created by Thiago De Angelis on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation

enum CategoriasAlbum {
    case Equipe
    case Atleta
    case OlimpiadaAntiga
    case Turismo
    case Modalidade
    case Evento
}

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
    
//    func getAtletasAlbum()->[Atleta] {
//    
//        let plistPath = self.getPath("Atletas")
//        
//        let atletasDict = NSMutableArray(contentsOfFile:plistPath)
//        var atletasArray = [Atleta]()
//        
//        for dict in atletasDict! {
//        
//            let atleta = Atleta(nome: dict.valueForKey("Nome") as! String, pais: dict.valueForKey("Pais") as! String, idade: dict.valueForKey("Idade") as! Int, qtdMedalhas: dict.valueForKey("QtdMedalhas") as! Int ,index: 0)
//
//            let possui = dict.valueForKey("Possui") as! Int
//            if possui == 1 {
//                atleta.possui = .Sim
//            }
//            if possui == 2 {
//                atleta.possui = .Brilhante
//            }
//            
//            
//            atletasArray.append(atleta)
//        
//        }
//        return atletasArray
//    }
    
    func getBoolenDict() -> Album {
        
        let plistPath = self.getPath("Atletas")
        
        let atletasDict = NSMutableArray(contentsOfFile: plistPath)
        let boolDict = atletasDict![3] as! NSDictionary
        
        if boolDict.count == 0{
            print("erro leitura int array")
        }
        
        let album = Album()

        album.atletaArray = boolDict.valueForKey("atletaArray") as! [Int]
        album.equipesArray = boolDict.valueForKey("equipeArray") as! [Int]
        album.olimpiadasAntigasArray = boolDict.valueForKey("olimpiadaAntigaArray") as! [Int]
        album.turismoArray = boolDict.valueForKey("turismoArray") as! [Int]
        album.modalidadeArray = boolDict.valueForKey("modalidadeArray") as! [Int]
        
        
        return album
            
    }
    
     func saveAlbum(alb: Album) {
        
        let plistpath = self.getPath("Atletas")
        let atletasDict = NSMutableArray(contentsOfFile: plistpath)
        
        let newDict: [String:Array<Int>] = ["equipeArray":alb.equipesArray,"atletaArray":alb.atletaArray,"olimpiadaAntigaArray":alb.olimpiadasAntigasArray,"turismoArray":alb.turismoArray,"modalidadeArray":alb.modalidadeArray]
        
        atletasDict![3] = newDict
        
        
        atletasDict!.writeToFile(plistpath, atomically: true)
    }
    
}

    
