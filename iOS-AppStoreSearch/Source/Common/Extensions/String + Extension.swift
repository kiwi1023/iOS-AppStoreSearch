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
    
    func getPastDayText() -> String {
        guard let date = ISO8601DateFormatter().date(from: self) else { return "" }
        
        return date.getPastDay()
    }
    
    func getFileSize() -> String {
        let formatter = ByteCountFormatter()
        let fileSyze: Int64 = Int64(self) ?? 0
        
        return formatter.string(fromByteCount: fileSyze)
    }
}
