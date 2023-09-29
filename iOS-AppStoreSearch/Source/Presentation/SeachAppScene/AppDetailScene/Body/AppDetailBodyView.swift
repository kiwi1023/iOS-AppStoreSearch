//
//  AppDetailBodyView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppDetailBodyView: View {
    var result: AppInfo
    
    var body: some View {
        ReleaseNoteView(result: result)
        AppScreenShotView(result: result)
        AppDescriptionView(result: result)
    }
}
