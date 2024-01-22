//
//  MealzSponsoredTag.swift
//
//
//  Created by Diarmuid McGonagle on 22/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzSponsoredTag: View {
    public init() {}
    public var body: some View {
        Text(Localization.basket.sponsored.localised)
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
            .foregroundColor(Color.mealzColor(.standardDarkText))
            .padding(Dimension.sharedInstance.mPadding)
            .background(
                Capsule()
                    .fill(Color.mealzColor(.standardLightText))
            )
            .overlay(
                    Capsule()
                        .stroke(Color.mealzColor(.standardDarkText), lineWidth: 1)
                )
    }
}
