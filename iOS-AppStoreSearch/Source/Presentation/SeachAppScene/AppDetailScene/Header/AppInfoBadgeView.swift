//
//  AppInfoBadgeView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppInfoBadgeView: View {
    var result: AppInfo
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ContentBadge(
                    header: result.userRatingCount.getUserRatingCountText(),
                    content: {
                        StarRatingView(rating: result.averageUserRating)
                    },
                    footer: result.averageUserRating.getAverageUserRatingText()
                )
                Divider().padding(.vertical)
                
                TextBadge(
                    header: "연령",
                    bodyText: result.contentAdvisoryRating,
                    footer: "세"
                )
                Divider().padding(.vertical)
                
                ContentBadge(
                    header: "개발자",
                    content: {
                        Image(systemName: "person.crop.square")
                            .font(.title2)
                            .fontWeight(.bold)
                    },
                    footer: result.artistName
                )
                Divider().padding(.vertical)
                
                TextBadge(
                    header: "언어",
                    bodyText: result.mainLanguage,
                    footer: result.mainLanguageDescription
                )
            }
            .frame(height: 100, alignment: .center)
        }
    }
}

struct TextBadge: View {
    private let header: String
    private let bodyText: String
    private let footer: String
    
    private let minWidth: CGFloat = 100
    private let maxWidth: CGFloat = 105
    
    init(
        header: String,
        bodyText: String,
        footer: String
    ) {
        self.header = header
        self.bodyText = bodyText
        self.footer = footer
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(header)
                .font(.caption)
            Text(bodyText)
                .font(.system(.title3,
                              design: .rounded,
                              weight: .bold))
            Text(footer)
                .font(.caption)
        }
        .frame(minWidth: minWidth, maxWidth: maxWidth)
        .foregroundColor(.secondary)
    }
}

struct ContentBadge<Content: View>: View {
    private let header: String
    private let content: () -> Content
    private let footer: String
    
    private let minWidth: CGFloat = 100
    private let maxWidth: CGFloat = 105
    
    init(
        header: String,
        @ViewBuilder content: @escaping () -> Content,
        footer: String
    ) {
        self.header = header
        self.content = content
        self.footer = footer
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(header)
                .font(.caption)
            
            content()
                .previewLayout(.sizeThatFits)
                .frame(width: 80)
            Text(footer)
                .font(.caption)
        }
        .frame(minWidth: 100, maxWidth: 105)
        .foregroundColor(.secondary)
    }
}

