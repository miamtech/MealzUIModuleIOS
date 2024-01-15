//
//  MiamNeutralNotInBasketProduct.swift
//
//
//  Created by didi on 02/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MiamNeutralNotInBasketProduct: NotInBasketProductProtocol {
    public init() {}
    public func content(item: BasketEntry, onAddToBasket: (() -> Void)?) -> some View {
        VStack {
            HStack {
                Text(item.name.capitalizingFirstLetter())
                    .padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                if let ingredientQuantity = item.attributes?.quantity, let unit = item.selectedItem?.attributes?.capacityUnit {
                    Text(String(format: "%g \(unit)", Float(truncating: ingredientQuantity)))
                        .padding(Dimension.sharedInstance.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }.frame(height:40)
            Text(Localization.ingredient.willNotBeAdded.localised).padding(Dimension.sharedInstance.mPadding)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
            if let addIngredientAction = onAddToBasket {
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
