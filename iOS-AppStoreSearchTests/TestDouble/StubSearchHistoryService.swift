//
//  StubSearchHistoryService.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation
@testable import iOS_AppStoreSearch

final class StubSearchHistoryService: SearchHistoryServiceProtocol {
    var histories: [String] = []
    let limitCount = 30
    
    func readHistories() -> [String] {
        histories
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
