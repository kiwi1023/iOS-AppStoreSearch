//
//  AppIconView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI
import Combine

struct AppIconView: View {
    @StateObject private var manager = ImageLoadManager()
    
    private let url: URL?
    private let iconWidth: CGFloat
    private var iconRadius: CGFloat {
        iconWidth / 5
    }
    
    init(url: URL?, iconWidth: CGFloat) {
        self.url = url
        self.iconWidth = iconWidth
    }
    
    var body: some View {
        appIconImage
            .onAppear {
                manager.fetch(url: url)
            }
    }
    
    private var appIconImage: some View {
        Group {
            if let image = manager.image {
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(iconRadius)
                    .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                    .frame(width: iconWidth)
            } else {
                placeHolderImage
            }
        }
    }
    
    private var placeHolderImage: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.thinMaterial)
            .frame(width: iconWidth, height: iconWidth)
    }
}

