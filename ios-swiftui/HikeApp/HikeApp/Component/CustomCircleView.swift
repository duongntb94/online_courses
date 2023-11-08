//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Duong on 10/20/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.colorIndigoMedium, Color.colorSalmonLight],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .frame(width: 256, height: 256)
                .onAppear(perform: {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
            })
            MotionAnimateView()
        }
    }
}

#Preview {
    CustomCircleView()
}
