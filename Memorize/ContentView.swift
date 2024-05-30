//
//  ContentView.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🥎", "💛", "🔔", "😡", "🦞"]
    var body: some View {
        VStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .foregroundColor(.orange)
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false // variável opcional
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12) // constante
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                ZStack {
                    base.fill()
                }
            }
        }
        .padding()
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
