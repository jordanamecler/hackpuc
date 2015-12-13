//
//  AbrirPacotesViewControler.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import AVFoundation
import UIKit

class AbrirPacotesViewControler: UIViewController {
    
    var pacotinho: UIImageView!
    var abrePacote : AVAudioPlayer?
    var aberto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        let image = UIImage(named: "navbar")
        let topBar = UIImageView(image: image)
        topBar.frame = CGRectMake(0, 0, (image?.size.width)!, (image?.size.height)!)
        self.view.addSubview(topBar)
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 25, 200, 38)
        categoryLabel.center.x = self.view.center.x
        categoryLabel.textAlignment = .Center
        categoryLabel.text = "Let's open it!"
        categoryLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 30)
        
        self.view.addSubview(categoryLabel)
        
        let pacotinhoImage = UIImage(named: "pacoteFechado")
        pacotinho = UIImageView(image: pacotinhoImage)
        pacotinho.frame.size = (pacotinhoImage?.size)!
        pacotinho.center.x = view.center.x
        pacotinho.center.y = view.center.y + 50
        pacotinho.userInteractionEnabled = true
        
        view.addSubview(pacotinho)
        
        let touch = UITapGestureRecognizer(target: self, action: Selector("openPacotinho"))
        touch.numberOfTapsRequired = 1
        pacotinho.addGestureRecognizer(touch)
        
        
        if let abrePacote = self.setupAudioPlayerWithFile("rasgo", type:"wav") {
            self.abrePacote = abrePacote
        }

        
    }
    
    func openPacotinho() {
        
        if aberto == false {
        
            aberto = true
            abrePacote?.play()
            
            UIView.animateWithDuration(1, animations: {
                
                self.pacotinho.image = UIImage(named: "pacoteAberto")
                
            })
            
            let alb = DAOAlbuns().getBoolenDict()
            
            for _ in 0...3 {
                
                let i = Int.random(2...6)
                let j = Int.random(0...14)
                
                switch (i) {
                case 2:
                    alb.atletaArray[j]++
                case 3:
                    alb.equipesArray[j]++
                case 4:
                    alb.modalidadeArray[j]++
                case 5:
                    alb.turismoArray[j]++
                case 6:
                    alb.olimpiadasAntigasArray[j]++
                default:
                    break
                }
                
                print("cat: \(i) index: \(j)")
            }
            
            DAOAlbuns().saveAlbum(alb)
            
            var totalFigurinhas = 0
            
            for i in alb.atletaArray {
                totalFigurinhas += i
            }
            for i in alb.equipesArray {
                totalFigurinhas += i
            }
            for i in alb.modalidadeArray {
                totalFigurinhas += i
            }
            for i in alb.olimpiadasAntigasArray {
                totalFigurinhas += i
            }
            for i in alb.turismoArray {
                totalFigurinhas += i
            }
            
            
            print("total figurinhas: \(totalFigurinhas)")
            
            
            let done = UIButton()
            let image = UIImage(named: "doneBut")
            done.setImage(image, forState: .Normal)
            done.frame.size = (image?.size)!
            done.center.x = view.center.x
            done.center.y = view.frame.height * 0.8
            done.addTarget(self, action: Selector("doneAction"), forControlEvents: .TouchUpInside)
            
            view.addSubview(done)
        }

    }
    
    func doneAction() {
        let n: Int! = self.navigationController?.viewControllers.count
        self.navigationController?.popViewControllerAnimated(true)
        (self.navigationController?.viewControllers[n-2] as! QRCodeVC).pop()
    }
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }


}
