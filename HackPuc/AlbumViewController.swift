//
//  AlbumViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let categoriesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryLabel = UILabel()
        categoryLabel.frame = CGRectMake(0, 40, 150, 30)
        categoryLabel.center.x = self.view.center.x
        categoryLabel.textAlignment = .Center
        categoryLabel.text = "Categories"
        categoryLabel.font = UIFont(name: "LondrinaSolid-Regular", size: 30)
        
        self.view.addSubview(categoryLabel)

        categoriesTableView.frame = CGRectMake(0, categoryLabel.frame.origin.y + categoryLabel.frame.height + 20, self.view.frame.width * 0.9, self.view.frame.height/1.3)
        categoriesTableView.center.x = self.view.center.x
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.backgroundColor = .clearColor()
        
        self.view.addSubview(categoriesTableView)
        
        self.view.backgroundColor = .whiteColor()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.height/4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let menuCell = AlbumTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")//UITableViewCell()
        
        menuCell.backgroundColor = UIColor.clearColor()
        
        switch indexPath.section {
            case 0:
                menuCell.label?.text = "The Event"
                menuCell.categoria = CategoriasAlbum.Evento
            case 1:
                menuCell.label?.text = "Athletes"
                menuCell.categoria = CategoriasAlbum.Atleta
            case 2:
                menuCell.label?.text = "Teams"
                menuCell.categoria = CategoriasAlbum.Equipe
            case 3:
                menuCell.label?.text = "Modalities"
                menuCell.categoria = CategoriasAlbum.Modalidade
            case 4:
                menuCell.label?.text = "Tourism"
                menuCell.categoria = CategoriasAlbum.Turismo
            case 5:
                menuCell.label?.text = "Past"
                menuCell.categoria = CategoriasAlbum.OlimpiadaAntiga
            
            default:
                break
        }
        
        menuCell.backgroundView = UIImageView(image: UIImage(named: "albumImg"))
        
        return menuCell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let nextViewController = CollectionViewController()
        nextViewController.type = ((tableView.cellForRowAtIndexPath(indexPath) as! AlbumTableViewCell).label?.text)!
        nextViewController.categoria = (tableView.cellForRowAtIndexPath(indexPath) as! AlbumTableViewCell).categoria
            

        let transition = CATransition()
        transition.duration = 0.5;
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade;
        
        self.view.layer.addAnimation(transition, forKey: nil)
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.frame = CGRectMake(0, 0, view.frame.width * 0.9, view.frame.height / 4)
        view.backgroundColor = .clearColor()
        return view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
