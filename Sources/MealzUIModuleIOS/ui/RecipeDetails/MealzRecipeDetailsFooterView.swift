//
//  MealzRecipeDetailsFooterView.swift
//
//
//  Created by didi on 6/19/23.
//

import SwiftUI
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzRecipeDetailsFooterView: RecipeDetailsFooterProtocol {
    
    public init() {}
    let dimension = Dimension.sharedInstance
    
    public func content(params: RecipeDetailsFooterParameters) -> some View {
        var lockButton: Bool {
            return params.priceStatus == ComponentUiState.locked
            || params.priceStatus == ComponentUiState.loading
            || params.isAddingAllIngredients
        }
        return HStack(spacing: 0) {
            if params.cookOnlyMode {
                CookOnlyModeFooter(
                    recipeStickerPrice: params.recipeStickerPrice,
                    numberOfGuests: params.numberOfGuests)
            } else {
            if lockButton {
                ProgressLoader(color: .primary, size: 24)
            } else {
                if params.totalPriceOfProductsAdded > 0 {
                    PriceInMyBasket(totalPriceInBasket: params.totalPriceOfProductsAdded.currencyFormatted)
                }
            }
            Spacer()
                if params.isAddingAllIngredients || lockButton {
                    LoadingButton()
                } else {
                    switch params.ingredientsStatus.type {
                    case .noMoreToAdd:
                        ContinueMyShoppingCTA(
                            callToAction: params.callToAction,
                            buttonText: Localization.recipeDetails.continueShopping.localised,
                            disableButton: lockButton)
                    default:
                        MealzAddAllToBasketCTA(
                            callToAction: params.callToAction,
                            buttonText: String(format: String.localizedStringWithFormat(
                                Localization.ingredient.addProduct(numberOfProducts: params.ingredientsStatus.count).localised,
                                params.ingredientsStatus.count),
                                               params.ingredientsStatus.count).appending(" (\(params.totalPriceOfRemainingProducts.currencyFormatted))"),
                            disableButton: lockButton)
                    }
                }
            }
        }
        .padding(Dimension.sharedInstance.lPadding)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color.white)
    }
    
    internal struct CookOnlyModeFooter: View {
        private let recipeStickerPrice: Double
        private let numberOfGuests: Int
        init(recipeStickerPrice: Double, numberOfGuests: Int) {
            self.recipeStickerPrice = recipeStickerPrice
            self.numberOfGuests = numberOfGuests
        }
        var body: some View {
            HStack {
                Spacer()
                if recipeStickerPrice == 0 {
                    EmptyView()
                } else { MealzPricePerPerson(pricePerGuest: recipeStickerPrice / Double(numberOfGuests)) }
                Spacer()
            }
        }
    }
    
    internal struct LoadingButton: View {
        var body: some View {
            Button(action: {}, label: {
                ProgressLoader(color: .white, size: 24)
            })
            .padding(Dimension.sharedInstance.mlPadding)
            .background(Color.mealzColor(.primary))
            .cornerRadius(Dimension.sharedInstance.buttonCornerRadius)
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
            .padding(Dimension.sharedInstance.mlPadding)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: Dimension.sharedInstance.buttonCornerRadius)
                    .stroke(Color.mealzColor(.primary), lineWidth: 1)
            )
            .disabled(disableButton)
            .darkenView(disableButton)
        }
    }
}
