//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Fernando Arana on 16/01/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    // The ViewModel is going to be constantly changing. So because
    // classes are mutable, we define a constant. So 'game' is constant because of it.
    // but 'game' is a pointer. What it points to, it can change.
    // but the pointer itself doesn't change.
    // () is the free initializer that classes get by default.
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
