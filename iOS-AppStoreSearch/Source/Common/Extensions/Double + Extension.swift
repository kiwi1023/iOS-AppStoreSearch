//
//  Double + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation

extension Double {
    func rounded(to places: Int) -> String {
        let divisor = pow(10.0, Double(places))
        let roundedValue = (self * divisor).rounded() / divisor
        return String(format: "%.1f", roundedValue)
    }
    
    /// 평균 사용자 평가를 텍스트로 반환합니다.
    /// - Returns: 평균 사용자 평가를 텍스트로 반환합니다.
    func getAverageUserRatingText() -> String {
        self.rounded(to: 1)
    }
}
