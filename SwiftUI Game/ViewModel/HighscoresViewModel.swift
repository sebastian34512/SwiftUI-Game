//
//  HighscoresViewModel.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 08.03.24.
//

import Foundation
import Combine

class HighscoresViewModel: ObservableObject {
    @Published var highscores: [Highscore] = []
    
    private var cancellables =  Set<AnyCancellable>()
    
    func loadHighscores() {
        guard let url = URL(string: "https://www.markusmaurer.at/fhj/highscores.json") else {
            print("invalid Url")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: Highscores.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Fehler beim laden der Highscores: \(error)")
                }
            } receiveValue: { [weak self] decodeResponse in
                self?.highscores = decodeResponse.highscores
            }
            .store(in: &cancellables)
    }
}
