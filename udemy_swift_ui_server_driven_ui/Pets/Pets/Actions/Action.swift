//
//  Action.swift
//  Pets
//
//  Created by Duong on 10/19/22.
//

import Foundation

enum ActionType: String, Decodable {
    case sheet
    case push
}

struct Action: Decodable {
    let type: ActionType
    let destination: Route
}
