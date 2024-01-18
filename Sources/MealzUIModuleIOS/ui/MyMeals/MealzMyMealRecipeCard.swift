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
    public func content(
        recipeCardDimensions: CGSize,
        recipe: Recipe,
        numberOfGuests: Int,
        totalPrice: Double,
        numberOfProductsInRecipe: Int,
        onDeleteRecipe: @escaping () -> Void,
        onShowRecipeDetails: @escaping (String) -> Void
    ) -> some View {
        let pictureSize = recipeCardDimensions.height - (Dimension.sharedInstance.mlPadding * 2)
        
        func showTimeAndDifficulty() -> Bool {
            return recipeCardDimensions.height >= 320
        }
        
        func showCTA() -> Bool {
            return recipeCardDimensions.height >= 225
        }
        
        return VStack(alignment: .leading, spacing: 0) {
            HStack {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: pictureSize, height: pictureSize)
                            .cornerRadius(Dimension.sharedInstance.mCornerRadius)
                    }
                    MealzSmallGuestView(guests: numberOfGuests)
                        .padding(Dimension.sharedInstance.mPadding)
                }
                .frame(width: pictureSize, height: pictureSize)
                .clipped()
                Spacer()
                    .frame(width: Dimension.sharedInstance.mPadding)
                VStack(alignment: .leading, spacing: Dimension.sharedInstance.mPadding) {
                    HStack {
                        Text(recipe.title)
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleStyle)
                            .lineLimit(2)
                            .minimumScaleFactor(0.8)
                        Spacer()
                        Button {
                            onDeleteRecipe()
                        } label: {
                            Image.mealzIcon(icon: .trash)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.mealzColor(.grayText))
                        }
                    }
                    Text(String(numberOfProductsInRecipe) + " " + Localization.myMeals.products.localised)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .foregroundColor(Color.mealzColor(.grayText))
                    if let attributes = recipe.attributes {
                        PricePerPersonView(price: totalPrice, numberOfGuests: numberOfGuests)
                    }
                    Button(action: {
                        onShowRecipeDetails(recipe.id)
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
                }
                .frame(maxWidth: .infinity)
            }
            .padding(Dimension.sharedInstance.mPadding)
        }
        .onTapGesture {
            onShowRecipeDetails(recipe.id)
        }
        .padding(Dimension.sharedInstance.mPadding)
        .frame(height: recipeCardDimensions.height)
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
        recipeCardDimensions: CGSize(width: 400, height: 200),
        recipe: FakeRecipe().createRandomFakeRecipe(),
        numberOfGuests: 4,
        totalPrice: 34.2,
        numberOfProductsInRecipe: 2,
        onDeleteRecipe: {},
        onShowRecipeDetails: { _ in }
    )
}
