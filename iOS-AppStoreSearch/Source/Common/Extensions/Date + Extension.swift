//
//  Date + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

extension Date {
    /// 날짜를 문자열로 변환하는 메서드.
    func toString(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format.rawValue
      
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
    
    func getPastDay() -> String {
        return Self.pastDayFormatter.string(from: self, to: Date()) ?? ""
    }
}


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
