//
//  TabOption.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

enum TabOption: Int, CaseIterable {
    case today
    case game
    case app
    case update
    case search
}

extension TabOption {
    var systemName: String {
        switch self {
        case .today:
            return "doc.text.image"
        case .game:
            return "gamecontroller"
        case .app:
            return "square.stack.3d.up.fill"
        case .update:
            return "square.and.arrow.down.fill"
        case .search:
            return "magnifyingglass"
        }
    }
    
    var title: String {
        switch self {
        case .today:
            return "투데이"
        case .game:
            return "게임"
        case .app:
            return "앱"
        case .update:
            return "업데이트"
        case .search:
            return "검색"
        }
    }
}
