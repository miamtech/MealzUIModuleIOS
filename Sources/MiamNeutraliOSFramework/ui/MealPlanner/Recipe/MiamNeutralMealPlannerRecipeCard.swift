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
public struct MiamNeutralMealPlannerRecipeCard: MealPlannerRecipeCardProtocol {
    
    let dimensions = Dimension.sharedInstance
    public init() {}
    public func content(
        recipeCardDimensions: CGSize,
        recipe: Recipe,
        onShowRecipeDetails: @escaping (String) -> Void,
        onRemoveRecipeFromMealPlanner: @escaping () -> Void,
        onReplaceRecipeFromMealPlanner: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 0.0) {
            Divider()
            HStack(spacing: 0.0) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(0)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: recipeCardDimensions.height)
                    }.padding(0)
                    LikeButton(likeButtonInfo: LikeButtonInfo(recipeId: recipe.id))
                        .padding(dimensions.lPadding)
                }
                .padding(0)
                .frame(width: 150.0)
                .clipped()
                VStack(spacing: dimensions.sPadding) {
                    Text(recipe.title + "\n")
                        .miamFontStyle(style: MiamFontStyleProvider().bodyMediumBoldStyle)
                        .lineLimit(2)
                        .minimumScaleFactor(0.9)
                        .multilineTextAlignment(.leading)
                    HStack(spacing: dimensions.sPadding) {
                        MiamNeutralRecipeDifficulty(difficulty: recipe.difficulty)
                        MiamNeutralRecipePreparationTime(duration: recipe.cookingTimeIos)
                    }
                    HStack {
                        Text(Localization.basket.swapProduct.localised)
                            .foregroundColor(Color.mealzColor(.primary))
                            .miamFontStyle(style: MiamFontStyleProvider().bodyMediumBoldStyle)
                            .padding(dimensions.lPadding)
                            .onTapGesture {
                                onReplaceRecipeFromMealPlanner()
                            }
                        if #unavailable(iOS 15.0) {
                            Image.mealzIcon(icon: .trash)
                                .padding(dimensions.mPadding)
                                .onTapGesture {
                                    onRemoveRecipeFromMealPlanner()
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding([.leading, .trailing], dimensions.lPadding)
            }
            Divider()
        }
        .onTapGesture {
            onShowRecipeDetails(recipe.id)
        }
        .frame(maxWidth: .infinity)
        .frame(height: recipeCardDimensions.height)
    }
}

@available(iOS 14, *)
struct MiamNeutralBudgetRecipeCardPreview: PreviewProvider {
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
            difficulty: 3)
        let recipe = RecipeFakeFactory().create(
            id: "234",
            attributes: recipeAttributes,
            relationships: nil)
        MiamNeutralMealPlannerRecipeCard().content(
            recipeCardDimensions: CGSize(),
            recipe: recipe,
            onShowRecipeDetails: { _ in },
            onRemoveRecipeFromMealPlanner: {},
            onReplaceRecipeFromMealPlanner: {})
    }
}
