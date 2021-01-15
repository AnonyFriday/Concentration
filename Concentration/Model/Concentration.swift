//
//  Concentration.swift
//  Concentration
//
//  Created by Vu Kim Duy on 9/1/21.
//

import Foundation

struct Concentration
{
    //MARK: Variables
    var theme : [Character]!
    var emojiCardDictionary = [Card:Character]()
    
    private(set) var cards = [Card]()
    private var copiedIndex : Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFadeUp {
                    
                    //Whenever you found 2 times isFaceup = true, then you return the foundIndex = nil
                    guard foundIndex == nil else { return nil}
                    foundIndex = index
                }
            }
            return foundIndex
        }
        set(newValue) {

            // set the isFadeUp = true whenever the value set for copiedIndex equals to the index in the card
            for index in cards.indices {
                cards[index].isFadeUp = (index == newValue)
            }
        }
    }
    
    var totalPoints : Int = 0
    private var chosenCard  = [Card]()
    var flipCounts : Int = 0
    
    
    //MARK: Initializer
    init(numberOfPairsOfCards: Int)
    {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least 1 pair of cards")
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        self.theme = Array(Theme.pickRandomTheme())
        shuffleCards()
    }
    
    
    //MARK: Choose Card
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatch
        {
            flipCounts += 1
            // if we have the copiedIndex
            if let matchIndex = copiedIndex, matchIndex != index
            {
                if cards[matchIndex] == cards[index]
                {
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch      = true
                }
                calculatePoint(firstCard: cards[matchIndex], secondCard: cards[index])
                cards[index].isFadeUp         = true
            }
            
            // if we don't have the copied index
            else
            {
                copiedIndex = index
            }
        }
    }
    
    
    //MARK: Get newGame, reset all of properties, instances
    mutating func getNewGame()
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
        flipCounts  = 0
        chosenCard.removeAll()
    }
    
    
    //MARK: Shuffle Card
    mutating private func shuffleCards()
    {
        var shuffleCards = [Card]()
        while cards.count > 0
        {
            let randomValue = cards.remove(at: cards.count.arc4Random())
            shuffleCards.append(randomValue)
        }
        self.cards = shuffleCards
    }
    
    
    //MARK: calculatePoints
    mutating func calculatePoint(firstCard: Card, secondCard: Card)
    {
        switch firstCard == secondCard
        {
        case true:
            totalPoints += 2
        case false:
            if chosenCard.contains(firstCard) || chosenCard.contains(secondCard)
            {
                let minusPoint = chosenCard.filter { $0 == firstCard || $0 == secondCard }.count
                totalPoints -= minusPoint
            }
            chosenCard.append(contentsOf: [firstCard,secondCard])
        }
    }
}


