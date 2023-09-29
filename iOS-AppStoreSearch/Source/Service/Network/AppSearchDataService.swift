//
//  AppSearchDataService.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation
import Combine

protocol AppSearchDataServiceProtocol {
    var networkManager: NetworkManagerProtocol { get }
    
    func getAppInfoData(query: String, maxCount: Int) -> AnyPublisher<[AppInfo], Error>
}

final class AppSearchDataService: AppSearchDataServiceProtocol {
    let networkManager: NetworkManagerProtocol
   
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getAppInfoData(query: String, maxCount: Int) -> AnyPublisher<[AppInfo], Error> {
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
