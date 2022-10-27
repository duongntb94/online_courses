//
//  Navigator.swift
//  Pets
//
//  Created by Duong on 10/19/22.
//

import Foundation
import SwiftUI

struct SheetView<V: View>: View {
    @State private var isPresented: Bool = false
    let content: () -> V
    let destinationView: AnyView
    
    var body: some View {
        content().onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented) {
            destinationView
        }
    }
}

class Navigator {
    static func perform<V: View>(action: Action, payload: Any?, content: @escaping () -> V) -> AnyView {
        var destinationView: AnyView!
        
        switch action.destination {
        case .petDetail:
            if let payload = payload as? CarouselItemUIModel {
                destinationView = PetDetailsScreen(petId: payload.petId).toAnyView()
            } else {
                destinationView = EmptyView().toAnyView()
            }
        }
        
        switch action.type {
        case .sheet:
            return SheetView(content: {
                content()
            }, destinationView: destinationView).toAnyView()
        }
    }
}
