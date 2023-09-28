//
//  APIError.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

enum APIError: Error {
    case request
    case response
    case invalidData
    case invalidUrl
    case parseError
}
