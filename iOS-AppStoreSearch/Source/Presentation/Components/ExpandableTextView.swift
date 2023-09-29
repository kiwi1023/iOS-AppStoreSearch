//
//  ExpandableTextView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct ExpandableTextView: View {
    @State private var isExpanded: Bool = false
    @State private var isTruncated: Bool = false
    
    let text: String
    private let lineLimit: Int = 3
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 16))
                .lineLimit(isExpanded ? nil : lineLimit)
                .background {
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            determineTruncation(geometry)
                        }
                    }
                }
            Spacer()
        }
        .overlay(alignment: .bottomTrailing) {
            if isTruncated && !isExpanded {
                Button(action: {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                }) {
                    Text("더 보기")
                        .font(.system(size: 16))
                        .background(
                            Color(uiColor: UIColor.systemBackground)
                        )
                }
            }
        }
    }
    
    private func determineTruncation(_ geometry: GeometryProxy) {
        let textSize = text.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 16)],
            context: nil
        )
        
        isTruncated = textSize.size.height > geometry.size.height
    }
}
