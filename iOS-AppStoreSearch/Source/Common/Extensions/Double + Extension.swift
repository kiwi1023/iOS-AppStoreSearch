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
    
    func getAverageUserRatingText() -> String {
        self.rounded(to: 1)
    }
}
