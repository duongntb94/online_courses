//
//  RatingView.swift
//  Pets
//
//  Created by Duong on 10/26/22.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundColor(.orange)
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(2))
    }
}
