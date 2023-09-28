//
//  ResponseDTO.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

struct ResponseDTO: Decodable {
  let resultCount: Int
  let results: [AppInfoDTO]
}
