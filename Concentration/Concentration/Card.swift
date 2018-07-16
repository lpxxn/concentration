//
//  Card.swift
//  Concentration
//
//  Created by li on 2018/7/15.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
//
struct Card : Hashable{
    var hashValue: Int {
        return identifier
    }

    // == method eg. cards[1] == cards[0]
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    // 正面是否上向
    var isFaceUp = false
    // 匹配上
    var isMatched = false
    private var identifier: Int
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
