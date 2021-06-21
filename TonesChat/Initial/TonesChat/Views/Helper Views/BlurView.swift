//
//  BlurView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: .systemMaterial)
    }
}

extension View {
    func cardBackground() -> some View {
        self
            .multilineTextAlignment(.center)
            .font(.caption)
            .lineLimit(1)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(BlurView())
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
