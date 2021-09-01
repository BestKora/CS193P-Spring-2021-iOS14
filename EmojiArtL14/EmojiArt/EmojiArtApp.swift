//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by CS193p Instructor on 4/26/21.
//  Copyright © 2021 Stanford University. All rights reserved.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    // L14 remove @StateObject var document: EmojiArtDocument
    @StateObject var paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        // L14 changed from WindowGroup to DocumentGroup
        // L14 newDocument: argument is closure which creates a new, blank document
        // L14 second closure creates a View for a new scene for a given ViewModel
        // Lar (which is loaded up out of a file with ReferenceFileDocument protocol)
        DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
            EmojiArtDocumentView(document: config.document)
                .environmentObject(paletteStore)
        }
    }
}
