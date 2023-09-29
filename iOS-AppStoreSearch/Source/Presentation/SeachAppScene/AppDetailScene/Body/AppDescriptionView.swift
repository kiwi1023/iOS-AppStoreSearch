//
//  AppDescriptionView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct AppDescriptionView: View {
    let result: AppInfo
    
    var body: some View {
        VStack {
            ExpandableTextView(text: result.description)
                .padding(.bottom)
            Divider().padding(.vertical)
            developerInfoView
            Divider().padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    private var developerInfoView: some View {
        Button {
            
        } label: {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(result.artistName)
                        .foregroundColor(.blue)
                    Text("개발자")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 14))
        }
    }
}
