//
//  MealzNotInBasketProduct.swift
//
//
//  Created by didi on 02/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzNotInBasketProduct: NotInBasketProductProtocol {
    public init() {}
    public func content(params: NotInBasketProductParameters) -> some View {
        VStack {
            HStack {
                Text(params.ingredientName.capitalizingFirstLetter())
                    .padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                Text(QuantityFormatter.companion.readableFloatNumber(
                    value: QuantityFormatter.companion.realQuantities(
                        quantity: params.ingredientQuantity,
                        currentGuest: Int32(params.guestsCount),
                        recipeGuest: Int32(params.defaultRecipeGuest)
                    ),
                    unit: params.ingredientUnit))
                .padding(Dimension.sharedInstance.mPadding)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                
            }.frame(height:40)
            Text(Localization.ingredient.willNotBeAdded.localised).padding(Dimension.sharedInstance.mPadding)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
            if let addIngredientAction = params.onAddToBasket {
                Button(action: addIngredientAction, label: {
                    Text(Localization.ingredient.chooseProduct.localised).padding(Dimension.sharedInstance.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                })
                .background(Color.mealzColor(.white))
                .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
                .padding(Dimension.sharedInstance.mPadding)
            }
        }
        .background(Color.mealzColor(.lightBackground))
        .cornerRadius(Dimension.sharedInstance.mCornerRadius)
        .padding(.horizontal, Dimension.sharedInstance.mPadding)
    }
}
