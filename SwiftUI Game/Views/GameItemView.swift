//
//  GameItemView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import SwiftUI

struct GameItemView: View {
    
    var gameItem: GameItem
    
    var body: some View {
        Image(gameItem.image)
            .resizable()
            .scaledToFit()
            .frame(width: gameItem.width)
        
        if gameItem.isCollided {
            // Kollision Erkennen
        }
    }
}

#Preview {
    GameItemView(gameItem: GameItem(points: 30, width: 30, image: "cola"))
}
