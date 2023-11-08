//
//  GradientButton.swift
//  HikeApp
//
//  Created by Duong on 10/19/23.
//

import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal)
            .background {
                configuration.isPressed 
                ? LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom)
                : LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
            }
            .cornerRadius(40)
    }
}
