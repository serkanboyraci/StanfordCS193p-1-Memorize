//
//  MemorizeGame.swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.02.2025.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
