//
//  CarouselUIModel.swift
//  Pets
//
//  Created by Duong on 10/18/22.
//

import Foundation

struct CarouselItemUIModel: Decodable, Identifiable {
    let id = UUID()
    let petId: Int
    let imageUrl: URL
    
    enum CodingKeys: CodingKey {
        case petId
        case imageUrl
    }
}

struct CarouselUIModel: Decodable {
    let items: [CarouselItemUIModel]
    let action: Action
}
