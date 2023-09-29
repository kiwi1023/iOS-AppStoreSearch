//
//  ScreenShotImageView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct ScreenShotImageView: View {
    @StateObject private var manager = ImageLoadManager()
    
    private let url: URL?
    private let size: CGSize
    
    init(url: URL?, size: CGSize) {
        self.url = url
        self.size = size
    }
    
    var body: some View {
        screenShotImage
            .onAppear {
                manager.fetch(url: url)
            }
    }
    
    private var screenShotImage: some View {
        Group {
            if let image = manager.image {
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(8)
                    .aspectRatio(size, contentMode: .fit)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.thinMaterial)
                    .aspectRatio(size, contentMode: .fit)
                    .overlay { ProgressView() }
            }
        }
    }
}

