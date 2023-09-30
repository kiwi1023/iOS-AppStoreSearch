//
//  AppListView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

private enum AppListViewConstants {
    // 그리드 열 간격
    static let gridColumnsSpacing: CGFloat = 8
    // 최대 스크린샷 수
    static let maxScreenshotsCount: Int = 3
    // 앱 아이콘 너비
    static let appIconWidth: CGFloat = 60
    // 스크린샷 뷰 간격
    static let screenshotViewSpacing: CGFloat = 4
    // 스크린샷 그리드 뷰 간격
    static let screenshotGridViewSpacing: CGFloat = 8
    // 리스트에 나올 스크린샷 이미지 갯수
    static let defaultScreenshotCount: Int = 3
}


struct AppListView: View {
    let results: [AppInfo]
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        List {
            ForEach(results) { result in
                VStack {
                    AppListViewHeaderView(result: result)
                }
                .overlay(
                    NavigationLink(value: result, label: {})
                        .opacity(0.0)
                )
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

struct AppListViewHeaderView: View {
    let result: AppInfo
    
    var body: some View {
        VStack {
            HStack {
                AppIconView(
                    url: result.artworkUrl60,
                    iconWidth: AppListViewConstants.appIconWidth
                )
                
                VStack(
                    alignment: .leading,
                    spacing: AppListViewConstants.screenshotViewSpacing
                ) {
                    Text(result.trackName)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text(result.firstGenre)
                        .font(.caption)
                        .foregroundColor(.gray.opacity(0.2))
                }
                
                Spacer()
                
                DownloadButton {}
            }
            
            ScreenShotGridView(screenshotUrls: result.screenshotUrls)
        }
    }
}

struct ScreenShotGridView: View {
    let screenshotUrls: [URL]
    
    var body: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(getDefaultScreenshotCount(), id: \.self) { url in
                ScreenShotImageView(
                    url: url,
                    size: url.getScreenShotRatio()!
                )
            }
        }
    }
    
    private func getDefaultScreenshotCount() -> [URL] {
        guard let firstUrl = screenshotUrls.first else { return [] }
        
        if firstUrl.isVerticalImage() != true {
            return [firstUrl]
        }
        
        if screenshotUrls.count < AppListViewConstants.defaultScreenshotCount {
            return screenshotUrls
        }
        
        return Array(screenshotUrls.prefix(upTo: AppListViewConstants.defaultScreenshotCount))
    }
    
    private var gridColumns: Array<GridItem> {
        let screenShotCount: Int = getDefaultScreenshotCount().count
        
        return Array(
            repeating: .init(
                .flexible(),
                spacing: AppListViewConstants.screenshotGridViewSpacing
            ),
            count: screenShotCount == 1 ? 1 : 3
        )
    }
}
