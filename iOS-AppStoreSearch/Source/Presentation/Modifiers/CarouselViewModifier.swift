//
//  CarouselViewModifier.swift
//  iOS-AppStoreSearch
//
//  Created by Kiwon Song on 2023/09/29.
//

import SwiftUI

struct CarouselViewModifier: ViewModifier {
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    var initialIndex: Int
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat = 8.0, initialIndex: Int = 0) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        self.initialIndex = initialIndex
        
        let contentWidth = Self.contentWidth(items: items, width: itemWidth, spacing: itemSpacing)
        let screenWidth = UIScreen.main.bounds.width
        let startingPointOffset = (contentWidth/2.0) - (screenWidth/2.0)
        let initialOffset = startingPointOffset + itemSpacing
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    private static func contentWidth(items: Int, width: CGFloat, spacing: CGFloat) -> CGFloat {
        CGFloat(items) * width + CGFloat(items - 1) * spacing
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(
                DragGesture()
                    .onChanged{ event in
                        dragOffset = event.translation.width
                    }
                    .onEnded { event in
                        scrollOffset += event.translation.width
                        dragOffset = 0
                        
                        let contentWidth = Self.contentWidth(items: items, width: itemWidth, spacing: itemSpacing)
                        let screenWidth = UIScreen.main.bounds.width
                        let center = scrollOffset  + (contentWidth / 2.0)
                        var index = center / (itemWidth + itemSpacing)
                        
                        if index.remainder(dividingBy: 1) > 0.5 {
                            index += 1
                        } else {
                            index = CGFloat(Int(index))
                        }
                        
                        index = min(index, CGFloat(items) - 1)
                        index = max(index, 0)
                        
                        let rightWidth = index * itemWidth + index * itemSpacing
                        var adjustmentOffset: CGFloat
                        
                        if index == 0 { adjustmentOffset = itemSpacing
                        } else {
                            adjustmentOffset = (screenWidth - itemWidth) - itemSpacing
                        }
                        
                        let initialOffset = (contentWidth / 2.0) - (screenWidth / 2.0) + adjustmentOffset
                        let newOffset = rightWidth - initialOffset
                        
                        withAnimation(.easeInOut) {
                            scrollOffset = newOffset
                        }
                    }
            )
    }
}

extension View {
    func makeCarousel(items: Int, itemWidth: CGFloat, spacing: CGFloat) -> some View {
        modifier(CarouselViewModifier(items: items, itemWidth: itemWidth, itemSpacing: spacing))
    }
}
