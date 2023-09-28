//
//  ImageLoadManager.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import SwiftUI
import Combine

class ImageLoadManager: ObservableObject {
    @Published var image = UIImage(named: "camera")

    private let manager = ImageCacheManager.shared
    private var cancellables = Set<AnyCancellable>()

    func fetch(url: URL?) {
        guard let url = url else { return }
       
        manager.load(url: url)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            .store(in: &cancellables)
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
