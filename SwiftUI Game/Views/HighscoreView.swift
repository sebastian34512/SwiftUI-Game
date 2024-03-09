//
//  HighscoreView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 08.03.24.
//

import SwiftUI

struct HighscoreView: View {
    @ObservedObject var viewModel = HighscoresViewModel()
    var body: some View {
        List(viewModel.highscores) { highscore in
            VStack(alignment: .leading) {
                Text(highscore.name)
                    .fontWeight(.bold)
                Text("Punkte: \(highscore.score)")
            }
        }
        .onAppear {
            viewModel.loadHighscores()
        }
    }
}

#Preview {
    HighscoreView()
}
