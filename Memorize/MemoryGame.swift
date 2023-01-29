//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fernando Arana on 27/01/23.
//  MODEL

import Foundation

// Keyword: 'where' helps us assign a parameter to a protocolp
struct MemoryGame<CardContent> where CardContent: Equatable {
    
    // Cards is the array of 'unit's.
    // we create a private(set) (only view by other classes & structs)
    // state which holds an array of 'unit's
    private(set) var cards: Array<MemoryGame.Card>
    
    // Var to hold the index of the first card pressed
    // Everytime we declare an Optional, we have a free init set to nil
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    
    // Keyword mutating in front of a function means that
    // it's available to change state of self. Remember: struct is immutable
    mutating func choose(_ card: MemoryGame.Card) {
        // Old code:
        // if let chosenIndex = index(of: card)
        
        // New version
        // Uses an Array built in function called 'firstIndex'
        // With $0 we are accessing the first parameter of the function, $1, $2, $3, ...
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    /*
    // This function works for the logic of the game.
    // It's called from the Model. Recieves a 'Card'.
    // Return the Index of the card in the array.
    func index(of card: MemoryGame.Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    */
    
    // We initialize the property array cards.
    // The parameters of the initializer are pased from the ViewModel.
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<MemoryGame.Card>()
        for i in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(i)
            cards.append(Card(content: content, id: i*2))
            cards.append(Card(content: content, id: i*2 + 1))
        }
    }
    
    // Card is the 'unit'.
    // Identifiable is a protocol.
    // This protocol stubs requires the struct to be hashable & equatable.
    // So we declare single var 'id' that is used to identify this struct
    // against any other struct.
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
