//
//  AppSearchViewModelTest.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import XCTest
@testable import iOS_AppStoreSearch

final class AppSearchViewModelTest: XCTestCase {
    var networkManager: StubNetworkManager!
    var networkService: StubAppSearchService!
    var localStorageService: StubSearchHistoryService!
    var viewModel: StubViewModel!
    
    override func setUp() {
        super.setUp()
        reset()
    }
    
    func reset() {
        networkManager = StubNetworkManager(isSuccess: true)
        networkService = StubAppSearchService(networkManager: networkManager)
        localStorageService = StubSearchHistoryService()
        viewModel = StubViewModel(historyService: localStorageService,
                                  searchService: networkService)
    }
    
    func test_onAppear_Action_입력() {
        //when
        viewModel.action(.onAppear)
        
        // then
        XCTAssertEqual(viewModel.actionExcutions.count, 1)
        XCTAssertTrue({
            guard case .onAppear = viewModel.actionExcutions[0].0 else { return false }
            return true
        }())
    }
    
    func test_search_Action을_입력_및_최근_검색어_확인() {
        // given
        localStorageService.histories = ["휴레이", "포지티브", "하이디"]
        let history = "휴레이포지티브"
        
        //when
        viewModel.action(.search(history))
        
        //then
        XCTAssertEqual(viewModel.actionExcutions.count, 1)
        XCTAssertEqual(viewModel.histories.first, history)
    }
    
    func test_search_Action을_입력하면_NetworkMethod_호출확인() {
        //given
        let searchText = "휴레이포지티브"
        
        //when
        viewModel.action(.search(searchText))
        
        //then
        XCTAssertEqual(viewModel.actionExcutions.count, 1)
        XCTAssertEqual(networkService.getAppInfoDataExcutions[0].0, searchText)
    }
    
    func test_updateSuggestions_Action을_입력_및_Suggestions_확인() {
        // given
        viewModel.histories = ["휴레이포지티브", "휴레이", "포지티브", "하이디"]
        let text = "휴레이"
        
        //when
        viewModel.action(.updateSuggestions(text))
        
        //then
        XCTAssertEqual(viewModel.actionExcutions.count, 1)
        XCTAssertEqual(viewModel.suggestions, ["휴레이포지티브", "휴레이"])
    }
    
    func test_deleteHistory_Action을_입력_및_Histories_확인() {
        // given
        localStorageService.histories = ["휴레이포지티브", "휴레이", "포지티브", "하이디"]
        let index = IndexSet(integer: 0)
        
        //when
        viewModel.action(.deleteHistory(index))
        
        //then
        XCTAssertEqual(viewModel.actionExcutions.count, 1)
        XCTAssertEqual(viewModel.histories, ["휴레이", "포지티브", "하이디"])
    }
}

