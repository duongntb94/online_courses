//
//  ControlImageView.swift
//  Pinch
//
//  Created by Duong on 1/31/24.
//

import SwiftUI

struct ControlImageView: View {
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 35))
    }
}

#Preview {
    ControlImageView(imageName: "minus.magnifyingglass")
        .previewLayout(.sizeThatFits)
}
