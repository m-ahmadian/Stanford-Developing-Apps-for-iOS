//
//  SetGameViewModel.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-02-07.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published var model: SetGame

    init() {
        self.model = setGame()
    }

    // Access to the model
    var cards: Array<Card> {
        model.cards
    }

    var cardsToShow: Array<Card> {
        Array(self.cards.filter({ $0.isHidden}))
    }




    typealias Card = setGame<String>.Card

    private static let emojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]

    private static func createMemoryGame() -> setGame<String> {
        setGame<String>(numberOfPairsOfCards: 6) { pairIndex in
                emojis[pairIndex]
            }
    }

    @Published private var model = createMemoryGame()

    var cards: Array<Card> {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: Card) {
        model.choose(card)
    }
}
