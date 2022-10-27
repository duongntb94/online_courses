//
//  LocalService.swift
//  Pets
//
//  Created by Duong on 10/5/22.
//

import Foundation

class LocalService: NetworkService {
    func load(_ resourceName: String) async throws -> ScreenModel {
        guard let path = Bundle.main.url(forResource: resourceName, withExtension: "json") else {
            fatalError("Resource not found")
        }
        let resource = try Data(contentsOf: path)
        return try JSONDecoder().decode(ScreenModel.self, from: resource)
    }
}
