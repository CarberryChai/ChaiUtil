//
//  Tabs.swift
//  ChaiUtil
//
//  Created by changlin on 2024/9/2.
//
import SwiftUI

struct TabItemPreferenceData {
    let index: Int
    let bounds: Anchor<CGRect>
}

struct TabItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TabItemPreferenceData] = []
    static func reduce(
        value: inout [TabItemPreferenceData], nextValue: () -> [TabItemPreferenceData]
    ) {
        value.append(contentsOf: nextValue())
    }
}

struct Tabs<TabItem: Identifiable, Content: View>: View {
    @Binding var selectedIndex: Int
    let tabs: [TabItem]
    let content: (TabItem) -> Content
    @State private var indicatorOffset: CGFloat = 0
    @State private var indicatorWidth: CGFloat = 0

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { idx in
                content(tabs[idx])
                    .anchorPreference(
                        key: TabItemPreferenceKey.self, value: .bounds,
                        transform: {
                            [TabItemPreferenceData(index: idx, bounds: $0)]
                        }
                    )
                    .foregroundColor(selectedIndex == idx ? .blue : .gray)
                    .onTapGesture {
                        withAnimation {
                            selectedIndex = idx
                        }
                    }
            }
        }
        .overlayPreferenceValue(TabItemPreferenceKey.self, alignment: .bottom) { preferences in
            GeometryReader { geometry in
                Rectangle()
                    .fill(.blue)
                    .frame(width: indicatorWidth)
                    .offset(x: indicatorOffset, y: 0)
                    .animation(.spring, value: indicatorOffset)
                    .animation(.spring, value: indicatorWidth)
                    .onAppear {
                        updateIndicator(from: preferences, in: geometry)
                    }
                    .onChange(of: selectedIndex) {
                        withAnimation {
                            updateIndicator(from: preferences, in: geometry)
                        }
                    }
            }
            .frame(height: 2)
        }
    }

    private func updateIndicator(from preferences: [TabItemPreferenceData], in geometry: GeometryProxy) {
        guard let preference = preferences.first(where: { $0.index == selectedIndex }) else {
            return
        }
        let bounds = geometry[preference.bounds]
        indicatorOffset = bounds.minX
        indicatorWidth = bounds.width
    }
}
