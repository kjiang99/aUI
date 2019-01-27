//
//  Concentration.swift
//  aUI
//
//  Created by Haojun Jiang on 1/20/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import Foundation

struct Card : Hashable {
    var hashValue: Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int

    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}


struct Concentration {
    init (numberOfPairsOfCards: Int) {
        var cardsTemp = [Card]()
        for _  in 0..<numberOfPairsOfCards {
            let card = Card()
            cardsTemp += [card, card]
        }
        
        //Shuffle cards
        let count = cardsTemp.count
        for _ in 0..<count {
            if cardsTemp.count > 0 {
                let randomInt = cardsTemp.count.arc4random
                cards.append(cardsTemp.remove(at: randomInt))
            }
        }
    }
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards [$0].isFaceUp}.oneAndOnly
//            let faceUpCardIndices = cards.indices.filter { i in  cards[i].isFaceUp }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    
//    private var indexOfOneAndOnlyFaceUpCard: Int? {
//        get {
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
//        }
//        set {
//            for index in cards.indices {
//                cards[index].isFaceUp = (index == newValue)
//            }
//        }
//    }
    

    
    mutating func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards face up
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
    }
}


extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32 (self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32 (abs(self))))
        } else {
            return 0
        }
    }
}
