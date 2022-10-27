//
//  Constants.swift
//  Pets
//
//  Created by Duong on 8/30/22.
//

import Foundation

struct Constants {
    struct ScreenResources {
        static let baseUrl = "localhost"
        static let baseUrlPort = 8080
        static let petListing = "pet-listing"
        
        static func petDetail(petId: Int) -> String {
            return "pet-details/\(petId)"
        }
        
        static func resource(for resourceName: String) -> URL? {
            var components = URLComponents()
            components.scheme = "http"
            components.host = baseUrl
            components.port = baseUrlPort
            components.path = "/\(resourceName)"
            return components.url
        }
    }
}
