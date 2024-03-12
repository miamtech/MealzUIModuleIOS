//
//  MealzRecipeDetailsTagsView.swift
//
//
//  Created by Damien Walerowicz on 03/01/2024.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzRecipeDetailsTagsView: View {
    private let tags: [RecipeDetailTags]
    
    public init(tags: [RecipeDetailTags]) {
        self.tags = tags
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tags, id: \.id) { tag in
                    HStack {
                        Image.mealzIcon(icon: tag.picto)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.mealzColor(.standardDarkText))
                        Text(tag.text)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                            .foregroundColor(Color.mealzColor(.standardDarkText))
                            .lineLimit(1)
                    }
                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                    .background(Capsule().fill(Color.mealzColor(.lightBackground)))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(Dimension.sharedInstance.lPadding)
        }
    }
}
