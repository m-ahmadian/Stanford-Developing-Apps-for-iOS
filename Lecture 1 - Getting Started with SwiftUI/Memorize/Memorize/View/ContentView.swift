//
//  ContentView.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-01-25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.themeName)
                    .font(.largeTitle)
                Spacer()
                Text("Score: \(viewModel.score)")
                    .font(.largeTitle)
            }
            .padding(.horizontal)
            
            if #available(iOS 15.0, *) {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        }
                    }
                }
                .foregroundStyle(LinearGradient(colors: [viewModel.themeColor, viewModel.themeColor.opacity(0.3)], startPoint: UnitPoint.topLeading, endPoint: .bottomTrailing))
                .padding(.horizontal)
            } else {
                // Fallback on earlier versions
            }



            Button {
                viewModel.newGame()
            } label: {
                Text("New Game")
                    .font(.largeTitle)
            }

        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
