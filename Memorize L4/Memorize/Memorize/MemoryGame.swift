//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tatiana Kornilova on 31/05/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexSingleFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let indexChosen = cards.firstIndex(where: { $0.id == card.id }),
           !cards[indexChosen].isFaceUp,
           !cards[indexChosen].isMatched
        {
            if let indexToBeMatched = indexSingleFaceUpCard {
                if cards[indexChosen].content == cards[indexToBeMatched].content {
                    cards[indexChosen].isMatched = true
                    cards[indexToBeMatched].isMatched = true
                }
                indexSingleFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexSingleFaceUpCard = indexChosen
            }
            cards[indexChosen].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        // add numberOfPairOfCards * 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
