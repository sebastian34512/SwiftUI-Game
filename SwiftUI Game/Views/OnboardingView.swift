//
//  OnboardingView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 26.02.24.
//

import SwiftUI

struct OnboardingView: View {
    
    let items: [OnboardingItem] = onboardingData
    var body: some View {
        TabView {
            ForEach(items) { item in
                OnboardingCardView(item: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    OnboardingView()
}
