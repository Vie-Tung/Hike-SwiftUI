//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Tung Viet on 24/10/2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement
                 // Condition ? A : B
                configuration.isPressed ?
                //A: When user pressed the button
                LinearGradient(colors: [.customGrayMedium,
                                        .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                // B: When button is not pressed
                LinearGradient(colors: [.customGrayLight,
                                        .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
