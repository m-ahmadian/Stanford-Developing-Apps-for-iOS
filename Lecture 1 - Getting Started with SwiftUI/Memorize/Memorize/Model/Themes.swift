//
//  Themes.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-03-01.
//

import Foundation

enum Themes {
    case vehicles
    case drinks
    case fruits
    case foods
    case sports
    case instruments

    var emojis: Array<String> {
        switch self {
        case .vehicles:
            return ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
        case .drinks:
            return  ["🍵","☕️","🥛","🧃","🍼","🥤","🧋","🫖","🧊","🍸","🍻","🍹"]
        case .fruits:
            return ["🍎","🍓","🍊","🍇","🍉","🥑","🫐","🥥","🥝"]
        case .foods:
            return ["🍔", "🌭", "🌮", "🌯", "🥙", "🥗", "🥪", "🍕", "🍛", "🍲"]
        case .sports:
            return ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉"]
        case .instruments:
            return ["🎸", "🥁", "🎹", "🎺", "🎻", "📯", "🎷", "🪕"]
        }
    }

    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: Themes.vehicles.emojis,
            numberOfPairsOfCards: 5,
            color: "red"
        ),
        Theme(
            name: "Drinks",
            emojis: Themes.drinks.emojis,
            numberOfPairsOfCards: 8,
            color: "blue"
        ),
        Theme(
            name: "Fruits",
            emojis: Themes.fruits.emojis,
            numberOfPairsOfCards: 7,
            color: "green"
        ),
        Theme(
            name: "Foods",
            emojis: Themes.foods.emojis,
            numberOfPairsOfCards: 8,
            color: "yellow"
        ),
        Theme(
            name: "Sports",
            emojis: Themes.sports.emojis,
            numberOfPairsOfCards: 4,
            color: "orange"
        ),
        Theme(
            name: "Instruments",
            emojis: Themes.instruments.emojis,
            numberOfPairsOfCards: 6,
            color: "purple"
        )
    ]
}
