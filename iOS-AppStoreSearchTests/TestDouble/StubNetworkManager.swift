//
//  StubNetworkManager.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation
import Combine
@testable import iOS_AppStoreSearch

final class StubNetworkManager: NetworkManagerProtocol {
    let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func AppStoreDataTask<T>(with request: iOS_AppStoreSearch.APIRequestProtocol) -> AnyPublisher<T, Error> where T : Decodable {
        guard let data = StubNetworkData(fileName: "AppInfoData").data else {
            return Fail<T,Error>(error: APIError.request)
                .eraseToAnyPublisher()
        }
        
        return Future<T, Error> { [weak self] promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                guard let self = self else { return }
                let appInfo = try! JSONDecoder().decode(T.self, from: data)
                
                if self.isSuccess {
                    promise(.success(appInfo))
                    
                    return
                }
                
                promise(.failure(APIError.response))
            }
        }
        .eraseToAnyPublisher()
    }
}
