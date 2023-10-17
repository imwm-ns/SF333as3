//
//  ContentView.swift
//  Memorize
//
//  Created by 
//      Narathip Jaroensuk 6410742412
//      Sittipak Srisawas 6410742032
//      Wasawat Cheepsamut 6410742735

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "👻", "🕷️", "💀", "❄️", "🧙", "🙀", "👿", "😱", 
        "☠️", "🍭", "🎲"] + ["🎃", "👻", "🕷️", "💀", "❄️", "🧙", "🙀", "👿", "😱",
        "☠️", "🍭", "🎲"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            // emojis.indices == 0..<emojis.count
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .foregroundColor(.red)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
