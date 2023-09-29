//
//  URL + Extension.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import Foundation

extension URL {
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
    
    func isVerticalImage() -> Bool? {
        guard let size = self.getScreenShotRatio() else { return nil }
        
        return size.width < size.height
    }
}
