import Foundation
import UIKit

struct Theme {
    /// Fall
    /// Winter
    /// Summer
    /// Spring
    /// CIty
    /// Village
    let emoji: String
    let cardButtonsBackgroundColor: UIColor
    let gameBackgroundColor: UIColor
    let restartButtonColor: UIColor
    let restartButtonTextColor = UIColor(named: "theme.restartButtonTextColor")

    static let fall = Theme(
        emoji: "🌧️🍁🎃🔥☕️🥧🥮🍂🌰☔️🌩️💀",
        cardButtonsBackgroundColor: UIColor(named: "theme.fall.card") ?? .systemOrange,
        gameBackgroundColor: .systemBackground,
        restartButtonColor: UIColor(named: "theme.fall.button") ?? .systemGreen)
    static let winter = Theme(
        emoji: "❄️🥶☃️⛄️🧣⛷️⛸️🧤🏂🎄🎆🥂",
        cardButtonsBackgroundColor: UIColor(named: "theme.winter.card") ?? .systemBlue,
        gameBackgroundColor: .systemBackground,
        restartButtonColor: UIColor(named: "theme.winter.button") ?? .systemGreen)
    static let summer = Theme(
        emoji: "🌻⛱️🕶️🧴🌼🥵☀️🌴🍹🍸⛵️🤿",
        cardButtonsBackgroundColor: UIColor(named: "theme.summer.card") ?? .systemYellow,
        gameBackgroundColor: .systemBackground,
        restartButtonColor: UIColor(named: "theme.summer.button") ?? .systemGreen)
    static let spring = Theme(
        emoji: "🌷🌈🌞🌳🌱☘️🌾🕊️🦢🐝🐑🐣",
        cardButtonsBackgroundColor: UIColor(named: "theme.spring.card") ?? .systemBlue,
        gameBackgroundColor: .systemBackground,
        restartButtonColor: UIColor(named: "theme.spring.button") ?? .systemGreen)
    static let city = Theme(
        emoji: "🚗🚌🚎🚒🚑🛵🏪🏥🏗️🏘️🏭🚧",
        cardButtonsBackgroundColor: UIColor(named: "theme.city.card") ?? .systemBlue,
        gameBackgroundColor: .systemBackground,
        restartButtonColor: UIColor(named: "theme.city.button") ?? .systemGreen)
    static let village = Theme(
        emoji: "🐈🐐🏡🥛💪🐄🐓🦆🐖🪿🫏🖼️",
        cardButtonsBackgroundColor: UIColor(named: "theme.village.card") ?? .systemBlue,
        gameBackgroundColor: .systemBackground,
        restartButtonColor: UIColor(named: "theme.village.button") ?? .systemGreen)

    static let preset: [Theme] = [.fall, .winter, .spring, .summer, .city, .village]
    static func random() -> Theme {
        return preset[Int.random(in: 0..<preset.count)]
    }
    

}

