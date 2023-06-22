import Foundation

//struct CardID: Hashable, Equatable{
//    let value: Int
//    init(_ value: Int) {
//        self.value = value
//    }
//}

struct Card: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.emojiIdentifier)
    }
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.emojiIdentifier == rhs.emojiIdentifier
    }

    var isFaceUp = false
    var isMatched = false
    var emojiIdentifier: Int
    private(set) var uniqueIdentifier: Int

    private static var emojiIdentifierFactory = 0
    private static var uniqueIdentifierFactory = 0
    

    static func getEmojiIdentifier() -> Int {
        emojiIdentifierFactory += 1
        return emojiIdentifierFactory
    }
    static func getUniqueIdentifier() -> Int {
        uniqueIdentifierFactory += 1
        return uniqueIdentifierFactory
    }
    init() {
        self.emojiIdentifier = Card.getEmojiIdentifier()
        self.uniqueIdentifier = Card.getUniqueIdentifier()
    }
}
