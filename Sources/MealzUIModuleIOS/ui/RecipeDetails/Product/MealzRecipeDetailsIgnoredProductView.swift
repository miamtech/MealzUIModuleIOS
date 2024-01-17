//
//  MealzRecipeDetailsIgnoredProductView.swift
//
//
//  Created by Diarmuid McGonagle on 10/01/2024.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsIgnoredProductView: RecipeDetailsIgnoredProductProtocol {
    
    public init() {}
    public func content(ingredientName: String, ingredientQuantity: String?, ingredientUnit: String?, onChooseProduct: @escaping () -> Void) -> some View {
        VStack {
            HStack {
                Text(ingredientName.capitalizingFirstLetter())
                    .padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyBigBoldStyle)
                Spacer()
                if let ingredientQuantity = ingredientQuantity, let qty = Float(ingredientQuantity), let unit = ingredientUnit {
                    Text(String(format: "%g \(unit)", qty))
                        .padding(Dimension.sharedInstance.mPadding)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
                }
            }.frame(height:40)
            Text(Localization.ingredient.willNotBeAdded.localised).padding(Dimension.sharedInstance.mPadding)
                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumStyle)
            Button(action: onChooseProduct, label: {
                Text(Localization.ingredient.chooseProduct.localised).padding(Dimension.sharedInstance.mPadding)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                    .foregroundColor(Color.mealzColor(.primary))
            })
        }.background(Color.mealzColor(.lightBackground))
            .cornerRadius(Dimension.sharedInstance.mCornerRadius)
            .padding(.horizontal, Dimension.sharedInstance.mPadding)
    }
}
