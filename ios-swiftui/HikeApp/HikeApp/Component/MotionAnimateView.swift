//
//  MotionAnimateView.swift
//  HikeApp
//
//  Created by Duong on 10/20/23.
//

import SwiftUI

struct MotionAnimateView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating = false
    
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.2...2.0))
    }
    
    func randomSpeed() -> CGFloat {
        return CGFloat(Double.random(in: 0.5...1.0))
    }
    
    func randomDelay() -> Double {
        return .random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .frame(width: randomSize())
                    .opacity(0.25)
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimateView()
        .background(.teal)
}
