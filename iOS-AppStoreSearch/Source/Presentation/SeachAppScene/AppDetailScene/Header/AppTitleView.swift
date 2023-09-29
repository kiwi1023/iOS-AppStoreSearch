//
//  AppTitleView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppTitleView: View {
    var result: AppInfo
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(result.trackName)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(result.artistName)
                    .foregroundColor(.gray)
                    .font(.callout)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                DownloadButton(.borderedProminent) {}
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 22, height: 22)
                }
            }
        }
    }
}
