//
//  Int + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation

extension Int {
    /// 사용자 평가 횟수를 텍스트로 변환합니다.
    /// - Returns: 사용자 평가 횟수를 텍스트로 반환합니다.
    func getUserRatingCountText() -> String {
        if self > 10000 {
            let roundedNumber = Double(self) / 10000.0
            let numberText = String(format: "%.1f", roundedNumber)
            return "\(numberText)만개의 평가"
        }
        if self > 1000 {
            let roundedNumber = Double(self) / 1000.0
            let numberText = String(format: "%.1f", roundedNumber)
            return "\(numberText)천개의 평가"
        }
        
        return "\(self)개의 평가"
    }
}


