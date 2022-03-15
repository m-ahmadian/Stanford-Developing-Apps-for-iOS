//
//  SetGame.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-02-07.
//

import Foundation

struct SetGame {

    static private let defaultNumberOfCardsToShow = 12

    private(set) var cards: Array<Card>
    private(set) var numberOfCardsToShow = defaultNumberOfCardsToShow
    private var selectedIndices: [Int]

    init() {
        selectedIndices = [Int]()
        cards = [Card]()
    }

    mutating func newGame() {
        selectedIndices.removeAll()
        cards.removeAll()
        numberOfCardsToShow = SetGame.defaultNumberOfCardsToShow

        for shape in CardShape.allCases {
            for color in CardColor.allCases {
                for number in 1...3 {
                    for shading in CardShading.allCases {
                        let card = Card(shape: shape, number: number, color: color, shading: shading)
                        self.cards.append(card)
                    }
                }
            }
        }

        cards.shuffle()
    }

    func choose(card: Card) {
        
    }


    func dealMore() {

    }

    func showHint() -> Bool {
        return true
    }










//    private(set) var cards: Array<Card>
//
//    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
//        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
//        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
//    }
//
//    mutating func choose(_ card: Card) {
//        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
//            !cards[chosenIndex].isFaceUp,
//            !cards[chosenIndex].isMatched
//        {
//            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
//                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
//                    cards[chosenIndex].isMatched = true
//                    cards[potentialMatchIndex].isMatched = true
//                }
//                cards[chosenIndex].isFaceUp = true
//            } else {
//                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
//            }
//        }
//    }
//
//    init(numberOfPairsOfCards: Int, createCardContent: (Int)  -> CardContent) {
//        cards = []
//        // add numberOfPairsOfCards * 2 cards to cards array
//        for pairIndex in 0..<numberOfPairsOfCards {
//            let content: CardContent = createCardContent(pairIndex)
//            cards.append(Card(content: content, id: pairIndex*2))
//            cards.append(Card(content: content, id: pairIndex*2+1))
//        }
//    }
//
//    struct Card: Identifiable {
//        var isFaceUp = false
//        var isMatched = false
//        let content: CardContent
//        let id: Int
//    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}