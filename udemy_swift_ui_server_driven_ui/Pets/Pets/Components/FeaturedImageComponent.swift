//
//  FeaturedImageComponent.swift
//  Pets
//
//  Created by Duong on 9/1/22.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    let uiModel: FeaturedImageUIModel
    
    var uniqueId = UUID()
    
    func render() -> AnyView {
        AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .frame(width: 200, height: 200)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
     
    
}
