/// Fall
/// Winter
/// Summer
/// Spring
/// CIty
/// Village

import Foundation
import UIKit

struct Theme {
    let emoji: [String]
    let cardsBackground: UIColor
    let gameBackground: UIColor
    let newGameButtonBackground: UIColor
    
    static let fall = Theme(
        emoji: ["👻", "🎃", "🐍", "🍭", "🍫", "🍬", "🤫"],
        cardsBackground: .systemOrange,
        gameBackground: .systemBackground,
        newGameButtonBackground: .systemGreen)
    static let winter = Theme(
        emoji: ["❄️", "🥶", "☃️", "⛄️", "🧣", "🧦", "🌨️"],
        cardsBackground:  .systemBlue,
        gameBackground: .systemBackground,
        newGameButtonBackground: UIColor(named: "theme.winter.button")!)
    
    static let preset: [Theme] = [.fall,  .winter]
    static func random() -> Theme {
        return preset[Int.random(in: 0..<preset.count)]
    }
    

}
//
//class a
//var foo = 3
//var lazy barr = foo + 1
//
//class a1
//var theme = Theme.random()
//var emojiChoises = theme.emoji
//
