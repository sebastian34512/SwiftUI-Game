//
//  LifePointView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 08.03.24.
//

import SwiftUI

struct LifePointView: View {
    @Binding var lifes: Int
    let totalLifes: Int = 3
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalLifes, id: \.self) { index in
                Image(systemName: index < lifes ? "heart.fill" : "heart")
                    .foregroundColor(index < lifes ? .red : .gray)
            }
        }
    }
}

#Preview {
    LifePointView(lifes: .constant(2))
}
