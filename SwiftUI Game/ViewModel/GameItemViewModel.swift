//
//  GameItemViewModel.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import Foundation

class GameItemViewModel: ObservableObject {
    @Published var isCollided: Bool = false
    var gameItem: GameItem?
    
    let itemOptions: [GameItem] = [
        GameItem(points: 30, width: 30, image: "cola"),
        GameItem(points: 35, width: 40, image: "lamp"),
        GameItem(points: 25, width: 50, image: "waffle"),
        GameItem(points: 40, width: 40, image: "walkieTalkie"),
        GameItem(points: -90, width: 30, image: "badCoke"),
        GameItem(points: -50, width: 60, image: "spider"),
        GameItem(points: -60, width: 60, image: "demoFlower")
    ]
    
    init() {
        self.gameItem = itemOptions.randomElement()
    }
}
