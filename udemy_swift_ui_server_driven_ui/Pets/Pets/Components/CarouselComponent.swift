//
//  CarouselComponent.swift
//  Pets
//
//  Created by Duong on 10/18/22.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    let uiModel: CarouselUIModel
    
    var uniqueId = UUID()
    
    func render() -> AnyView {
        ScrollView(.horizontal) {
            HStack {
                ForEach(uiModel.items) { item in
                    Navigator.perform(action: uiModel.action, payload: item) {
                        AsyncImage(url: item.imageUrl) { image in
                            image.resizable()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }.toAnyView()
    }
}
