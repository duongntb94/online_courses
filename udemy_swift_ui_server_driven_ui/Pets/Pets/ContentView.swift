//
//  ContentView.swift
//  Pets
//
//  Created by Duong on 8/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: PestListViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: PestListViewModel(service: WebService()))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.components, id: \.uniqueId) { component in
                    component.render()
                }
            }.task {
                await viewModel.load()
            }.navigationTitle("Pet home screens")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
