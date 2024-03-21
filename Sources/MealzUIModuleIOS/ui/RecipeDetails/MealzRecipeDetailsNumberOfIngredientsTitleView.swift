//
//  MealzRecipeDetailsNumberOfIngredientsTitleView.swift
//  
//
//  Created by Diarmuid McGonagle on 01/03/2024.
//

import SwiftUI
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsNumberOfIngredientsTitleView: BaseTitleProtocol {
    public init() {}
    public func content(params: TitleParameters) -> some View {
        return HStack {
            Text(params.title)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleBigStyle)
                .foregroundColor(Color.mealzColor(.standardDarkText))
            Spacer()
        }
        .padding(Dimension.sharedInstance.mPadding)
        .frame(maxWidth: .infinity)
    }
}
