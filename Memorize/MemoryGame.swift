//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 30/05/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
    
}
