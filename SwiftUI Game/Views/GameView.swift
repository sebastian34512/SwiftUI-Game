//
//  GameView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 27.02.24.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var location = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height-50)
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                CatcherView()
                    .position(location)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                location.x = value.location.x
                            }
                    )
                
                Text("Punkte: \(viewModel.points)")
                    .position(x: geo.size.width - 50, y: geo.size.height/8)
                
                LifePointView(lifes: $viewModel.lifes)
                    .position(x: geo.size.width / 2, y: geo.size.height/8)
                    
                
                Text("Zeit: \(viewModel.time)")
                    .position(x: 50, y: geo.size.height/8)
                
                ForEach(viewModel.gameItems) { item in
                    GameItemView(gameItem: item)
                        .position(x: item.posX, y: item.posY)
                        .onReceive(self.timer) { _ in
                            withAnimation {
                                viewModel.gravity(item: item)
                                if item.posY > geo.size.height {
                                    viewModel.removeGameItem(item: item)
                                }
                            }
                        }
                }
            } //MARK: end zstack
            .onReceive(self.timer) { _ in
                withAnimation(.spring) {
                    viewModel.collisionDetection(locX: Float(location.x), locY: Float(location.y))
                }
            }
            .onAppear() {
                viewModel.startGame()
            }
            
            if $viewModel.showingModal.wrappedValue {
                GameOverView(score: viewModel.points) {
                    viewModel.restartGame()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GameView()
}
