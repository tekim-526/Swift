//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kim TaeSoo on 2021/11/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static var emojis = ["🚁", "✈️", "🚗", "🚢", "🚝", "🚔", "🚀", "🛸", "🛶", "🎢", "🎠", "🛰"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            /*EmojiMemoryGame.*/emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = /*EmojiMemoryGame.*/createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
