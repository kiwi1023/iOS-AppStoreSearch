//
//  AppDetailInfo.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

enum AppDetailInfo: CaseIterable {
  case developer
  case size
  case category
  case regulation

  var title: String {
    switch self {
    case .developer:
        return "제공자"
    case .size:
        return "크기"
    case .category:
        return "카테고리"
    case .regulation:
        return "연령 등급"
    }
  }

  func value(from result: AppInfo) -> String {
    switch self {
    case .developer:
        return result.artistName
    case .size:
        return result.fileSizeBytes.getFileSize()
    case .category:
        return result.firstGenre
    case .regulation:
        return result.contentAdvisoryRating
    }
  }
}

