//
//  ExpandableTextView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

private enum ExpandableTextViewConstants {
    // 텍스트 라인 제한 수
    static let lineLimit: Int = 3
    // 텍스트 폰트 크기
    static let textFontSize: CGFloat = 16
    // "더 보기" 버튼 텍스트
    static let moreButtonText: String = "더 보기"
}

struct ExpandableTextView: View {
    @State private var isExpanded: Bool = false
    @State private var isTextOverflowed: Bool = false
    
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: ExpandableTextViewConstants.textFontSize))
                .lineLimit(isExpanded ? nil : ExpandableTextViewConstants.lineLimit)
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
            if isTextOverflowed && !isExpanded {
                Button(action: {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                }) {
                    Text(ExpandableTextViewConstants.moreButtonText)
                        .font(.system(size: ExpandableTextViewConstants.textFontSize))
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
            attributes: [.font: UIFont.systemFont(ofSize: ExpandableTextViewConstants.textFontSize)],
            context: nil
        )
        isTextOverflowed = textSize.size.height > geometry.size.height
    }
}
