//
//  AppStoreRequest.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

struct AppStoreRequest: APIRequestProtocol {
    var method: HTTPMethod
    var urlHost: URLHost
    var headers: [String : String]?
    var query: HTTPQuery?
    var body: Data?
    var path: HTTPPath
}
