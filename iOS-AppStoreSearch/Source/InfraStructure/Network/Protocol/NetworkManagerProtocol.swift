//
//  NetworkManagerProtocol.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func AppStoreDataTask<T: Decodable>(with request: APIRequestProtocol) -> AnyPublisher<T, Error>
}

