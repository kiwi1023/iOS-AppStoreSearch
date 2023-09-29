//
//  SearchViewModel.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI
import Combine

class SearchViewModel: ViewModelProtocol {
    typealias Action = SearchViewAction
    
    private let historyService: SearchHistoryServiceProtocol
    private let searchService: AppSearchDataServiceProtocol
    
    private var cancellable = Set<AnyCancellable>()
    @Published var searchState: SearchState = .defualt
    @Published var histories: [String] = []
    @Published var searchText: String = ""
    @Published var suggestions: [String] = []
    @Published var showingAlert: Bool = false
    @Published var results: [AppInfo] = []
    
    init(
        historyService:
        SearchHistoryServiceProtocol = SearchHistoryService(),
        searchService:
        AppSearchDataServiceProtocol = AppSearchDataService(
            networkManager: NetworkManager()
        )
    ) {
        self.historyService = historyService
        self.searchService = searchService
    }
    
    enum SearchViewAction {
        case onAppear
        case search(String)
        case updateSuggestions(String)
        case deleteHistory(IndexSet)
    }
    
    enum SearchState {
        case defualt
        case success
        case loading
        case emptyData
    }
    
    func action(_ input: SearchViewAction) {
        switch input {
        case .onAppear:
            getSearchHistoryData()
        case .search(let text):
            createSearchHistoryData(with: text)
            getAppInfoData(text: text)
            getSearchHistoryData()
        case .updateSuggestions(let searchText):
            filterHistoryData(text: searchText)
        case .deleteHistory(let index):
            deleteItems(at: index)
            getSearchHistoryData()
        }
    }
    
    private func filterHistoryData(text: String) {
        searchText = text
        searchState = .defualt
        suggestions = histories.filter {
            $0.contains(searchText)
        }
    }
    
    private func getSearchHistoryData() {
        self.histories = historyService.readHistories()
    }
    
    private func createSearchHistoryData(with history: String) {
        historyService.createHistory(history: history)
        searchText = history
        self.searchState = .loading
    }
    
    private func deleteItems(at indexSet: IndexSet) {
        historyService.deleteHistory(index: indexSet)
    }
    
    private func getAppInfoData(text: String, maxCount: Int = 20) {
        searchService.getAppInfoData(query: text, maxCount: maxCount)
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  completion in
                guard let self = self else { return }
                
                switch completion {
                case .failure(let error):
                    Logger.debug(error: error, message: "Network Error")
                    self.showingAlert = true
                case .finished:
                    break
                }
            } receiveValue: { [weak self] appInfoData in
                guard let self = self else { return }
                guard !appInfoData.isEmpty else {
                    self.searchState = .emptyData
                    return
                }
                
                self.results = appInfoData
                self.searchState = .success
            }.store(in: &cancellable)
    }
}

