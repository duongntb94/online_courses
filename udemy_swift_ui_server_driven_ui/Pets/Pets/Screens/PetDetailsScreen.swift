//
//  PetDetailsScreen.swift
//  Pets
//
//  Created by Duong on 10/25/22.
//

import SwiftUI

struct PetDetailsScreen: View {
    
    @StateObject var viewModel: PetDetailsViewModel
    
    var petId: Int
    
    init(petId: Int) {
        self.petId = petId
        self._viewModel = StateObject(wrappedValue: PetDetailsViewModel(service: WebService(), petId: petId))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.components, id: \.uniqueId) { component in
                    component.render()
                }
            }.task {
                await viewModel.load()
            }.navigationTitle("Pet Details")
        }
    }
}

struct PetDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsScreen(petId: 1)
    }
}
