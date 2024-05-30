//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 30/05/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex)a"))
            cards.append(Card(content: content, id: "\(pairIndex)b"))
        }
        shuffle()
    }
    
    var firstIndex: Int?
    var secondIndex: Int?
    
     mutating func choose(card: Card) {
         if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
             if !cards[chosenIndex].isMatched && !cards[chosenIndex].isFaceUp {
                 cards[chosenIndex].isFaceUp = true
                 if let f = firstIndex {
                     if let s = secondIndex {
                         
                         if(cards[f].content == cards[s].content && f != s){
                             cards[f].isMatched = true
                             cards[s].isMatched = true
                         } else {
                             
                             cards[f].isFaceUp = false
                             cards[s].isFaceUp = false
                         }
                         firstIndex = chosenIndex
                         secondIndex = nil
                         
                     } else {
                         secondIndex = chosenIndex
                         
                     }
                 } else {
                     firstIndex = chosenIndex
                 }
             }
         }
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(content)"
        }
    }
    
}
