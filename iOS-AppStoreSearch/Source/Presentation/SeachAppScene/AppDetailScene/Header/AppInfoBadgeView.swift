import SwiftUI

private enum AppInfoBadgeViewConstants {
    // 뷰의 높이를 나타내는 상수
    static let viewHeight: CGFloat = 100
    // 뱃지의 최소 너비를 나타내는 상수
    static let badgeMinWidth: CGFloat = 100
    // 뱃지의 최대 너비를 나타내는 상수
    static let badgeMaxWidth: CGFloat = 105
    // 내용 뱃지의 너비를 나타내는 상수
    static let contentWidth: CGFloat = 80
    // 요소 사이의 간격을 나타내는 상수
    static let spacing: CGFloat = 8
    // 구분선 주위의 여백을 나타내는 상수
    static let dividerPadding: CGFloat = 8
    // Header 텍스트
    static let userRatingHeader = "사용자 평가"
    static let ageHeader = "연령"
    static let developerHeader = "개발자"
    static let languageHeader = "언어"
    // Footer 텍스트
    static let ageFooter = "세"
}

struct AppInfoBadgeView: View {
    var result: AppInfo
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ContentBadge(
                    header: AppInfoBadgeViewConstants.userRatingHeader,
                    content: {
                        StarRatingView(rating: result.averageUserRating)
                    },
                    footer: result.averageUserRating.getAverageUserRatingText()
                )
                Divider().padding(
                    .vertical,
                    AppInfoBadgeViewConstants.dividerPadding
                )
                
                TextBadge(
                    header: AppInfoBadgeViewConstants.ageHeader,
                    bodyText: result.contentAdvisoryRating,
                    footer: AppInfoBadgeViewConstants.ageFooter
                )
                Divider().padding(
                    .vertical,
                    AppInfoBadgeViewConstants.dividerPadding
                )
                
                ContentBadge(
                    header: AppInfoBadgeViewConstants.developerHeader,
                    content: {
                        Image(systemName: "person.crop.square")
                            .font(.title2)
                            .fontWeight(.bold)
                    },
                    footer: result.artistName
                )
                Divider().padding(
                    .vertical,
                    AppInfoBadgeViewConstants.dividerPadding
                )
                
                TextBadge(
                    header: AppInfoBadgeViewConstants.languageHeader,
                    bodyText: result.mainLanguage,
                    footer: result.mainLanguageDescription
                )
            }
            .frame(
                height: AppInfoBadgeViewConstants.viewHeight,
                alignment: .center
            )
        }
    }
}

struct TextBadge: View {
    private let header: String
    private let bodyText: String
    private let footer: String
    
    init(
        header: String,
        bodyText: String,
        footer: String
    ) {
        self.header = header
        self.bodyText = bodyText
        self.footer = footer
    }
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: AppInfoBadgeViewConstants.spacing
        ) {
            Text(header)
                .font(.caption)
            Text(bodyText)
                .font(.system(.title3,
                              design: .rounded,
                              weight: .bold))
            Text(footer)
                .font(.caption)
        }
        .frame(
            minWidth: AppInfoBadgeViewConstants.badgeMinWidth,
            maxWidth: AppInfoBadgeViewConstants.badgeMaxWidth
        )
        .foregroundColor(.secondary)
    }
}

struct ContentBadge<Content: View>: View {
    private let header: String
    private let content: () -> Content
    private let footer: String
    
    init(
        header: String,
        @ViewBuilder content: @escaping () -> Content,
        footer: String
    ) {
        self.header = header
        self.content = content
        self.footer = footer
    }
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: AppInfoBadgeViewConstants.spacing
        ) {
            Text(header)
                .font(.caption)
            
            content()
                .previewLayout(.sizeThatFits)
                .frame(width: AppInfoBadgeViewConstants.contentWidth)
            
            Text(footer)
                .font(.caption)
        }
        .frame(
            minWidth: AppInfoBadgeViewConstants.badgeMinWidth,
            maxWidth: AppInfoBadgeViewConstants.badgeMaxWidth
        )
        .foregroundColor(.secondary)
    }
}
