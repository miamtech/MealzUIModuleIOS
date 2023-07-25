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
public struct MiamMealPlannerRecipeCard: MealPlannerRecipeCard {
    
    let dimensions = Dimension.sharedInstance
    let cardHeight = 200.0
    public init() {}
    public func content(recipeInfos: MiamIOSFramework.RecipeInfos, actions: BudgetRecipeCardActions) -> some View {
        VStack(spacing: 0.0) {
            Divider()
            HStack(spacing: 0.0) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: recipeInfos.recipe.pictureURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(0)
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                    }.padding(0)
                    LikeButton(recipeId: recipeInfos.recipe.id)
                        .padding(dimensions.lPadding)
                }
                .padding(0)
                .frame(width: 150.0)
                .clipped()
                VStack(spacing: dimensions.sPadding) {
                    Text(recipeInfos.recipe.title + "\n")
                        .miamFontStyle(style: MiamFontStyleProvider().bodyMediumBoldStyle)
                        .lineLimit(2)
                        .minimumScaleFactor(0.9)
                        .multilineTextAlignment(.leading)
                    HStack(spacing: dimensions.sPadding) {
                        MiamRecipeDifficulty(difficulty: recipeInfos.recipe.difficulty)
                        MiamRecipePreparationTime(duration: recipeInfos.recipe.cookingTimeIos)
                    }
                    HStack {
                        Text(Localization.basket.swapProduct.localised)
                            .foregroundColor(Color.miamColor(.primary))
                            .miamFontStyle(style: MiamFontStyleProvider().bodyMediumBoldStyle)
                            .padding(dimensions.lPadding)
                            .onTapGesture {
                                guard let replaceTapped = actions.replaceTapped else {
                                    return
                                }
                                replaceTapped()
                            }
                        if #unavailable(iOS 15.0) {
                            Image.miamNeutralImage(icon: .bin)
                                .padding(dimensions.mPadding)
                                .onTapGesture {
                                    guard let removeTapped = actions.removeTapped else {
                                        return
                                    }
                                    withAnimation {
                                        removeTapped()
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding([.leading, .trailing], dimensions.lPadding)
            }
            Divider()
        }
        .padding(0)
        .frame(maxWidth: .infinity)
        .frame(height: cardHeight)
    }
}

@available(iOS 14, *)
struct MiamBudgetRecipeCardPreview: PreviewProvider {
    static var previews: some View {
        let recipeAttributes = RecipeAttributes(title: "Salade grecque sur deux lignes",
                                                recipeDescription: "Coconut based recipe",
                                                numberOfGuests: 4,
                                                preparationTime: 3000000000000,
                                                cookingTime: 3000000000000,
                                                restingTime: 3000000000000, computedCost: nil,
                                                mediaUrl: "https://hips.hearstapps.com/hmg-prod/images/is-coconut-oil-healthy-1650650710.jpg?crop=0.669xw:1.00xh;0.0637xw,0&resize=1200:*",
                                                difficulty: 3)
        let recipe = RecipeFakeFactory().create(id: "234",
                                                attributes: recipeAttributes,
                                                relationships: nil)
        let recipeInfos = RecipeInfos(recipe: recipe,
                                      price: Price(price: 21.34, currency: "EUR"),
                                      isInBasket: false)
        MiamMealPlannerRecipeCard().content(recipeInfos: recipeInfos, actions:
                                                BudgetRecipeCardActions(
                                                    recipeTapped: { _ in},
                                                    removeTapped: {
                                                        print("Remove recipe card.")
                                                    },
                                                    replaceTapped: nil))
    }
}
