//
//  CollectionViewController.swift
//  HackPuc
//
//  Created by Jordana Mecler on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var type = String()
    var categoria: CategoriasAlbum!
    var collectionView: UICollectionView!
    
    var boolArray: Array<Bool>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(10, 30, 20, 20)
        backButton.setTitle("<", forState: .Normal)
        backButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        backButton.addTarget(self, action: "backPressed", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(backButton)
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 40, 150, 30)
        categoryLabel.center.x = self.view.center.x
        categoryLabel.textAlignment = .Center
        categoryLabel.text = type
        categoryLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 28)
        
        self.view.addSubview(categoryLabel)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: CGRectMake(0, categoryLabel.frame.origin.y + categoryLabel.frame.height + 5, self.view.frame.width, self.view.frame.height/1.25), collectionViewLayout: layout)
        collectionView.center.x = self.view.center.x
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)

    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let figurinha = FigurinhaViewController()
        
        if categoria == CategoriasAlbum.Atleta {
            figurinha.atleta = Atleta(nome: "Neymar Jr", pais: "Brazil", idade: 23, qtdMedalhas: 0,index: indexPath.row)
            figurinha.cardImage = UIImage(named: "neymar") 
        }
        else if categoria == CategoriasAlbum.Equipe {
            figurinha.equipe = Equipe(pais: "Brasil", modalidade: "Futebol", medalhas: 5, integrantes: "Julio Cesar, Thiago Silva, Neymar",index: indexPath.row)
            figurinha.cardImage = UIImage(named: "equipebrasil")
        }
        else if categoria == CategoriasAlbum.Modalidade {
            figurinha.modalidade = Modalidade(nome: "Judo", historia: "Essa historia do judo.",index: indexPath.row)
            figurinha.cardImage = UIImage(named: "judo")
        
        }
        else if categoria == CategoriasAlbum.Turismo {
            figurinha.turismo = Turismo(nome: "Maracana", desc: "É o estadio legal",index: indexPath.row)
            figurinha.cardImage = UIImage(named: "maracana")
        }
        else if categoria == CategoriasAlbum.OlimpiadaAntiga {
            figurinha.antiga = OlimpiadaAntiga(nome: "Athens", ano: 2004, desc: "Foi legal pra caramba e teve gente pra caramba.", paisGanhador: "USA",index: indexPath.row)
            figurinha.cardImage = UIImage(named: "atenas")
        }

        figurinha.cardIndex = indexPath.row + 1
        
        
        navigationController?.pushViewController(figurinha, animated: true)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        if boolArray[indexPath.row] == true {
            cell.backgroundView = UIImageView(image: UIImage(named: "neymar"))
        }
        else {
            cell.backgroundView = UIImageView(image: UIImage(named: "placeholder"))
        }

        return cell
    }
    
    func backPressed() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
