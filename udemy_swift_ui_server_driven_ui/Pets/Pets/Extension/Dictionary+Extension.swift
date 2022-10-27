//
//  Dictionary+Extension.swift
//  Pets
//
//  Created by Duong on 10/4/22.
//

import Foundation

extension Dictionary {
    func decode<T: Decodable>() -> T? {
        guard let result = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: result)
    }
}
