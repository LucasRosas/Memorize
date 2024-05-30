//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 30/05/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content))
            cards.append(Card( content: content))

        }
    }
    
    func choose(card: Card) {
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
    
}
