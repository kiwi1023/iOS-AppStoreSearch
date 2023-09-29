//
//  AppDetailView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppDetailView: View {
    var result: AppInfo
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack() {
                AppDetailHeaderView(result: result)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
