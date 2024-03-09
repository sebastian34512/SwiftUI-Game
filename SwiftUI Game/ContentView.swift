//
//  ContentView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 26.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    NavigationLink(destination: GameView()) {
                        Text("Spiel starten")
                    }
                    .fontWeight(.semibold)
                    .accentColor((Color.white))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(minWidth: 128)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(lineWidth: 1.75)
                            .foregroundColor(Color.white))
                    
                    NavigationLink(destination: HighscoreView()) {
                        Text("Highscores")
                    }
                    .fontWeight(.semibold)
                    .accentColor((Color.white))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(minWidth: 128)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(lineWidth: 1.75)
                            .foregroundColor(Color.white))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
