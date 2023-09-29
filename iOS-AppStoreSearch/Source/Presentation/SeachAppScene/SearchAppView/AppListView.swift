//
//  AppListView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppListView: View {
    // MARK: - Properties
    
    let results: [AppInfo]
    @EnvironmentObject var viewModel: SearchViewModel
    
    // MARK: - Body
    
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
                AppIconView(url: result.artworkUrl60, iconWidth: 60)
                
                VStack(alignment: .leading, spacing: 4) {
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
            ForEach(prefixOfScreenShotUrls(), id: \.self) { url in
                ScreenShotImageView(url: url, size: url.getScreenShotRatio()!)
            }
        }
    }
    
    private func prefixOfScreenShotUrls() -> [URL] {
        guard let firstUrl = screenshotUrls.first else { return [] }
        
        if firstUrl.isVerticalImage() != true {
            return [firstUrl]
        }
        
        if screenshotUrls.count < 3 {
            return screenshotUrls
        }
        
        return Array(screenshotUrls.prefix(upTo: 3))
    }
    
    private var gridColumns: Array<GridItem> {
        let screenShotCount: Int = prefixOfScreenShotUrls().count
        
        return Array(
            repeating: .init(.flexible(), spacing: 8),
            count: screenShotCount == 1 ? 1 : 3
        )
    }
}
