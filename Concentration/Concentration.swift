//
//  Concentration.swift
//  Concentration
//
//  Created by li on 2018/7/15.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func choseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.choseCard(at: \(index)): Choosen index out of range")
        if !cards[index].isMatched {
            // 如果已经有isFaceUp说明已经点开了一张一样的了
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                // set faceup
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): You must have at least one pair of cards")
        for i in 1...numberOfPairsOfCards {
            print("numberOfPairsOfCards", i)
            let card = Card()
            cards += [card, card]
            
        }
        
        // TODO: Shuffle the cards
        
        
        
    }
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}








