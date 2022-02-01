//
//  ContentView.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-01-25.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]

    var vehicles = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]

    var drinks = ["🍵","☕️","🥛","🧃","🍼","🥤","🧋","🫖","🧊","🍸","🍻","🍹"]

    var fruits = ["🍎","🍓","🍊","🍇","🍉","🥑","🫐","🥥","🥝"]


    @State var emojiCount = 24
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack() {
                drinksButton
                Spacer()
                vehicleButton
                Spacer()
                fruitsButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    var drinksButton: some View {
        Button {
            emojiCount = drinks.count
            emojis = drinks.shuffled()
        } label: {
            VStack {
                Image(systemName: "drop.circle.fill")
                Text("Drinks")
                    .font(.headline)
            }
        }
    }

    var fruitsButton: some View {
        Button {
            emojiCount = fruits.count
            emojis = fruits.shuffled()
        } label: {
            VStack {
                Image(systemName: "leaf.circle.fill")
                Text("Fruits")
                    .font(.headline)
            }
        }
    }

    var vehicleButton: some View {
        Button {
            emojiCount = vehicles.count
            emojis = vehicles.shuffled()
        } label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles")
                    .font(.headline)
            }
        }
    }

}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
