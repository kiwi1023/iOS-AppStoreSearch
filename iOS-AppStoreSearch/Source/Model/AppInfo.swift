//
//  AppInfo.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

struct AppInfo: Hashable {
    let trackId: Int
    let trackName: String
    let description: String
    let screenshotUrls: [URL]
    let releaseNotes: String?
    let currentReleaseDate: String
    let version: String
    let artistName: String
    let firstGenre: String
    let trackViewUrl: String?
    let contentAdvisoryRating: String
    let averageUserRating: Double
    let userRatingCount: Int
    let artworkUrl60: URL?
    let artworkUrl100: URL?
    let fileSizeBytes: String
    let mainLanguage: String
    let mainLanguageDescription: String
}

extension AppInfo: Identifiable {
    var id: Int { trackId }
}
