import Foundation

class Concentration {
    // free init if all var/let initialised
    private(set) var cards = [Card]()
    var cardsChoises: [Int] = []
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
    private(set) var flipCount = 0

    func chooseCard(at index: Int) {
        assert(
            cards.indices.contains(index),
            "Concentration.chooseCard(at: \(index)): chosen index not in cards")

        if !cards[index].isMatched {

            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {

                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    flipCount += 2
                } else if cardsChoises.contains(cards[matchIndex].uniqueIdentifier)
                    || cardsChoises.contains(cards[index].uniqueIdentifier)
                {
                    flipCount -= 1
                    cardsChoises.append(cards[index].uniqueIdentifier)
                } else {
                    cardsChoises.append(cards[index].uniqueIdentifier)
                    cardsChoises.append(cards[matchIndex].uniqueIdentifier)
                }
                cards[index].isFaceUp = true

            } else {

                indexOfOneAndOnlyFaceUpCard = index

            }

        }

    }

    init(numberOfPairsOfCards: Int) {
        assert(
            numberOfPairsOfCards > 0,
            "Concentration.init( \(numberOfPairsOfCards)): you must have at least one pair of cards"
        )
        for _ in 0..<numberOfPairsOfCards {

            let card = Card()
            var newCard = Card()
            newCard.emojiIdentifier = card.emojiIdentifier
            cards += [card, newCard]

        }

        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
