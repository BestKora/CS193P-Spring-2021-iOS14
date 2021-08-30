//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Tatiana Kornilova on 29/05/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
