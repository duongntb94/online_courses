//
//  NetworkService.swift
//  Pets
//
//  Created by Duong on 10/5/22.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidServerResponse
}

protocol NetworkService {
    func load(_ resourceName: String) async throws -> ScreenModel
}
