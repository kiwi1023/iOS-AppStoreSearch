//
//  SearchStateView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct SearchStateView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        switch viewModel.searchState {
        case .defualt:
            recentSearchList
        case .success:
            AppListView(results: viewModel.results)
        case .loading:
            ProgressView().progressViewStyle(.circular)
        case .emptyData:
            emptyStateView
        }
    }
    
    private var recentSearchList: some View {
        Section {
            List {
                ForEach(viewModel.histories, id: \.self) { data in
                    Button {
                        viewModel.action(.search(data))
                    } label: {
                        Text(data)
                            .foregroundColor(.blue)
                            .font(.title3)
                    }
                }
                .onDelete { indexSet in
                    viewModel.action(.deleteHistory(indexSet))
                }
            }
            .listStyle(.plain)
        } header: {
            recentSearchTitle
        }
    }
    
    private var recentSearchTitle: some View {
        Text("최근 검색어")
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top)
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 10) {
            Text("결과 없음")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
            
            Text("'\(viewModel.searchText)'")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

