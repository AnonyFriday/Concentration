//
//  Concentration.swift
//  Concentration
//
//  Created by Vu Kim Duy on 9/1/21.
//

import Foundation


class Concentration
{
    //MARK: Variables
    var theme : [Character]!
    var emojiCardDictionary = [Int: Character]()
    
    var cards = [Card]()
    private var copiedIndex : Int?
    
    var totalPoints : Int = 0
    private var chosenCard  = [Int]()
    
    var flipCounts : Int = 0 
    
    //MARK: Initializer
    init(numberOfPairsOfCards: Int)
    {
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        self.theme = Array(Theme.pickRandomTheme())
        shuffleCards()
    }
    
    
    //MARK: Choose Card
    func chooseCard(at index: Int) {
        if !cards[index].isMatch
        {
            flipCounts += 1
            if let matchIndex = copiedIndex, matchIndex != index
            {
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch      = true
                }
                calculatePoint(firstCard: cards[matchIndex], secondCard: cards[index])
                cards[index].isFadeUp         = true
                copiedIndex                   = nil
            }
            
            else
            {
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFadeUp = false
                }
                
                copiedIndex = index
                cards[index].isFadeUp = true
            }
        }
    }
    
    
    //MARK: Get newGame, reset all of properties, instances
    func getNewGame()
    {
        for index in 0..<cards.count where cards[index].isMatch == true || cards[index].isFadeUp == true
        {
            cards[index].isFadeUp = false
            cards[index].isMatch = false
        }
        shuffleCards()
        emojiCardDictionary.removeAll()
        theme = Array(Theme.pickRandomTheme())
        totalPoints = 0
        chosenCard.removeAll()
    }
    
    
    //MARK: Shuffle Card
    func shuffleCards()
    {
        var shuffleCards = [Card]()
        while cards.count > 0
        {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count - 1)))
            let randomValue = cards.remove(at: randomIndex)
            shuffleCards.append(randomValue)
        }
        self.cards = shuffleCards
    }
    
    
    //MARK: calculatePoints
    func calculatePoint(firstCard: Card, secondCard: Card)
    {
        switch firstCard.identifier == secondCard.identifier
        {
        case true:
            totalPoints += 2
        case false:
            if chosenCard.contains(firstCard.identifier) || chosenCard.contains(secondCard.identifier)
            {
                let minusPoint = chosenCard.filter { $0 == firstCard.identifier || $0 == secondCard.identifier }.count
                totalPoints -= minusPoint
            }
            chosenCard.append(contentsOf: [firstCard.identifier,secondCard.identifier])
        }
    }
}


