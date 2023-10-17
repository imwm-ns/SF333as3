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
    let pets = ["🐶", "🐹", "🐔", "🐠", "🐩", "🐿️"].shuffled() + ["🐶", "🐹", "🐔", "🐠", "🐩", "🐿️"].shuffled()
    
    let flowers = ["🌺", "🌹", "🌻", "🌸","🪷"].shuffled() + ["🌺", "🌹", "🌻", "🌸","🪷"].shuffled()
    
    let weather = ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️"].shuffled() + ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️"].shuffled()
    
    @State var cardCount = 12
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: pets[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            Spacer()
            petsTheme
            Spacer()
            flowersTheme
            Spacer()
            weatherTheme
            Spacer()
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
        .disabled(cardCount + offset < 1 || cardCount + offset > pets.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var petsTheme: some View {
        VStack {
            cardCountAdjuster(by: 1, symbol: "pawprint.fill")
                .foregroundColor(.brown)
                Text("PETS")
                .font(.headline)
            }
    }
    
    var flowersTheme: some View {
        VStack {
                cardCountAdjuster(by: 1, symbol: "camera.macro")
                .foregroundColor(.pink)
                Text("FLOWERS")
                    .font(.headline)
            }
    }
    
    var weatherTheme: some View {
        VStack {
                cardCountAdjuster(by: 1, symbol: "cloud.sun.fill")
                .foregroundColor(.blue)
                Text("WEATHER")
                    .font(.headline)
            }
    }
    
    
    
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
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
