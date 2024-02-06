//
//  MealzRecipeCardLoading.swift
//  MiamIOSFramework
//
//  Created by Vincent Kergonna on 29/05/2023.
//  Copyright © 2023 Miam. All rights reserved.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzRecipeCardLoading: RecipeCardLoadingProtocol {
    public init() {}
    public func content(params: RecipeCardLoadingParameters) -> some View {
        let dimensions = Dimension.sharedInstance
        let callToActionHeight: CGFloat = 70
        let pictureHeight = params.recipeCardDimensions.height - callToActionHeight
        
        return VStack(spacing: 0.0) {
            Rectangle()
                .fill(Color.mealzColor(.lightBackground))
                .padding(0)
                .frame(width: params.recipeCardDimensions.width, height: pictureHeight)
            HStack {
                RoundedRectangle(cornerRadius: dimensions.mCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: 40, height: 40)
                Spacer()
                RoundedRectangle(cornerRadius: dimensions.mCornerRadius)
                    .fill(Color.mealzColor(.lightBackground))
                    .frame(width: 100, height: 40)
            }
            .frame(height: callToActionHeight)
            .padding(.horizontal, Dimension.sharedInstance.mlPadding)
        }
        .frame(width: params.recipeCardDimensions.width, height: params.recipeCardDimensions.height)
        .cornerRadius(12.0)
    }
}

@available(iOS 14, *)
struct RecipeCardLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        MealzRecipeCardLoading().content(
            params: RecipeCardLoadingParameters(recipeCardDimensions: CGSize(width: 100, height: 200)))
    }
}
