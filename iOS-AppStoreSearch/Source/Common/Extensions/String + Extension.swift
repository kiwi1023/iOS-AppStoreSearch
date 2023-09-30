//
//  String + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

extension String {
    /// ISO 언어 코드를 기반으로 해당 언어의 이름을 반환하는 메서드입니다.
    /// - Returns: ISO 언어 코드에 해당하는 언어의 이름, 없으면 nil을 반환합니다.
    func languageNameFromISOCode() -> String? {
        let locale = Locale(identifier: "KO")  // 기본 로케일 설정
        
        return locale.localizedString(forLanguageCode: self)
    }
    
    /// ISO 8601 형식의 날짜 문자열을 기반으로, 현재 날짜와 비교하여 지난 시간을 반환하는 메서드입니다.
    /// - Returns: 현재 날짜와 비교하여 지난 시간을 나타내는 문자열입니다.
    func getPastDayText() -> String {
        guard let date = ISO8601DateFormatter().date(from: self) else { return "" }
        
        return date.getPastDay()
    }
    
    /// 파일 크기를 문자열로 변환하는 메서드입니다.
    /// - Returns: 파일 크기를 나타내는 문자열입니다.
    func getFileSize() -> String {
        let formatter = ByteCountFormatter()
        let fileSize: Int64 = Int64(self) ?? 0
        
        return formatter.string(fromByteCount: fileSize)
    }
}
