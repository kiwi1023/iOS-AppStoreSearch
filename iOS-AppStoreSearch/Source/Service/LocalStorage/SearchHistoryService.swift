//
//  SearchHistoryService.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation

protocol SearchHistoryServiceProtocol {
    var histories: [String] { get }
    
    func readHistories() -> [String]
    func createHistory(history: String)
    func deleteHistory(index: IndexSet)
}

final class SearchHistoryService: SearchHistoryServiceProtocol {
    @UserDefault(key: .historyKey, defaultValue: [])
    
    private(set) var histories: [String]
    private let limitCount: Int = 30
    
    func readHistories() -> [String] {
       return histories
    }
    
    func createHistory(history: String) {
        if histories.count >= limitCount {
            histories.removeLast(histories.count - limitCount + 1)
        }

        if histories.contains(history) {
            histories.removeAll { $0 == history }
        }

        histories.insert(history, at: 0)
    }
    
    func deleteHistory(index: IndexSet) {
        histories.remove(atOffsets: index)
    }
}
