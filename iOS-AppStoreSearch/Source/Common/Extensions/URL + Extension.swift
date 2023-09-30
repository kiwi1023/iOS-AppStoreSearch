//
//  URL + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation

extension URL {
    /// 스크린샷 이미지의 가로와 세로 비율을 계산하여 CGSize로 반환합니다.
    /// - Returns: 가로와 세로 비율을 나타내는 CGSize, 계산할 수 없는 경우 nil을 반환합니다.
    func getScreenShotRatio() -> CGSize? {
        guard let lastPathComponent = self.pathComponents.last else { return nil }
        guard let imageSize = lastPathComponent.split(separator: "bb").first else { return nil }
        
        let array = String(imageSize).split(separator: "x")
        
        guard let first = array.first,
              let second = array.last,
              let width = Double(first),
              let height = Double(second) else {
            return nil
        }
        
        return CGSize(width: width, height: height)
    }
    
    /// 이미지의 가로 길이와 세로 길이의 비율을 계산하여 반환합니다.
    /// - Returns: 이미지의 가로와 세로 길이 비율을 나타내는 CGFloat, 계산할 수 없는 경우 nil을 반환합니다.
    func getImageLength() -> CGFloat? {
        guard let lastPathComponent = self.pathComponents.last else { return nil }
        guard let imageSize = lastPathComponent.split(separator: "bb").first else { return nil }
        
        let array = String(imageSize).split(separator: "x")
        
        guard let first = array.first,
              let second = array.last,
              let width = Double(first),
              let height = Double(second) else {
            return nil
        }
        
        return CGFloat(width / height)
    }
    
    /// 이미지가 세로 방향인지 여부를 판단합니다.
    /// - Returns: 이미지가 세로 방향이면 true, 아니면 false를 반환합니다. 판단할 수 없는 경우 nil을 반환합니다.
    func isVerticalImage() -> Bool? {
        guard let size = self.getScreenShotRatio() else { return nil }
        
        return size.width < size.height
    }
}
