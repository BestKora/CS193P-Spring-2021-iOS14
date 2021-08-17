//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by CS193P Instructor on 03/29/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️","🛸","🛶","🚌","🏍","🛺","🚡","🛵","🚗","🚚","🚇","🚙","🚈"]
    
    private static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame<String> (numberOfPairsOfCards: 6){ pairIndex in
            emojis [pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame ()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    func choose (_ card: Card) {
        model.choose(card)
    }
}














struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
