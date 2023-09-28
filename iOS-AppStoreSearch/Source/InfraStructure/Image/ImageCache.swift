//
//  ImageCache.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation
import UIKit.UIImage
import Combine

protocol ImageCacheProtocol: AnyObject {
    func image(for url: URL) -> UIImage?
    func insertImage(_ image: UIImage?, for url: URL)
    func removeImage(for url: URL)
    func removeAllImages()
    subscript(_ url: URL) -> UIImage? { get set }
}

private enum Constants {
    static let initialByteLimit = 500 * megaByteUnit
    static let megaByteUnit = 1024 * 1024
}

final class ImageCache: ImageCacheProtocol {
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.totalCostLimit = Constants.initialByteLimit
        return cache
    }()
    
    func image(for url: URL) -> UIImage? {
        if let image = imageCache.object(forKey: url as AnyObject) as? UIImage {
            return image
        }
        
        return nil
    }

    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image = image else { return removeImage(for: url) }
        
        let imageSizeInBytes = image.pngData()?.count ?? 0
        imageCache.setObject(image, forKey: url as AnyObject, cost: imageSizeInBytes)
    }

    func removeImage(for url: URL) {
        imageCache.removeObject(forKey: url as AnyObject)
    }

    func removeAllImages() {
        imageCache.removeAllObjects()
    }

    subscript(_ key: URL) -> UIImage? {
        get {
            return image(for: key)
        } set {
            return insertImage(newValue, for: key)
        }
    }
}
