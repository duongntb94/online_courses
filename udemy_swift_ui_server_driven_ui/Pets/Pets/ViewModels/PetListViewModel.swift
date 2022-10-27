//
//  PetListViewModel.swift
//  Pets
//
//  Created by Duong on 10/4/22.
//

import SwiftUI

@MainActor
class PestListViewModel: ObservableObject {
    
    private let service: NetworkService
    
    @Published
    public var components = [UIComponent]()
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() async {
        do {
            let data = try await service.load(Constants.ScreenResources.petListing)
            components = try data.buildComponents()
        } catch {
            print(error)
        }
    }
}
