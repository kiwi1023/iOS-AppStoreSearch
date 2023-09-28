//
//  APIConfiguration.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    case delete
    case patch
    case put
    
    var type: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .patch:
            return "PATCH"
        case .put:
            return "PUT"
        }
    }
}

enum URLHost {
    case appInfo
    
    var url: String {
        switch self {
        case .appInfo:
            return "https://itunes.apple.com"
        }
    }
}

enum HTTPQuery {
    case searchApp(_ quary: String,_ countLimit: Int)
    
    var quary: [String: String] {
        switch self {
        case .searchApp(let query, let countLimit):
            return [
                "term": query,
                "media": "software",
                "country": "KR",
                "limit": "\(countLimit)"
              ]
        }
    }
}

enum HTTPPath {
    case appInfo
    
    var value: String {
        switch self {
        case .appInfo:
            return "/search"
        }
    }
}
