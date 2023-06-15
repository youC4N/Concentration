//
//  ViewController.swift
//  Concentration
//
//  Created by Егор Малыгин on 04.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var theme = Theme.random()

    //    override init(nibName: String?, bundle: Bundle?) {
    //        self.emojiChoices = theme.emoji
    //        super.init(nibName: nibName, bundle: bundle)
    //    }

    private lazy var emojiChoices = theme.emoji
    private var emoji = [Card: String]()

    //    required init?(coder: NSCoder) {
    //        self.emojiChoices = theme.emoji
    //        super.init(coder: coder)
    //
    //    }
    override func viewDidLoad() {
        updateViewFromTheme()
    }

    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

    @IBOutlet private var cardButtons: [UIButton]!

    @IBOutlet private weak var flipCountLabel: UILabel!

    @IBAction private func touchNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        theme = Theme.random()
        emojiChoices = theme.emoji
        emoji = [:]
        updateViewFromTheme()
        updateViewFromModel()
    }
    @IBAction private func touchCard(_ sender: UIButton) {

        if let cardNumber = cardButtons.firstIndex(of: sender) {

            game.chooseCard(at: cardNumber)

            updateViewFromModel()
            print(game.cards[cardNumber])
            print("\n")

        } else {
            print("chosen card wasn't in cardButtons")
        }

    }
    @IBOutlet weak var newGameButton: UIButton!

    private func updateViewFromTheme() {
        self.view.backgroundColor = theme.gameBackground
        newGameButton.backgroundColor = theme.newGameButtonBackground
        for button in cardButtons {
            button.backgroundColor = theme.cardsBackground
        }
    }

    private func updateViewFromModel() {

        if game.flipCount % 100 < 10, game.flipCount < 100 {
            flipCountLabel.text = "00\(game.flipCount)"
        } else if game.flipCount % 100 <= 99, game.flipCount < 100 {
            flipCountLabel.text = "0\(game.flipCount)"
        } else {
            flipCountLabel.text = "\(game.flipCount)"
        }

        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
             button.backgroundColor = .label
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : theme.cardsBackground
            }
        }
    }

    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }

        return emoji[card] ?? "?"
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
