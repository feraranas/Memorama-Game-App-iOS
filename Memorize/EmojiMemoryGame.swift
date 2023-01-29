//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fernando Arana on 27/01/23.
//  VIEW MODEL

// import Foundation
import SwiftUI

// Notes:
// ViewModels can create their own model. Which is what we're doing here.
// ViewModels are gatekeeper's for the model. They work as access control.
// On classes you can't have var's without initializers.
// We're using Type Variable & Type Function as if they were globals.

class EmojiMemoryGame {
    
    static let emojis = ["👽", "😵‍💫", "💩", "🤡", "💝", "🧲", "🛡", "🪤", "🚖", "🛹", "🧄", "🥩", "🍏", "💦", "🌊", "🌳",
                  "🏢", "🎁", "📭", "🤓", "🏧", "❎", "🔱", "🚼", "🚹", "🎺", "🎮", "🚑", "🤼‍♀️", "☀️", "🌺", "🍄"]
    
    // La función regresa tipo 'Modelo': MemoryGame<String>
    // La función le da 2 parámetros internos al init del modelo:
    // Un número que inicializa el número de cartas.
    // Una función que recibe un entero y regresa un String
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // Esta variable se inicializa cuando llamamos a EmojiMemoryGame desde Content View
    // Declara el parámetro 'don't care' del Modelo como <String>
    // Llama a la función createMemoryGame().
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
 
