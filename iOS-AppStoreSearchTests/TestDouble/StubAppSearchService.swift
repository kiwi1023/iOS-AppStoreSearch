//
//  StubAppSearchService.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation
import Combine
@testable import iOS_AppStoreSearch

final class StubAppSearchService: AppSearchDataServiceProtocol {
    var getAppInfoDataExcutions: [(String, Void)] = []
    
    var networkManager: iOS_AppStoreSearch.NetworkManagerProtocol
    
    init(networkManager: iOS_AppStoreSearch.NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getAppInfoData(query: String, maxCount: Int) -> AnyPublisher<[iOS_AppStoreSearch.AppInfo], Error> {
        getAppInfoDataExcutions.append((query,()))
        
        let request = AppStoreRequest(method: .get,
                                      urlHost: .appInfo,
                                      query: .searchApp(query,
                                                        maxCount),
                                      path: .appInfo)
        let manager: AnyPublisher<ResponseDTO, Error> = networkManager.AppStoreDataTask(with: request)
        
        return manager
            .map { $0.results.map { $0.toAppInfo() } }
            .eraseToAnyPublisher()
    }
}
