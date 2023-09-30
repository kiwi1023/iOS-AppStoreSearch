//
//  SearchView.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

private enum SearchViewConstants {
    // 화면 타이틀
    static let title = "검색"
    // 네트워크 오류 관련 메시지
    static let networkErrorTitle = "네트워크 오류"
    static let networkErrorMessage = "인터넷 연결을 확인하세요."
    static let networkErrorButton = "확인"
    // 검색 프롬프트
    static let prompt = "App Store"
    // 검색 아이콘 이미지 이름
    static let searchIcon = "magnifyingglass"
    // 아이템 간격
    static let defaultItemSpacing: CGFloat = 8.0
    // 초기 인덱스
    static let defaultInitialIndex: Int = 0
}

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            SearchStateView()
                .environmentObject(viewModel)
                .navigationTitle(SearchViewConstants.title)
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
            prompt: SearchViewConstants.prompt
        )
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(
                title: Text(SearchViewConstants.networkErrorTitle),
                message: Text(SearchViewConstants.networkErrorMessage),
                dismissButton: .default(
                    Text(SearchViewConstants.networkErrorButton),
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
            HStack(spacing: SearchViewConstants.defaultItemSpacing) {
                Image(systemName: SearchViewConstants.searchIcon)
                    .padding(.trailing, SearchViewConstants.defaultItemSpacing)
                Text(suggestion)
            }
            .onTapGesture {
                viewModel.action(.search(suggestion))
            }
        }
        .listStyle(.plain)
    }
}
