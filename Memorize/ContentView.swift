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
    var body: some View {
        VStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(.orange)
                Text("🎃").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.orange)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
