//
//  AppInfoDTO.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//

import Foundation

struct AppInfoDTO: Decodable {
    let trackId: Int
    let trackName: String
    let description: String
    let screenshotUrls: [URL]
    let advisories: [String]
    let supportedDevices: [String]
    let releaseDate: String
    let releaseNotes: String?
    let currentVersionReleaseDate: String
    let version: String
    let artistName: String
    let genres: [String]
    let trackViewUrl: String?
    let contentAdvisoryRating: String
    let averageUserRating: Double
    let userRatingCount: Int
    let artworkUrl60: URL?
    let artworkUrl100: URL?
    let fileSizeBytes: String
    let languageCodesISO2A: [String]?
}

extension AppInfoDTO {
    func toAppInfo() -> AppInfo {
        return .init(trackId: trackId,
                     trackName: trackName,
                     description: description,
                     screenshotUrls: screenshotUrls,
                     releaseNotes: releaseNotes,
                     currentReleaseDate: currentVersionReleaseDate,
                     version: version,
                     artistName: artistName,
                     firstGenre: genres[0],
                     trackViewUrl: trackViewUrl,
                     contentAdvisoryRating: contentAdvisoryRating,
                     averageUserRating: averageUserRating,
                     userRatingCount: userRatingCount,
                     artworkUrl60: artworkUrl60,
                     artworkUrl100: artworkUrl100,
                     fileSizeBytes: fileSizeBytes)
    }
}
