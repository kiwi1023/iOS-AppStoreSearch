//
//  ReleaseNoteView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct ReleaseNoteView: View {
    var result: AppInfo
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .firstTextBaseline) {
                Text("새로운 기능")
                    .font(.title2.bold())
                Spacer()
                
                Button {
                    
                } label: {
                    Text("버전 기록")
                }
            }
            
            HStack {
                Text("버전 \(result.version)")
                Spacer()
                Text(result.currentReleaseDate.getPastDayText())
            }
            .font(.callout)
            .foregroundColor(.secondary)
        
            ExpandableTextView(text: result.releaseNotes ?? "")
            
            Divider().padding(.vertical)
        }
        .padding(.horizontal, 16)
    }
}
