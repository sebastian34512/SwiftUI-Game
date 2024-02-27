//
//  GameViewModel.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var points: Int = 0
    @Published var time: Int = 30
    @Published var gameItems: [GameItemView] = [GameItemView(), GameItemView(), GameItemView()]
    @Published var isGameRunning: Bool = true
    //Modales Fenster
    @Published var lives: Int = 3
    @Published var itemSpeed: CGFloat = 20
}
