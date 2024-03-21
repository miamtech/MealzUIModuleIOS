//
//  MealzPreferencesTagsListView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzPreferencesTagsListView: View {
    let title: String
    let subtitle: String
    let tags: [CheckableTag]
    let geometry: GeometryProxy
    let onToggleTag: (CheckableTag) -> Void
    let onAddTagTapped: () -> Void

    public init(
        title: String,
        subtitle: String,
        tags: [CheckableTag],
        geometry: GeometryProxy,
        onToggleTag: @escaping (CheckableTag) -> Void,
        onAddTagTapped: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.tags = tags
        self.geometry = geometry
        self.onToggleTag = onToggleTag
        self.onAddTagTapped = onAddTagTapped
    }

    public var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
                    .padding(.top, Dimension.sharedInstance.mPadding)
                Text(subtitle)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                    .padding(.bottom, Dimension.sharedInstance.mPadding)

                displayTags(in: geometry)
            }
    }

    public func displayTags(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.tag.id) { tag in
                MealzPreferenceTagView(
                    tag: tag,
                    onToggleTag: { tag in
                        onToggleTag(tag)
                    })
                .padding([.horizontal, .vertical], 4)
                .alignmentGuide(.leading, computeValue: { dimension in
                    if abs(width - dimension.width) > geometry.size.width {
                        width = 0
                        height -= dimension.height
                    }
                    let result = width
                    if let firstTag = self.tags.first, tag == firstTag {
                        width = 0 // last item
                    } else {
                        width -= dimension.width
                    }
                    return result
                })
                .alignmentGuide(.top, computeValue: {_ in
                    let result = height
                    if let firstTag = self.tags.first, tag == firstTag {
                        height = 0 // last item
                    }
                    return result
                })
            }
            MealzAddTagView(onTapped: {
                onAddTagTapped()
            })
            .padding([.horizontal, .vertical], 4)
            .alignmentGuide(.leading, computeValue: { dimension in
                if abs(width - dimension.width) > geometry.size.width {
                    width = 0
                    height -= dimension.height
                }
                let result = width
                width = 0
                return result
            })
            .alignmentGuide(.top, computeValue: {_ in
                let result = height
                height = 0
                return result
            })
        }
    }
}
