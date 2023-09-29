//
//  DownLoadButton.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct DownloadButton<Style>: View where Style : PrimitiveButtonStyle {
    let action: () -> Void
    let buttonStyle: Style

    init(
        _ style: Style = .bordered,
         _ action: @escaping () -> Void
    ) {
        self.action = action
        self.buttonStyle = style
    }
    
    var body: some View {
        Button(action: action) {
            Text("받기")
                .font(.subheadline.bold())
                .padding(.horizontal, 16)
        }
        .buttonBorderShape(.capsule)
        .buttonStyle(buttonStyle)
    }
}
