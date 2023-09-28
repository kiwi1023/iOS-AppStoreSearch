//
//  String + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

extension String {
    /// 이 메서드는 ISO 언어 코드를 통해 해당 언어의 이름을 반환합니다.
    func languageNameFromISOCode() -> String? {
        let locale = Locale(identifier: "KO")
        return locale.localizedString(forLanguageCode: self)
    }
}
