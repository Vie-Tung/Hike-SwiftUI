//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Tung Viet on 24/10/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    
    @State private var ramdomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - Functions
    
    // 1.Ramdom coordinate
    func ramdomCoordimate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2.Ramdom Size
    func ramdomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    // 3.Ramdom scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4.Ramdom speed
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // 5.Ramdom delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...ramdomCircle, id: \.self) { item in                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: ramdomSize())
                    .position(
                        x: ramdomCoordimate(),
                        y: ramdomCoordimate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation (
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
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

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
            MotionAnimationView()
                .background(
                Circle()
                    .fill(.teal)
        )
    }
}
