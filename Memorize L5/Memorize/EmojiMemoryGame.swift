//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tatiana Kornilova on 31/05/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    typealias Game = MemoryGame<String>
    private static func createMemoryGame() -> Game {
        Game(numberOfPairsOfCards: 9) {pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    typealias Card = Game.Card
    var cards: [Card] { model.cards }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
