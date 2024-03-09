//
//  GameOverView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 08.03.24.
//

import SwiftUI

struct GameOverView: View {
    
    let score: Int
    var onRestart: () -> Void
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6))
            
            // MODAL
            VStack(spacing: 0) {
                // TITLE
                Text("GAME OVER")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("BackgroundLight"))
                    .foregroundColor(.gray)
                
                Spacer()
                
                // MESSAGE
                VStack(alignment: .center, spacing: 16) {
                    Image("TextEffect")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 100)
                    
                    Text("Bad luck! You lost. \nLet's play again!")
                        .font(.system(.body, design: .rounded))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .layoutPriority(1)
                    
                    Button(action: onRestart) {
                        Text("New Game".uppercased())
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .accentColor((Color("BackgroundLight")))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(minWidth: 128)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(lineWidth: 1.75)
                                    .foregroundColor(Color("BackgroundLight")))
                    }
                    
                }
                
                Spacer()
                
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
            .background(Color("BackgroundDark"))
            .cornerRadius(20)
            .shadow(color: .backgroundDark, radius: 6, x: 0, y: 8)
        }
    }
}

#Preview {
    GameOverView(score: 160, onRestart: {})
}
