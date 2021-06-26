//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tatiana Kornilova on 31/05/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexSingleFaceUpCard: Int? {
        get { cards.indices.filter {cards[$0].isFaceUp}.single }
        set { cards.indices.forEach {cards[$0].isFaceUp = ($0 == newValue)} }
    }
    
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
                cards[indexChosen].isFaceUp = true
            } else {
                indexSingleFaceUpCard = indexChosen
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairOfCards * 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var single: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
