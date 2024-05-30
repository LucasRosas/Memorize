//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lucas Araújo Rosas on 29/05/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
