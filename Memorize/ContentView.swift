//
//  ContentView.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🥎", "💛", "🔔",  "😡", "🦞", "🥎", "💛", "🔔","🥎", "💛", "🔔",  "😡", "🦞", "🥎", "💛", "🔔"  ]
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            cardCountAdjusters
            }.padding()
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.orange)
        }
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(
            action: { cardCount += offset },
            label: { Image(systemName: symbol ) }
        )
        .font(.largeTitle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjusters( by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        return cardCountAdjusters( by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }

}



struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true // variável opcional
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12) // constante
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
