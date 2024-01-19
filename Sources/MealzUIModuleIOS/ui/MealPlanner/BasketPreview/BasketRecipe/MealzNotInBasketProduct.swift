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
                Text(params.item.name.capitalizingFirstLetter())
                    .padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                if let ingredientQuantity = params.item.attributes?.quantity, let unit = params.item.selectedItem?.attributes?.capacityUnit {
                    Text(String(format: "%g \(unit)", Float(truncating: ingredientQuantity)))
                        .padding(Dimension.sharedInstance.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }.frame(height:40)
            Text(Localization.ingredient.willNotBeAdded.localised).padding(Dimension.sharedInstance.mPadding)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
            if let addIngredientAction = params.onAddToBasket {
                Button(action: addIngredientAction, label: {
                    Text(Localization.recipe.add.localised).padding(Dimension.sharedInstance.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.mealzColor(.primary))
                })
            }
        }
        .background(Color.mealzColor(.lightBackground))
            .cornerRadius(Dimension.sharedInstance.mCornerRadius)
            .padding(.horizontal, Dimension.sharedInstance.mPadding)
    }
}
