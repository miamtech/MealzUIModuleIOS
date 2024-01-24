//
//  MealzMyMealRecipeCard.swift
//
//
//  Created by miam x didi on 04/01/2024.
//

import Foundation
import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzMyMealRecipeCard: MyMealRecipeCardProtocol {
    public init() {}
    public func content(params: MyMealRecipeCardParameters) -> some View {
        let pictureSize = params.recipeCardDimensions.height - (Dimension.sharedInstance.mlPadding * 2)
        
        func showTimeAndDifficulty() -> Bool {
            return params.recipeCardDimensions.height >= 320
        }
        
        func showCTA() -> Bool {
            return params.recipeCardDimensions.height >= 225
        }
        
        return VStack(alignment: .leading, spacing: 0) {
            HStack {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: params.recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: pictureSize, height: pictureSize)
                            .cornerRadius(Dimension.sharedInstance.mCornerRadius)
                    }
                    MealzSmallGuestView(guests: params.numberOfGuests)
                        .padding(Dimension.sharedInstance.mPadding)
                }
                .frame(width: pictureSize, height: pictureSize)
                .clipped()
                Spacer()
                    .frame(width: Dimension.sharedInstance.mPadding)
                VStack(alignment: .leading, spacing: Dimension.sharedInstance.mPadding) {
                    HStack {
                        Text(params.recipe.title)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                            .lineLimit(2)
                            .minimumScaleFactor(0.8)
                        Spacer()
                        Button {
                            params.onDeleteRecipe()
                        } label: {
                            if params.isDeleting {
                                ProgressLoader(color: Color.mealzColor(.primary), size: 20)
                            } else {
                                Image.mealzIcon(icon: .trash)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.mealzColor(.grayText))
                            }
                        }
                    }
                    Text(String(params.numberOfProductsInRecipe) + " " + Localization.myMeals.products.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.mealzColor(.grayText))
                    PricePerPersonView(price: params.recipePrice, numberOfGuests: params.numberOfGuests)
                    Button(action: {
                        params.onShowRecipeDetails(params.recipe.id)
                    }, label: {
                        HStack {
                            Text(Localization.myMeals.seeProducts.localised)
                                .foregroundColor(Color.mealzColor(.primary))
                                .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                            Spacer()
                            Image.mealzIcon(icon: .arrow)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.mealzColor(.primary))
                        }
                    })
                    .padding(Dimension.sharedInstance.mPadding)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.mealzColor(.primary), lineWidth: 1)
                    )
                    .frame(maxHeight: 40)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(Dimension.sharedInstance.mPadding)
        }
        .onTapGesture {
            params.onShowRecipeDetails(params.recipe.id)
        }
        .padding(Dimension.sharedInstance.mPadding)
        .frame(height: params.recipeCardDimensions.height)
        .frame(maxWidth: .infinity)
        .cornerRadius(Dimension.sharedInstance.mCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: 12.0)
                .stroke(Color.mealzColor(.border), lineWidth: 1.0)
        )
        .padding(.horizontal, Dimension.sharedInstance.mPadding)
    }
    
    struct PricePerPersonView: View {
        var price: Double
        var numberOfGuests: Int

        private var pricePerPerson: Double {
            numberOfGuests != 0 ? price / Double(numberOfGuests) : 0.0
        }

        var body: some View {
            HStack(alignment: .bottom, spacing: 2) {
                Text(pricePerPerson.currencyFormatted)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                    .foregroundColor(Color.mealzColor(.standardDarkText))
                    .multilineTextAlignment(.leading)
                Text(Localization.myMeals.perPerson.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                    .foregroundColor(Color.mealzColor(.grayText))
            }
        }
    }
}

@available(iOS 14, *)
#Preview {
    MealzMyMealRecipeCard().content(
        params: MyMealRecipeCardParameters(
        recipeCardDimensions: CGSize(width: 400, height: 200),
        recipe: FakeRecipe().createRandomFakeRecipe(),
        numberOfGuests: 4,
        recipePrice: 34.2,
        numberOfProductsInRecipe: 2,
        isDeleting: false,
        onDeleteRecipe: {},
        onShowRecipeDetails: { _ in }
        )
    )
}
