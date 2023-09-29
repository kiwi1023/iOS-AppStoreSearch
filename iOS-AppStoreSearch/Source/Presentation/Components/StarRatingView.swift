//
//  StarRatingView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<5) { index in
                RatingStar(
                    rating: Decimal(CGFloat(rating)),
                           color: .gray,
                           index: index
                )
            }
        }
    }
}

struct RatingStar: View {
    var rating: CGFloat
    var color: Color
    var index: Int
    
    init(rating: Decimal, color: Color, index: Int) {
        self.rating = CGFloat(Double(rating.description) ?? 0)
        self.color = color
        self.index = index
    }
    
    var maskRatio: CGFloat {
        let mask = rating - CGFloat(index)
        return (1...).contains(mask) ? 1 : (0..<0).contains(mask) ? 0 : mask
    }
    
    var body: some View {
        HStack(spacing: 1) {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .foregroundColor(.secondary)
        }
        .overlay {
            GeometryReader { star in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(color)
                    .mask(
                        Rectangle()
                            .size(
                                width: star.size.width * maskRatio,
                                height: star.size.height
                            )
                    )
            }
        }
    }
}
