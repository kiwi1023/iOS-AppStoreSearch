//
//  APIRequestProtocol.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

protocol APIRequestProtocol {
    var method: HTTPMethod { get }
    var urlHost: URLHost { get }
    var headers: [String: String]? { get }
    var query: HTTPQuery? { get }
    var body: Data? { get }
    var path: HTTPPath { get }
}

extension APIRequestProtocol {
    var url: URL? {
        var urlComponents = URLComponents(string: urlHost.url + path.value)
        urlComponents?.queryItems = query?.quary.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        return urlComponents?.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.type
        headers?.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return urlRequest
    }
}
