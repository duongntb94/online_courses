//
//  WebServices.swift
//  Pets
//
//  Created by Duong on 8/30/22.
//

import Foundation

class WebService: NetworkService {
    func load(_ resource: String) async throws -> ScreenModel {
        guard let url = Constants.ScreenResources.resource(for: resource) else {
            throw NetworkError.invalidUrl
        }
        print(url)
        let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}
