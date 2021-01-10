//
//  Concentration.swift
//  Concentration
//
//  Created by Vu Kim Duy on 9/1/21.
//

import Foundation


class Concentration
{
    var theme : [Character]!
    var emojiCardDictionary = [Int: Character]()
    
    var cards = [Card]()
    var copiedIndex : Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        self.theme = Array(Theme.pickRandomTheme())
        shuffleCards()
    }
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatch {
            if let matchIndex = copiedIndex, matchIndex != index {
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch      = true
                }
                
                cards[index].isFadeUp         = true
                copiedIndex                   = nil
            } else {
                
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFadeUp = false
                }
                
                copiedIndex = index
                cards[index].isFadeUp = true
            }
        }
    }
    
    //MARK: Get newGame, reset all of properties, instances
    func getNewGame() {
        for index in 0..<cards.count  {
            if cards[index].isMatch == true || cards[index].isFadeUp == true {
                cards[index].isFadeUp = false
                cards[index].isMatch = false
            }
        }
        shuffleCards()
        emojiCardDictionary.removeAll()
        theme = Array(Theme.pickRandomTheme())
    }
    
    
    func shuffleCards() {
        var shuffleCards = [Card]()
        while cards.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count - 1)))
            let randomValue = cards.remove(at: randomIndex)
            shuffleCards.append(randomValue)
        }
        self.cards = shuffleCards
    }
    
    func getTheme() {
        
    }
}


