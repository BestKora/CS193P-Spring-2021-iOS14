//
//  MemorizeApp.swift
//  Memorize
//
//  Created by CS193P Instructor on 03/29/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
