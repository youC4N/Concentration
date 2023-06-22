//
//  ViewController.swift
//  Concentration
//
//  Created by Егор Малыгин on 04.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private lazy var emojiChoices = theme.emoji

    private var theme = Theme.random()
    private var emoji = [Card: String]()

    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var restartButton: UIButton!

    @IBAction private func touchNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        theme = Theme.random()
        emojiChoices = theme.emoji
        emoji = [:]
        applyThemeToUI()
        updateViewFromModel()
    }
    @IBAction private func touchCard(_ sender: UIButton) {

        if let cardNumber = cardButtons.firstIndex(of: sender) {

            game.chooseCard(at: cardNumber)

            updateViewFromModel()
        } else {
            print("chosen card wasn't in cardButtons")
        }
    }

    private func applyThemeToUI() {
        self.view.backgroundColor = theme.gameBackgroundColor
        restartButton.backgroundColor = theme.restartButtonColor
        UIButton.appearance().backgroundColor = theme.cardButtonsBackgroundColor
        restartButton.setTitleColor(theme.restartButtonTextColor, for: .normal)

    }
    private func updateViewFromModel() {
        if game.flipCount >= 0 {
            scoreLabel.text = String(format: "%03d", game.flipCount)
        } else {
            scoreLabel.text = "-\(String(format: "%03d", -game.flipCount))"
        }
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .label
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : theme.cardButtonsBackgroundColor
            }
        }
    }
    private func emoji(for card: Card) -> String {
        if let emojiValue = emoji[card] {
            return emojiValue
        } else if emojiChoices.count > 0 {
            let randomIndex = emojiChoices.indices.randomElement()!
            let randomEmoji = String(emojiChoices.remove(at: randomIndex))
            emoji[card] = randomEmoji
            return randomEmoji
        } else {
            return "?"  // Default emoji when no choices are available
        }
    }

    override func viewDidLoad() {
        applyThemeToUI()
    }

}

extension Int {

    var arc4random: Int {
        if self > 0 {

            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {

            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }

    }

}
