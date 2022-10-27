//
//  UIComponent.swift
//  Pets
//
//  Created by Duong on 9/1/22.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var uniqueId: UUID { get }
    func render() -> AnyView
}
