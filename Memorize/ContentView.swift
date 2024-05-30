//
//  ContentView.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("⚾️").font(.largeTitle)
            }
        }else{
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.orange)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
