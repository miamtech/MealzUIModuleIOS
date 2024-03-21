//
//  MealzItemSelectorTitle.swift
//
//
//  Created by Diarmuid McGonagle on 11/01/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzItemSelectorTitle: BaseTitleProtocol {
    public init() {}
    public func content(params: TitleParameters) -> some View {
        HStack(spacing: 2) {
            Text(params.title.capitalizingFirstLetter() + " :")
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                .foregroundColor(Color.mealzColor(.standardDarkText))
            if let subtitle = params.subtitle {
                Text(subtitle)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                    .foregroundColor(Color.mealzColor(.primary))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.mealzColor(.lightBackground))
        .cornerRadius(Dimension.sharedInstance.mCornerRadius)
        .padding(Dimension.sharedInstance.mPadding)
    }
}
