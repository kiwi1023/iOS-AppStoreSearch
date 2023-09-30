//
//  AppScreenShotView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

private enum ScreenShotViewConstants {
    // "미리보기" 텍스트
    static let previewText = "미리보기"
    // 텍스트의 가로 여백
    static let previewTextHorizontalPadding: CGFloat = 16
    // 스크린샷 이미지의 가로 크기
    static let imageWidth: CGFloat = 250
    // 스크린샷 이미지의 세로 방향 비율
    static let portraitImageSize = CGSize(width: 1, height: 2)
    // 스크린샷 이미지의 간격
    static let imageSpacing: CGFloat = 16
}

struct AppScreenShotView: View {
    var result: AppInfo
    
    var body: some View {
        VStack {
            Text(ScreenShotViewConstants.previewText)
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
    
    private var imageSize: CGSize {
        guard let size = screenShotUrls.first!.getScreenShotRatio() else {
            return ScreenShotViewConstants.portraitImageSize
        }
        return size
    }
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: ScreenShotViewConstants.imageSpacing
        ) {
            ForEach(0..<screenShotUrls.count, id: \.self) { index in
                ScreenShotImageView(url: screenShotUrls[index], size: imageSize)
                    .frame(width: ScreenShotViewConstants.imageWidth)
            }
        }
        .makeCarousel(
            items: screenShotUrls.count,
            itemWidth: ScreenShotViewConstants.imageWidth,
            spacing: ScreenShotViewConstants.imageSpacing
        )
    }
}
