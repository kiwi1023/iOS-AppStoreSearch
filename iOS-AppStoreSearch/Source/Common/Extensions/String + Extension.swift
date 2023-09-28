//
//  String + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

extension String {
    func languageNameFromISOCode() -> String? {
        let locale = Locale(identifier: "KO")
        return locale.localizedString(forLanguageCode: self)
    }
}
