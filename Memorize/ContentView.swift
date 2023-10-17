//
//  ContentView.swift
//  Memorize
//
//  Created by
//      Narathip Jaroensuk 6410742412
//      Sittipak Srisawas 6410742032

import SwiftUI

struct ContentView: View {
    let petIcons = ["🐶", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"].shuffled() + ["🐶", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"].shuffled()

    let flowerIcons = ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"].shuffled() + ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"].shuffled()

    let weatherIcons = ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"].shuffled() + ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"].shuffled()
    @State var themeNumber = 1
    var body: some View {
        VStack {
            Text("Memorize!").foregroundStyle(Color.purple).font(.largeTitle).bold()
            ScrollView {
                if (themeNumber == 1) {
                    showCard(by: petIcons, color: .brown)
                }
                else if (themeNumber == 2) {
                    showCard(by: flowerIcons, color: .pink)
                }
                else {
                    showCard(by: weatherIcons, color: .blue)
                }
            }
            showBottomBars
        }
        .padding()
    }
    
    func showCard(by icon: [String], color: Color) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<icon.count, id: \.self) { index in
                    CardView(content: icon[index])
                        .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(color)
    }
    
    func showBottomBar (by number: Int , symbol: String, title: String) -> some View {
        VStack {
            Button(action: {
                themeNumber = number
            }, label: {
                Image(systemName: symbol)
            })
            Text(title)
        }
    }
    
    var showBottomBars: some View {
        HStack {
            pets
            Spacer()
            flowers
            Spacer()
            weathers
        }
        .padding([.horizontal, .vertical], 40)
        .imageScale(.large)
        .font(.headline)
    }
    
    var pets: some View {
        showBottomBar(by: 1 ,symbol: "pawprint.circle.fill", title: "Pets").foregroundColor(.brown)
    }
    
    var flowers: some View {
        showBottomBar(by: 2 ,symbol: "suit.heart.fill", title: "Flowers").foregroundColor(.pink)
    }
    
    var weathers: some View {
        showBottomBar(by: 3 ,symbol: "sun.horizon.circle.fill", title: "Weather").foregroundColor(.blue)
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
