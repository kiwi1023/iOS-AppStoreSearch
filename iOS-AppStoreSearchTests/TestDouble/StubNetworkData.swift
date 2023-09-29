//
//  StubNetworkData.swift
//  iOS-AppStoreSearchTests
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation

struct StubNetworkData {
    let data: Data?
    
    init(fileName: String) {
        let location = Bundle.main.url(forResource: fileName, withExtension: "json")
        self.data = try? Data(contentsOf: location!)
    }
}
