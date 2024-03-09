//
//  GameViewModel.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import Foundation
import Combine

enum GameItemType: CaseIterable {
    case cola, lamp, waffle, walkieTalkie, badCoke, spider, demoFlower
    
    var points: Int {
        switch self {
        case .cola, .lamp, .waffle, .walkieTalkie:
            return 30
        case .badCoke, .spider, .demoFlower:
            return -90
        }
    }
        
    var width: CGFloat {
        switch self {
        case .cola, .badCoke:
            return 30
        case .lamp, .walkieTalkie, .spider:
            return 40
        case .waffle:
            return 50
        case .demoFlower:
            return 60
        }
    }
        
    var image: String {
        switch self {
        case .cola:
            return "cola"
        case .lamp:
            return "lamp"
        case .waffle:
            return "waffle"
        case .walkieTalkie:
            return "walkeTalke"
        case .badCoke:
            return "badCoke"
        case .spider:
            return "spider"
        case .demoFlower:
            return "demoFlower"
        }
    }
}

class GameViewModel: ObservableObject {
    @Published var points: Int = 0
    @Published var time: Int = 30
    @Published var gameItems: [GameItem] = []
    @Published var isGameRunning: Bool = true
    @Published var showingModal: Bool = false
    @Published var lifes: Int = 3
    @Published var itemSpeed: CGFloat = 20
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func startGame() {
        // Timer speed
        
        // Timer creates items & countdown
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [self] _ in
                let randomType = GameItemType.allCases.randomElement()!
                // new game item
                let newItem = self.createGameItem(type: randomType)
                gameItems.append(newItem)
                
                //decrease counter
                self.time -= 1
                if self.time <= 0 {
                    self.gameOver()
                }
            }
            .store(in: &cancellableSet)
    }
    
    func restartGame() {
        points = 0
        time = 30
        lifes = 3
        showingModal = false
        itemSpeed = 20
        isGameRunning = true
        startGame()
    }
    
    func gameOver() {
        gameItems.removeAll()
        cancellableSet.removeAll()
        showingModal = true
    }
    
    func gravity(item: GameItem) {
        guard let itemIndex = gameItems.firstIndex(where: {$0.id == item.id}) else {
            return
        }
        
        gameItems[itemIndex].posY += 20
    }
    
    func collisionDetection(locX: Float, locY: Float) {
        for item in gameItems {
            if abs(Float(item.posX) - locX) < (25 + 50) && abs(Float(item.posY) - locY) < (25 + 10) {
                if item.points < 0 { // böses item
                    lifes -= 1
                    if lifes <= 0 {
                        gameOver()
                    }
                } else {
                    points += item.points
                }
                removeGameItem(item: item)
                break
            }
        }
    }
    
    func createGameItem(type: GameItemType) -> GameItem {
        return GameItem(points: type.points, width: type.width, image: type.image)
    }
    
    func removeGameItem(item: GameItem) {
        guard let itemIndex = gameItems.firstIndex(where: {$0.id == item.id}) else {
            return
        }
        
        gameItems.remove(at: itemIndex)
    }
}
