//
//  TextComponent.swift
//  Pets
//
//  Created by Duong on 10/26/22.
//

import SwiftUI

struct TextComponent: UIComponent {
    let uiModel: TextUIModel
    
    let uniqueId: UUID = UUID()
    
    func render() -> AnyView {
        Text(uiModel.text)
            .padding()
            .toAnyView()
    }
}
