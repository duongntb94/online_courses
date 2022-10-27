//
//  PetDetailsViewModel.swift
//  Pets
//
//  Created by Duong on 10/25/22.
//

import SwiftUI

@MainActor
class PetDetailsViewModel: ObservableObject {
    private let service: NetworkService
    
    @Published
    public var components = [UIComponent]()
    
    private let petId: Int
    
    init(service: NetworkService, petId: Int) {
        self.service = service
        self.petId = petId
    }
    
    func load() async {
        do {
            let data = try await service.load(Constants.ScreenResources.petDetail(petId: petId))
            components = try data.buildComponents()
        } catch {
            print(error)
        }
    }
}
