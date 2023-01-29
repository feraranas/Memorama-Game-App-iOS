//
//  ContentView.swift
//  Memorize
//
//  Created by Fernando Arana on 16/01/23.
//

import SwiftUI

struct ContentView: View {

    // We are accesing the ViewModel from the view.
    // A view is an agent to what's in the model.
    // And because, the ViewModel has access to the model,
    // ContentView (the view) recieves ViewModel as parameter
    let viewModel: EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.all)
        }
}

// Notes:
// when you build a view just pass it the minimum in needs to work with.
// the only reason you build 'vars' is when you have @state, which is not very often.
struct CardView: View {
    
    // Card is the 'unit'.
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 25)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                
                shape.strokeBorder(style: StrokeStyle(lineWidth: 3))
                
                Text(card.content).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            } else {
                shape.fill(.red)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            
    }
}
