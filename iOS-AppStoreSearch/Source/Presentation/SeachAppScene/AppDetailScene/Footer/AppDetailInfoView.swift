//
//  AppDetailInfoView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppDetailInfoView: View {
    var result: AppInfo
    
    var body: some View {
        VStack {
            Text("정보")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(AppDetailInfo.allCases, id: \.self) { info in
                InformationCell(info: info, result: result)
            }
        }
        .padding(.horizontal)
    }
}

struct InformationCell: View {
    private let info: AppDetailInfo
    private let result: AppInfo
    
    init(
        info: AppDetailInfo,
        result: AppInfo
    ) {
        self.info = info
        self.result = result
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(info.title)
                    .foregroundColor(.secondary)
                Spacer()
            
                Text(info.value(from: result))
            }
            Divider()
        }
        .font(.system(size: 14))
    }
}
