//
//  View+Extension.swift
//  Pets
//
//  Created by Duong on 9/1/22.
//

import Foundation
import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
