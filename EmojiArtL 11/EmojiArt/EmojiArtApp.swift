//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Tatiana Kornilova on 04/09/2021.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    let paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
