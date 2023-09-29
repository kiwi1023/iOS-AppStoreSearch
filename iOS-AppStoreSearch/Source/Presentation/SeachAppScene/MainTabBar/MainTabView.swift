//
//  ContentView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = TabOption.search.rawValue
    private let defaultImageView = Image(uiImage: UIImage(systemName: "x.circle")!)
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(TabOption.allCases, id: \.self) { tab in
                if tab != .search {
                    setTabView(view: defaultImageView, for: tab)
                } else {
                    setTabView(view: SearchView(), for: tab)
                }
            }
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
    
    private func setTabView(view: some View, for tab: TabOption) -> some View {
        return view
            .multilineTextAlignment(.leading)
            .tabItem {
                SwiftUI.Image(systemName: tab.systemName)
                Text(tab.title)
            }
            .tag(tab.rawValue)
    }
}
