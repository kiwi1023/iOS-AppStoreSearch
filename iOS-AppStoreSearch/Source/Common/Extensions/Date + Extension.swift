//
//  Date + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

extension Date {
    /// Date를 주어진 형식에 따라 문자열로 변환합니다.
    /// - Parameter format: 날짜 포맷을 나타내는 DateFormat 열거형 값.
    /// - Returns: 주어진 포맷에 따라 변환된 날짜 문자열.
    func toString(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format.rawValue
      
        // 사용자 기기의 로케일을 가져와서 설정합니다.
        let localeID = Locale.preferredLanguages.first
        let deviceLocale = Locale(identifier: localeID ?? "ko-kr").language.languageCode?.identifier
        
        formatter.locale = Locale(identifier: deviceLocale ?? "ko-kr")
      
        return formatter.string(from: self)
    }
    
    private static let pastDayFormatter: DateComponentsFormatter = {
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
      formatter.maximumUnitCount = 1
      formatter.unitsStyle = .abbreviated
      var calender = Calendar.current
      calender.locale = Locale(identifier: "ko")
      formatter.calendar = calender
      return formatter
    }()
    
    /// 현재 날짜와 비교하여 지난 시간을 약식으로 반환합니다.
    /// - Returns: 현재 날짜와 비교하여 지난 시간을 나타내는 문자열.
    func getPastDay() -> String {
        return Self.pastDayFormatter.string(from: self, to: Date()) ?? ""
    }
}

// 날짜 포맷을 정의하는 열거형입니다.
enum DateFormat: String {
    case hourMinute = "a h:mm"
    case hourMinuteDate = "a h:mm (M/d)"
    case yyyyMMddEEEE = "yyyy. MM. dd. EEEE"
    case month = "M"
    case day = "d"
    case week = "E"
    case yearAndMonth = "yyyy년 M월"
    case log = "yyyy-MM-dd HH:mm:ss"
}
