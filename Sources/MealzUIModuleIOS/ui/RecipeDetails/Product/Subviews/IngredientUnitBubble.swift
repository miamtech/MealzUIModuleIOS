//
//  IngredientUnitBubble.swift
//
//
//  Created by Diarmuid McGonagle on 22/01/2024.
//

import Foundation
import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct IngredientUnitBubble: View {
    private let capacity: String
    public init(capacity: String) {
        self.capacity = capacity
    }
    public var body: some View {
        Text(capacity)
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodySmallStyle)
            .foregroundColor(Color.mealzColor(.standardDarkText))
            .padding(Dimension.sharedInstance.mPadding)
            .background(Capsule().fill(Color.mealzColor(.lightBackground)))
    }
}
