//
//  MealzRecipeDetailsFooterView.swift
//
//
//  Created by didi on 6/19/23.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsFooterView: RecipeDetailsFooterProtocol {
    
    public init() {}
    let dimension = Dimension.sharedInstance
    
    public func content(
        price: Double, 
        pricePerGuest: Double,
        priceStatus: ComponentUiState,
        ingredientsStatus: IngredientStatus,
        callToAction: @escaping () -> Void
    ) -> some View {
        var lockButton: Bool {
            return priceStatus == ComponentUiState.locked || priceStatus == ComponentUiState.loading
        }
        return HStack(spacing: 0) {
            if lockButton {
                ProgressLoader(color: .primary, size: 24)
            } else {
                if price > 0 {
                    MealzPricePerPerson(pricePerGuest: pricePerGuest)
                }
            }
            Spacer()
            switch ingredientsStatus.type {
            case .noMoreToAdd:
                ContinueMyShoppingCTA(
                    callToAction: callToAction,
                    buttonText: Localization.recipeDetails.continueShopping.localised, 
                    disableButton: lockButton)
            case .initialState:
                MealzAddAllToBasketCTA(
                    callToAction: callToAction,
                    buttonText: Localization.recipeDetails.addAllProducts.localised,
                    disableButton: lockButton)
            default:
                MealzAddAllToBasketCTA(
                    callToAction: callToAction,
                    buttonText: String(format: String.localizedStringWithFormat(Localization.ingredient.addProduct(numberOfProducts: ingredientsStatus.count).localised, ingredientsStatus.count), ingredientsStatus.count),
                    disableButton: lockButton)
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color.white)
    }
    
    
    
    internal struct ContinueMyShoppingCTA: View {
        let callToAction: () -> Void
        let buttonText: String
        let disableButton: Bool
        
        var body: some View {
            Button(action: callToAction, label: {
                Text(buttonText)
                    .foregroundColor(Color.mealzColor(.primary))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
            })
            .padding(Dimension.sharedInstance.mlPadding)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius)
                    .stroke(Color.mealzColor(.primary), lineWidth: 1)
            )
            .disabled(disableButton)
            .darkenView(disableButton)
        }
    }
}
