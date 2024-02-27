//
//  OnboardingCardView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 26.02.24.
//

import SwiftUI

struct OnboardingCardView: View {
    var item: OnboardingItem
    
    @AppStorage("isDoneOnboarding") var isDoneOnboading: Bool?
    @State private var isDoneAnimating: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300, alignment: .center)
                    .padding(40)
                    .scaleEffect(isDoneAnimating ? 1.0 : 0.6)
                Text(item.headline)
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text(item.description)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 480)
                if item.headline == "Spinnlein" {
                    Button {
                        isDoneOnboading = true
                    } label: {
                        Text("Spielen")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .tint(Color.mint)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(minWidth: 128)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(lineWidth: 1.75)
                                    .foregroundColor(Color.mint)
                            )
                    }
                }
                Spacer()
            } // MARK: VStack End
        } // MARK: ZStack End
        .onAppear{
            withAnimation(.easeInOut(duration: 0.5)) {
                isDoneAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(RadialGradient(colors: [Color.backgroundLight, Color.backgroundDark], center: .topTrailing, startRadius: 50, endRadius: 500))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

#Preview {
    OnboardingCardView(item: onboardingData[8])
}
