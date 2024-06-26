//
//  MiamBudgetRecipeCard.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 26/04/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzMealPlannerRecipeCard: MealPlannerRecipeCardProtocol {
    
    let dimensions = Dimension.sharedInstance
    public init() {}
    public func content(params: MealPlannerRecipeCardParameters) -> some View {
        VStack(spacing: 0.0) {
            Divider()
            HStack(spacing: 0.0) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: params.recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(0)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: params.recipeCardDimensions.height)
                    }.padding(0)
                    LikeButton(likeButtonInfo: LikeButtonInfo(recipeId: params.recipe.id))
                        .padding(dimensions.lPadding)
                }
                .padding(0)
                .frame(width: 150.0)
                .clipped()
                VStack(spacing: dimensions.mPadding) {
                    Text(params.recipe.title)
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(height: 50)
                    HStack(spacing: dimensions.sPadding) {
                        MealzRecipeDifficulty(difficulty: params.recipe.difficulty)
                        MealzRecipePreparationTime(duration: params.recipe.cookingTimeIos)
                    }
                    HStack {
                        Text(Localization.basket.swapProduct.localised)
                            .foregroundColor(Color.mealzColor(.primary))
                            .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyMediumBoldStyle)
                            .padding(dimensions.lPadding)
                            .onTapGesture {
                                params.onReplaceRecipeFromMealPlanner()
                            }
                        Spacer()
                        Image.mealzIcon(icon: .trash)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.mealzColor(.danger))
                            .padding(dimensions.mPadding)
                            .onTapGesture {
                                params.onRemoveRecipeFromMealPlanner()
                            }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding([.leading, .trailing], dimensions.lPadding)
            }
            Divider()
        }
        .onTapGesture {
            params.onShowRecipeDetails(params.recipe.id)
        }
        .frame(maxWidth: .infinity)
        .frame(height: params.recipeCardDimensions.height)
    }
}

@available(iOS 14, *)
struct MealzBudgetRecipeCardPreview: PreviewProvider {
    static var previews: some View {
        let recipeAttributes = RecipeAttributes(
            title: "Salade grecque sur deux lignes",
            recipeDescription: "Coconut based recipe",
            numberOfGuests: 4,
            preparationTime: 3000000000000,
            cookingTime: 3000000000000,
            restingTime: 3000000000000,
            computedCost: nil,
            mediaUrl: "https://hips.hearstapps.com/hmg-prod/images/is-coconut-oil-healthy-1650650710.jpg?crop=0.669xw:1.00xh;0.0637xw,0&resize=1200:*",
            difficulty: 3, price: RecipePricing(price: 34.0, serves: Int32(4), pricePerServe: 12.0))
        let recipe = RecipeFakeFactory().create(
            id: "234",
            attributes: recipeAttributes,
            relationships: nil)
        MealzMealPlannerRecipeCard().content(
            params: MealPlannerRecipeCardParameters(
                recipeCardDimensions: CGSize(),
                recipe: recipe,
                onShowRecipeDetails: { _ in },
                onRemoveRecipeFromMealPlanner: {},
                onReplaceRecipeFromMealPlanner: {})
        )
    }
}
