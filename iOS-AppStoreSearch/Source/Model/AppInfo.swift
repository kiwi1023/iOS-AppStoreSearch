//
//  AppInfo.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/28.
//


import Foundation

struct AppInfo: Hashable {
    // 앱 식별 ID
    let trackId: Int
    // 앱 이름
    let trackName: String
    // 앱 상세 설명
    let description: String
    // 앱 스크린샷 이미지 URL 배열
    let screenshotUrls: [URL]
    // 최근 릴리즈 노트
    let releaseNotes: String?
    // 최근 업데이트 날짜
    let currentReleaseDate: String
    // 현재 앱 버전
    let version: String
    // 개발자 이름
    let artistName: String
    // 첫 번째 앱 장르
    let firstGenre: String
    // 앱 페이지 링크 URL
    let trackViewUrl: String?
    // 앱 사용 연령 제한 정보
    let contentAdvisoryRating: String
    // 사용자 평균 별점
    let averageUserRating: Double
    // 사용자 평가 갯수
    let userRatingCount: Int
    // 60x60 크기 로고 이미지 URL
    let artworkUrl60: URL?
    // 100x100 크기 로고 이미지 URL
    let artworkUrl100: URL?
    // 앱 파일 크기 (바이트)
    let fileSizeBytes: String
    // 대표 언어
    let mainLanguage: String
    // 대표 언어 한국어 설명
    let mainLanguageDescription: String
}

extension AppInfo: Identifiable {
    var id: Int { trackId } // 고유 식별자로 앱 식별 ID를 사용
}
