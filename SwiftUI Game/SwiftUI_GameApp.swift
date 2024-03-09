//
//  SwiftUI_GameApp.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 26.02.24.
//

import SwiftUI

@main
struct SwiftUI_GameApp: App {
    
    @AppStorage("isDoneOnboarding") var isDoneOnboarding: Bool = false; // = false passiert nur wenn im Storage nix ist
    
    var body: some Scene {
        WindowGroup {
            if !isDoneOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
            
        }
    }
}
