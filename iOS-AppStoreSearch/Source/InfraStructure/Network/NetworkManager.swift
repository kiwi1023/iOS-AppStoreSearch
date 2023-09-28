//
//  NetworkManager.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation
import Combine

final class NetworkManager: NetworkManagerProtocol {
    func AppStoreDataTask<T: Decodable>(with request: APIRequestProtocol) -> AnyPublisher<T, Error> {
        guard let url = request.url else {
            return Fail<T, Error>(error: APIError.request)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 &&
                        response.statusCode < 300 else {
                    throw APIError.response
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .share()
            .eraseToAnyPublisher()
    }
}
