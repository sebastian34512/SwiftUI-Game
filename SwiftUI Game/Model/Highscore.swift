//
//  Highscore.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 08.03.24.
//

import Foundation

struct Highscore: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var score: Int
    
    enum CodingKeys: String, CodingKey {
        case name, score
    }
}

struct Highscores: Codable {
    var highscores: [Highscore]
}
