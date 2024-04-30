//
//  MealzMyMealsTitle.swift
//
//
//  Created by Diarmuid McGonagle on 01/02/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzMyMealsTitle: BaseTitleProtocol {
    public init() {}
    public func content(params: TitleParameters) -> some View {
        Text(params.title)
            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
            .foregroundColor(Color.mealzColor(.primaryText))
    }
}
