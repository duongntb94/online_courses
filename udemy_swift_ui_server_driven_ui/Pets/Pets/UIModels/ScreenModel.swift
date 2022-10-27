//
//  ScreenModel.swift
//  Pets
//
//  Created by Duong on 8/31/22.
//

import Foundation

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: Any]
    
    enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
}

enum ComponentError: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
    case textRow
    case ratingRow
}

extension ScreenModel {
    func buildComponents() throws -> [UIComponent] {
        var result = [UIComponent]()
        for component in components {
            switch component.type {
            case .featuredImage:
                guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                let uiView = FeaturedImageComponent(uiModel: uiModel)
                result.append(uiView)
            case .carousel:
                guard let uiModel: CarouselUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                let uiView = CarouselComponent(uiModel: uiModel)
                result.append(uiView)
            case .textRow:
                guard let uiModel: TextUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                let uiView = TextComponent(uiModel: uiModel)
                result.append(uiView)
            case .ratingRow:
                guard let uiModel: RatingUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                let uiView = RatingComponent(uiModel: uiModel)
                result.append(uiView)
            }
        }
        return result
    }
}
