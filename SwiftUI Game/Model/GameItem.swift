//
//  GameItem.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import Foundation

struct GameItem: Identifiable {
    var id = UUID()
    var isCollided: Bool = false
    var points: Int
    var width: CGFloat
    var image: String
    let posX: CGFloat = CGFloat.random(in: 1...400)
    var posY: CGFloat = -100
}
