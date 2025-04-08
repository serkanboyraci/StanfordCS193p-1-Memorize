//
//  MemorizeGame.swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.02.2025.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card] // looking allowed and setting is private // bir sey bilmiyorsan private yap.
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) { //cardCOntentfactory is funtions as types
        cards = [] //Array<Card>()=[Card]()=[]
        // add numberOfPArisOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) { // max 2 yi ekledik 2 nin altina dusmesin diye
            let content : CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content)) //cards.append(Card(isFaceUp: false, isMatched: false, content:CardContent))
            cards.append(Card(content: content))
        }
        
        
    }
    
    func choose(_ card: Card) {
         
    }
    
    struct Card {
        var isFaceUp: Bool = true // initialize false yapinca yukarda daha kisa yazabildik.
        var isMatched: Bool = false
        let content: CardContent // contenin degismesine ihtiyac yoktur.
    }
    
}
