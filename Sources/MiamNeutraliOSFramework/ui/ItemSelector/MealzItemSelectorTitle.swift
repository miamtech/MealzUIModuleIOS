//
//  MealzItemSelectorTitle.swift
//
//
//  Created by Diarmuid McGonagle on 11/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzItemSelectorTitle: BaseTitleProtocol {
    public init() {}
    public func content(title: String, subtitle: String?) -> some View {
        HStack(spacing: 2) {
            Text(title.capitalizingFirstLetter() + " :")
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                .foregroundColor(Color.mealzColor(.primaryText))
            if let subtitle {
                Text(subtitle)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBoldStyle)
                    .foregroundColor(Color.mealzColor(.darkestBlue))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.mealzColor(.lightBackground))
        .cornerRadius(Dimension.sharedInstance.mCornerRadius)
        .padding(Dimension.sharedInstance.mPadding)
    }
}
