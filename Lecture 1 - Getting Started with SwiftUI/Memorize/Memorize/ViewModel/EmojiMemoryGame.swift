//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-02-07.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    init() {
        theme = Themes.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String>

    private var theme: Theme

    var themeName: String {
        theme.name
    }

    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        default:
            return .black
        }
    }

    var score: Int {
        model.score
    }

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

    func newGame() {
        theme = Themes.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
        model.newGame()
    }
}
