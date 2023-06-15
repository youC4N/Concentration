import Foundation

struct CardID: Hashable, Equatable{
    let value: Int
    init(_ value: Int) {
        self.value = value
    }
}

struct Card: Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    // value type = struct get copied but created after modification
    // reference type = class pointer

    var isFaceUp = false
    var isMatched = false
    private(set) var identifier: Int
    

    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
