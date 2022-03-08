//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-01-25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
