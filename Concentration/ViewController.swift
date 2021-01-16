//
//  ViewController.swift
//  Concentration
//
//  Created by Vu Kim Duy on 9/1/21.
//

import UIKit

class ViewController: UIViewController
{
    //MARK: Variables
    private lazy var game = Concentration(numberOfPairsOfCards: (buttons.count + 1) / 2)
    
    var numberOfPairsOfCards: Int {
        get {
            return (buttons.count + 1)
        }
    }
    
    
    //MARK: IBOutlet
    @IBOutlet private weak var pointsLabel: UILabel! {
        didSet { pointsLabel.applyAttributedLabelText(string: "Points: \(game.totalPoints)")}
    }
    
    
    @IBOutlet private weak var flipsLabel: UILabel! {
        didSet { flipsLabel.applyAttributedLabelText(string: "Flips: \(game.flipCounts)")}
    }
    
    
    @IBOutlet private var buttons: [UIButton]!
    
    
    @IBAction private func touchCardButton(_ sender: UIButton) {
        if let buttonIndex = buttons.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateUIElements()
        } else {
            print("Chosen card is not in the card array")
        }
    }
    
    
    @IBAction private func touchNewGameButton(_ sender: UIButton) {
        game.getNewGame()
        updateUIElements()
    }
    

    //MARK: updateUIElements
    private func updateUIElements() {
        pointsLabel.applyAttributedLabelText(string: "Points: \(game.totalPoints)")
        flipsLabel.applyAttributedLabelText(string: "Flips: \(game.flipCounts)")
        
        for index in buttons.indices {
            let button = buttons[index]
            let card   = game.cards[index]
            
            if card.isFadeUp {
                button.setButtonState(backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: setEmoji(for: card), for: .normal, isEnabled: true)
            } else {
                button.setButtonState(backgroundColor: card.isMatch ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), title: "", for: .normal, isEnabled: card.isMatch ? false : true)
            }
        }
    }
    
    
    //MARK: setEmoji
    private func setEmoji(for card: Card) -> String {
        if game.emojiCardDictionary[card] == nil, game.theme.count > 0 {
            let randomEmoji = game.theme.remove(at: game.theme.count.arc4Random())
            game.emojiCardDictionary[card] = randomEmoji
        }
        return String(game.emojiCardDictionary[card] ?? "?")
    }
}




