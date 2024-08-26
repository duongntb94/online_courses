//
//  PageModel.swift
//  Pinch
//
//  Created by Duong on 1/31/24.
//

import Foundation

struct PageModel: Identifiable {
    let id: Int
    let imageName: String
    
    var thumbnailName: String {
        return "thumb-\(imageName)"
    }
}
