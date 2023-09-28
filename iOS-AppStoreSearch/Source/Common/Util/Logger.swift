//
//  Logger.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

enum Logger {
    static func debug(
        error: Error,
        message: String,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        let file = file.components(separatedBy: ["/"]).last ?? ""
        print("\(Date().toString(.log)) [⛔️][\(file)][\(function)][\(line)] -> \(message)")
        debugPrint(error)
    }
}
