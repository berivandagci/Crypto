//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by beri on 20.08.2026.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @State private var animate: Bool = false
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scaleEffect(animate ? 1.0 : 0.0) // .scale yerine .scaleEffect kullanılır
            .opacity(animate ? 0.0 : 1.0)   // Büyüdükçe kaybolması için Opacity de ekleyebiliriz
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView()
        .frame(width: 100, height: 100)
}
