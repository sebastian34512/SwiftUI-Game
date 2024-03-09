//
//  CatcherView.swift
//  SwiftUI Game
//
//  Created by Sebastian Koller on 08.03.24.
//

import SwiftUI

struct CatcherView: View {
    var body: some View {
        Image("backpack")
            .resizable()
            .scaledToFit()
            .frame(height: 120)
    }
}

#Preview {
    CatcherView()
}
