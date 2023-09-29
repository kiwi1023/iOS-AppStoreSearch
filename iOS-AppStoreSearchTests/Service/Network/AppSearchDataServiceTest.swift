//
//  AppSearchDataServiceTest.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import XCTest
import Combine
@testable import iOS_AppStoreSearch

final class AppSearchDataServiceTest: XCTestCase {
    var cancellable: AnyCancellable!
    var stubNetworkManager: StubNetworkManager!
    var stubService: StubAppSearchService!
    
    override func setUp() {
        super.setUp()
        reset()
    }
    
    override func tearDown() {
        super.tearDown()
        cancellable.cancel()
        cancellable = nil
    }
    
    func reset() {
        stubNetworkManager = StubNetworkManager(isSuccess: true)
        stubService = StubAppSearchService(networkManager: stubNetworkManager)
    }
    
    func test_stubService_dataTask성공() {
        //given
        var result = ""
        let query = "health"
        let maxCount = 1
        let expectation = expectation(description: "비동기테스트")
        
        //when
        cancellable = stubService.getAppInfoData(query: query, maxCount: maxCount)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
                expectation.fulfill()
            } receiveValue: { info in
                result = info[0].artistName
            }
        wait(for: [expectation], timeout: 3)
        
        //then
        XCTAssertEqual(result, "휴레이포지티브")
    }
    
    func test_stubService_dataTask실패() {
        //given
        let query = "health"
        let maxCount = 20
        stubNetworkManager = StubNetworkManager(isSuccess: false)
        let expectation = expectation(description: "비동기테스트")
        
        //when
        cancellable = stubService.getAppInfoData(query: query, maxCount: maxCount)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    //then
                    XCTAssertThrowsError(error)
                case .finished:
                    break
                }
                expectation.fulfill()
            } receiveValue: { _ in
               
            }
        wait(for: [expectation], timeout: 3)
    }
}
