//
//  AppScreenShotView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppScreenShotView: View {
    var result: AppInfo
    
    var body: some View {
        VStack {
            Text("미리보기")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScreenShotCarouselView(screenShotUrls: result.screenshotUrls)
            
            Divider().padding(.horizontal)
        }
    }
}

struct ScreenShotCarouselView: View {
    private let screenShotUrls: [URL]
    
    init(screenShotUrls: [URL]) {
        self.screenShotUrls = screenShotUrls
    }
    
    private let imageWidth: CGFloat = 250
    private let portraitImageSize = CGSize(width: 1, height: 2)
    private let imageSpacing: CGFloat = 16
    
    private var imageSize: CGSize {
        guard let size = screenShotUrls.first!.getScreenShotRatio() else {
            return portraitImageSize
        }
        return size
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: imageSpacing) {
            ForEach(0..<screenShotUrls.count, id: \.self) { index in
                ScreenShotImageView(url: screenShotUrls[index], size: imageSize)
                    .frame(width: imageWidth)
            }
        }
        .makeCarousel(
            items: screenShotUrls.count,
            itemWidth: imageWidth,
            spacing: imageSpacing
        )
    }
}

