//
//  SearchView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            SearchStateView()
                .environmentObject(viewModel)
                .navigationTitle("검색")
                .navigationDestination(for: AppInfo.self) { result in
                  AppDetailView(result: result)
                }
        }
        .searchable(
            text:
                Binding(
                    get: { viewModel.searchText },
                    set: { viewModel.action(.updateSuggestions($0))}
                ),
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "App Store"
        )
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(
                title:
                    Text("네트워크 오류"),
                message: Text("인터넷 연결을 확인하세요."),
                dismissButton: .default(
                    Text("확인"),
                    action: {
                        viewModel.action(.search(viewModel.searchText))
                    }
                )
            )
        }
        .onSubmit(of: .search) {
            viewModel.action(.search(viewModel.searchText))
        }
        .onAppear {
            viewModel.action(.onAppear)
        }
        .searchSuggestions {
            if viewModel.searchState == .defualt {
                suggestionView
            }
        }
        .animation(.easeInOut, value: viewModel.searchState)
    }
    
    private var suggestionView: some View {
        ForEach(viewModel.suggestions, id: \.self) { suggestion in
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                Text(suggestion)
            }
            .onTapGesture {
                viewModel.action(.search(suggestion))
            }
        }
        .listStyle(.plain)
    }
}
