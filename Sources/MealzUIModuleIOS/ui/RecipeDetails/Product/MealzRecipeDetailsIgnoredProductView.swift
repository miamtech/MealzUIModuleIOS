//
//  MealzRecipeDetailsIgnoredProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public struct MealzRecipeDetailsIgnoredProductView: RecipeDetailsIgnoredProductProtocol {
    
    public init() {}
    public func content(params: RecipeDetailsIgnoredProductParameters) -> some View {
        VStack {
            HStack {
                Text(params.ingredientName.capitalizingFirstLetter())
                    .padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                if let ingredientQuantity = params.ingredientQuantity,
                   let unit = params.ingredientUnit {
                    Text(QuantityFormatter.companion.readableFloatNumber(
                        value: QuantityFormatter.companion.realQuantities(
                            quantity: ingredientQuantity,
                            currentGuest: Int32(params.guestsCount),
                            recipeGuest: Int32(params.defaultRecipeGuest)
                        ),
                        unit: unit))
                        .padding(Dimension.sharedInstance.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }.frame(height:40)
            Text(Localization.ingredient.willNotBeAdded.localised).padding(Dimension.sharedInstance.mPadding)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
            Button(action: params.onChooseProduct, label: {
                Text(Localization.ingredient.chooseProduct.localised).padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                    .foregroundColor(Color.mealzColor(.primary))
            })
            .background(Color.mealzColor(.white))
            .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
            .padding(Dimension.sharedInstance.mPadding)
        }.background(Color.mealzColor(.lightBackground))
            .cornerRadius(Dimension.sharedInstance.mCornerRadius)
            .padding(.horizontal, Dimension.sharedInstance.mPadding)
    }
}
