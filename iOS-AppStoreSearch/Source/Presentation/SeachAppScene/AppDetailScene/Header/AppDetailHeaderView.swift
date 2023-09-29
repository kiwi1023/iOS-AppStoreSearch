//
//  AppDetailBodyView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppDetailHeaderView: View {
    var result: AppInfo
    
    var body: some View {
        HStack {
            AppIconView(url: result.artworkUrl100, iconWidth: 110)
            
            AppTitleView(result: result)
        }
        .padding(.horizontal)
        
        Divider().padding(.horizontal)
        
        AppInfoBadgeView(result: result)
        
        Divider().padding(.horizontal)
    }
}
