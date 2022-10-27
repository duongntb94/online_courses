//
//  RatingComponent.swift
//  Pets
//
//  Created by Duong on 10/26/22.
//

import SwiftUI

struct RatingComponent: UIComponent {
    let uiModel: RatingUIModel
    
    let uniqueId: UUID = UUID()
    
    func render() -> AnyView {
        RatingView(rating: .constant(uiModel.rating)).toAnyView()
    }
}
