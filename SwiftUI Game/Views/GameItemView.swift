//
//  GameItemView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import SwiftUI

struct GameItemView: View {
    
    @ObservedObject var viewModel = GameItemViewModel()
    
    let posX: CGFloat = CGFloat.random(in: 1...400)
    var posY: CGFloat = -100
    
    var body: some View {
        Image(viewModel.gameItem!.image)
            .resizable()
            .scaledToFit()
            .frame(width: viewModel.gameItem!.width)
        
        if viewModel.isCollided {
            // Kollision Erkennen
        }
    }
}

#Preview {
    GameItemView()
}
