//
//  Figurinha.swift
//  Stickerz
//
//  Created by Leonardo Edelman Wajnsztok on 13/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import Foundation

class Figurinha {
    
    var categoria: CategoriasAlbum
    var index: Int = -1
    
    init(categoria: CategoriasAlbum, index: Int) {
        self.categoria = categoria
        self.index = index
    }
}