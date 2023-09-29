//
//  StubViewModel.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation
@testable import iOS_AppStoreSearch

final class StubViewModel: SearchViewModel {
    var actionExcutions: [(SearchViewModel.SearchViewAction, Void)] = []
    
    override func action(_ input: SearchViewModel.SearchViewAction) {
        actionExcutions.append((input, ()))
        super.action(input)
    }
}
