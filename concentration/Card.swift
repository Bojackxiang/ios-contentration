//
//  Card.swift
//  concentration
//
//  Created by Weijie Xiang on 26/10/18.
//  Copyright © 2018 Weijie Xiang. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var idFactory = 0
    
    static func getAUniqueIdentifier() -> Int{
    // * static可以直接进入另外一个static
    // * Card.idFactory += 1
    // * return Card.idFactory
        idFactory += 1
        return idFactory
    }
    
    init(){
        self.id = Card.getAUniqueIdentifier()
    }
    
    
}
