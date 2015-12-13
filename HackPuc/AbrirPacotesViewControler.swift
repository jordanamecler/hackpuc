//
//  AbrirPacotesViewControler.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class AbrirPacotesViewControler: UIViewController {
    
    var pacotinho: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 40, 200, 38)
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
        
    }
    
    func openPacotinho() {
        
        UIView.animateWithDuration(1, animations: {
            
            self.pacotinho.image = UIImage(named: "pacoteAberto")
            
        })
        
    }

}
