//
//  MiamNeutralRecipeDetailsFooterView.swift
//
//
//  Created by didi on 6/19/23.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralRecipeDetailsFooterView: RecipeDetailsFooterProtocol {
    
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
            VStack(alignment: .leading, spacing: 1) {
                if priceStatus == ComponentUiState.loading {
                    ProgressLoader(color: .primary, size: 24)
                } else {
                    Text(pricePerGuest.currencyFormatted)
                        .foregroundColor(Color.mealzColor(.primary))
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    Text(Localization.price.perGuest.localised)
                        .foregroundColor(Color.mealzColor(.darkGray))
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
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
                AddAllToBasketCTA(
                    callToAction: callToAction,
                    buttonText: Localization.recipeDetails.addAllProducts.localised,
                    disableButton: lockButton)
            default:
                AddAllToBasketCTA(
                    callToAction: callToAction,
                    buttonText: Localization.ingredient.addProduct(
                        numberOfProducts: ingredientsStatus.count
                    ).localised,
                    disableButton: lockButton)
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color.white)
    }
    
    internal struct AddAllToBasketCTA: View {
        let callToAction: () -> Void
        let buttonText: String
        let disableButton: Bool
        
        var body: some View {
            Button(action: callToAction, label: {
                Image.mealzIcon(icon: .basket)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color.mealzColor(.white))
                    .frame(width: 24, height: 24)
                Text(buttonText)
                    .foregroundColor(Color.mealzColor(.white))
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.subtitleStyle)
            })
            .padding(Dimension.sharedInstance.lPadding)
            .background(Color.mealzColor(.primary))
            .cornerRadius(Dimension.sharedInstance.mPadding)
            .disabled(disableButton)
            .darkenView(disableButton)
        }
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
            .padding(Dimension.sharedInstance.lPadding)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: Dimension.sharedInstance.mCornerRadius)
                    .stroke(Color.mealzColor(.primary), lineWidth: 1)
            )
            .disabled(disableButton)
            .darkenView(disableButton)
        }
    }
}
