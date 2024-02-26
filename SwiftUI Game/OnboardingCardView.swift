//
//  OnboardingCardView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 26.02.24.
//

import SwiftUI

struct OnboardingCardView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("TextEffect")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300, alignment: .center)
                    .padding(.top, 40)
                    .padding(.horizontal, 40)
                Text("SwiftUI Game")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("Herzlich willkommen zum SwiftUI Game, welches Teil eines Online Kurses zum erlernen von SwiftUI & Combine ist.")
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 480)
                Spacer()
            } // MARK: VStack End
        } // MARK: ZStack End
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.background)
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
        
    }
}

#Preview {
    OnboardingCardView()
}
