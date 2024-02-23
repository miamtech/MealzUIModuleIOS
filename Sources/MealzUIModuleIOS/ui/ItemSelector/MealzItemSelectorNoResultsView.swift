//
//  MealzItemSelectorNoResultsView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzItemSelectorNoResultsView: ItemSelectorNoResultsProtocol {
    public init() {}
    public func content(params: ItemSelectorNoResultsParameters) -> some View {
        VStack {
            Image.mealzIcon(icon: .feelingBlue)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text(params.title)
                .foregroundColor(Color.mealzColor(.primary))
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleMediumStyle)
            if let subtitle = params.subtitle {
                Text(subtitle)
                    .foregroundColor(Color.mealzColor(.primaryText))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
            }
        }
    }
}
