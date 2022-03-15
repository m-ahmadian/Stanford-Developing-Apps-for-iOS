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
        self.model = SetGame()
    }

    // MARK: - Access to the model
    var cards: Array<Card> {
        model.cards
    }

    var cardsToShow: Array<Card> {
        Array(self.cards.filter({ !$0.isHidden}).prefix(self.model.numberOfCardsToShow))
    }

    // MARK: - Intent
    func newGame() {
        model.newGame()
    }

    func choose(card: Card) {
        model.choose(card: card)
    }

    func dealMore() {
        model.dealMore()
    }

    func showHint() -> Bool {
        model.showHint()
    }
}
